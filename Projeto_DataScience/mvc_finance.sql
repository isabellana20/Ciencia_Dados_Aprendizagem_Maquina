/* =====================================================================
   MVC Finance – Análise CRISP-DM (dados simulados)
   Dialeto: PostgreSQL (o mesmo banco do MVC Finance, hospedado no Neon)
   Também roda no DuckDB, usado para conferir os resultados do README.

   Estrutura:
     0. Tabelas (modelo de dados do TCC, versão reduzida)
     1. Validações de qualidade (V1–V6)     -> Fase 2 do CRISP-DM
     2. View operacao_limpa                -> Fase 3 do CRISP-DM
     3. KPIs (KPI 1–KPI 7)                 -> Fase 2 (exploração)
     4. Consultas de apoio (A e B)         -> Fases 3 e 2
   ===================================================================== */


-- =====================================================================
-- 0. TABELAS
-- =====================================================================
CREATE TABLE "TipoOperacao" (
    "idTipoOperacao" INTEGER PRIMARY KEY,
    "tipoOperacao"   VARCHAR(20) NOT NULL          -- Depósito, Despesa, Investimento
);

CREATE TABLE "Categoria" (
    "idCategoria"    INTEGER PRIMARY KEY,
    "categoria"      VARCHAR(60) NOT NULL,
    "idTipoOperacao" INTEGER NOT NULL REFERENCES "TipoOperacao"
);

CREATE TABLE "MetodoPagamento" (
    "idMetodoPagamento" INTEGER PRIMARY KEY,
    "tipoPagamento"     VARCHAR(40) NOT NULL
);

-- No sistema real o plano fica no Clerk (publicMetadata.subscriptionPlan),
-- aqui ele foi exportado para uma coluna para permitir a análise.
CREATE TABLE "Usuario" (
    "emailUsuario"     VARCHAR(120) PRIMARY KEY,
    "subscriptionPlan" VARCHAR(10) NOT NULL,       -- gratuito | premium
    "totalXp"          INTEGER NOT NULL DEFAULT 0,
    "cursosConcluidos" INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE "Operacao" (
    "idOperacao"        INTEGER PRIMARY KEY,
    "usuarioId"         VARCHAR(120) NOT NULL REFERENCES "Usuario",
    "data"              DATE NOT NULL,
    "valor"             DECIMAL(10,2) NOT NULL,
    "idTipoOperacao"    INTEGER NOT NULL REFERENCES "TipoOperacao",
    "idCategoria"       INTEGER NOT NULL REFERENCES "Categoria",
    "idMetodoPagamento" INTEGER NOT NULL REFERENCES "MetodoPagamento"
);

-- Carga no PostgreSQL (psql), a partir da pasta do repositório:
-- \copy "TipoOperacao"    FROM 'mvc_finance_data/tipo_operacao.csv'    CSV HEADER
-- \copy "Categoria"       FROM 'mvc_finance_data/categoria.csv'        CSV HEADER
-- \copy "MetodoPagamento" FROM 'mvc_finance_data/metodo_pagamento.csv' CSV HEADER
-- \copy "Usuario"         FROM 'mvc_finance_data/usuario.csv'          CSV HEADER
-- \copy "Operacao"        FROM 'mvc_finance_data/operacao.csv'         CSV HEADER


-- =====================================================================
-- 1. VALIDAÇÕES DE QUALIDADE (base bruta)
-- =====================================================================

-- V1. Campos obrigatórios nulos (RN-O01)
SELECT COUNT(*) AS nulos
FROM "Operacao"
WHERE "valor" IS NULL OR "data" IS NULL OR "idTipoOperacao" IS NULL
   OR "idCategoria" IS NULL OR "idMetodoPagamento" IS NULL;

-- V2. Valores não positivos (RN-O02: valor sempre > 0)
SELECT COUNT(*) AS valores_nao_positivos
FROM "Operacao"
WHERE "valor" <= 0;

-- V3. Operações com data futura (extração em 31/12/2026)
SELECT COUNT(*) AS datas_futuras
FROM "Operacao"
WHERE "data" > DATE '2026-12-31';

-- V4. Categoria incoerente com o tipo da operação (o sistema não bloqueia: RN-O08)
SELECT t."tipoOperacao" AS tipo_lancado,
       tc."tipoOperacao" AS tipo_da_categoria,
       COUNT(*)          AS operacoes
FROM "Operacao" o
JOIN "Categoria"    c  ON c."idCategoria"     = o."idCategoria"
JOIN "TipoOperacao" t  ON t."idTipoOperacao"  = o."idTipoOperacao"
JOIN "TipoOperacao" tc ON tc."idTipoOperacao" = c."idTipoOperacao"
WHERE o."idTipoOperacao" <> c."idTipoOperacao"
GROUP BY 1, 2;

-- V5. Possíveis erros de digitação: valor > 10x a mediana do próprio usuário naquela categoria
--     (1ª versão comparava com a mediana geral da categoria e marcava investimentos legítimos
--      de quem investe muito — a comparação por usuário corrigiu isso)
WITH med AS (
    SELECT "usuarioId", "idCategoria",
           percentile_cont(0.5) WITHIN GROUP (ORDER BY "valor") AS mediana
    FROM "Operacao"
    GROUP BY "usuarioId", "idCategoria"
)
SELECT COUNT(*) AS suspeitas_digitacao
FROM "Operacao" o
JOIN med m ON m."usuarioId" = o."usuarioId" AND m."idCategoria" = o."idCategoria"
WHERE o."valor" > 10 * m.mediana;

-- V6. Usuário-meses do Plano Gratuito que atingiram o limite de 10 operações (RN-O04)
SELECT COUNT(*) AS usuario_meses_no_limite,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(DISTINCT ("usuarioId", date_trunc('month', "data")))
                                 FROM "Operacao" o2
                                 JOIN "Usuario" u2 ON u2."emailUsuario" = o2."usuarioId"
                                 WHERE u2."subscriptionPlan" = 'gratuito'), 1) AS perc_do_gratuito
FROM (
    SELECT o."usuarioId", date_trunc('month', o."data") AS mes
    FROM "Operacao" o
    JOIN "Usuario" u ON u."emailUsuario" = o."usuarioId"
    WHERE u."subscriptionPlan" = 'gratuito'
    GROUP BY 1, 2
    HAVING COUNT(*) >= 10
) x;


-- =====================================================================
-- 2. BASE LIMPA (Fase 3: selecionar e limpar)
--    - remove datas futuras
--    - corrige despesa lançada em categoria de outro tipo -> "Outras despesas" (id 15)
--    - corrige provável vírgula esquecida (valor > 10x a mediana do usuário na categoria) dividindo por 100
-- =====================================================================
CREATE VIEW operacao_limpa AS
WITH med AS (
    SELECT "usuarioId", "idCategoria",
           percentile_cont(0.5) WITHIN GROUP (ORDER BY "valor") AS mediana
    FROM "Operacao"
    GROUP BY "usuarioId", "idCategoria"
)
SELECT o."idOperacao",
       o."usuarioId",
       o."data",
       CASE WHEN o."valor" > 10 * m.mediana THEN ROUND(o."valor" / 100, 2) ELSE o."valor" END AS "valor",
       o."idTipoOperacao",
       CASE WHEN o."idTipoOperacao" = 2 AND c."idTipoOperacao" <> 2 THEN 15
            ELSE o."idCategoria" END AS "idCategoria",
       o."idMetodoPagamento"
FROM "Operacao" o
JOIN med m         ON m."usuarioId" = o."usuarioId" AND m."idCategoria" = o."idCategoria"
JOIN "Categoria" c ON c."idCategoria" = o."idCategoria"
WHERE o."data" <= DATE '2026-12-31';


-- =====================================================================
-- 3. KPIs (sobre a base limpa)
-- =====================================================================

-- KPI 1. Totais do ano por tipo de operação e saldo geral (RN-D02)
SELECT SUM(CASE WHEN "idTipoOperacao" = 1 THEN "valor" ELSE 0 END) AS total_depositos,
       SUM(CASE WHEN "idTipoOperacao" = 2 THEN "valor" ELSE 0 END) AS total_despesas,
       SUM(CASE WHEN "idTipoOperacao" = 3 THEN "valor" ELSE 0 END) AS total_investimentos,
       SUM(CASE WHEN "idTipoOperacao" = 1 THEN "valor" ELSE -"valor" END) AS saldo_geral
FROM operacao_limpa;

-- KPI 2. Média de operações registradas por usuário-mês, por plano
SELECT u."subscriptionPlan" AS plano,
       COUNT(*) AS usuario_meses,
       ROUND(AVG(x.qtd), 2) AS media_operacoes
FROM (
    SELECT "usuarioId", date_trunc('month', "data") AS mes, COUNT(*) AS qtd
    FROM operacao_limpa
    GROUP BY 1, 2
) x
JOIN "Usuario" u ON u."emailUsuario" = x."usuarioId"
GROUP BY 1
ORDER BY 1;

-- KPI 3. Top 5 categorias de despesa (valor e participação no total de despesas)
SELECT c."categoria",
       SUM(o."valor") AS total,
       ROUND(100.0 * SUM(o."valor") / SUM(SUM(o."valor")) OVER (), 1) AS perc_despesas
FROM operacao_limpa o
JOIN "Categoria" c ON c."idCategoria" = o."idCategoria"
WHERE o."idTipoOperacao" = 2
GROUP BY 1
ORDER BY total DESC
LIMIT 5;

-- KPI 4. Participação de cada método de pagamento nas despesas
SELECT mp."tipoPagamento",
       ROUND(100.0 * SUM(o."valor") / SUM(SUM(o."valor")) OVER (), 1) AS perc_despesas
FROM operacao_limpa o
JOIN "MetodoPagamento" mp ON mp."idMetodoPagamento" = o."idMetodoPagamento"
WHERE o."idTipoOperacao" = 2
GROUP BY 1
ORDER BY 2 DESC;

-- KPI 5. Despesa total por mês (identifica o maior e o menor mês)
SELECT CAST(date_trunc('month', "data") AS DATE) AS mes,
       SUM("valor") AS despesas
FROM operacao_limpa
WHERE "idTipoOperacao" = 2
GROUP BY 1
ORDER BY 1;

-- KPI 6. Percentual de usuário-meses com saldo negativo, por plano
SELECT u."subscriptionPlan" AS plano,
       COUNT(*) AS usuario_meses,
       ROUND(100.0 * AVG(CASE WHEN s.saldo < 0 THEN 1 ELSE 0 END), 1) AS perc_saldo_negativo
FROM (
    SELECT "usuarioId", date_trunc('month', "data") AS mes,
           SUM(CASE WHEN "idTipoOperacao" = 1 THEN "valor" ELSE -"valor" END) AS saldo
    FROM operacao_limpa
    GROUP BY 1, 2
) s
JOIN "Usuario" u ON u."emailUsuario" = s."usuarioId"
GROUP BY 1
ORDER BY 1;

-- KPI 7. Despesa registrada por usuário-mês, por plano (efeito do limite de 10 operações)
SELECT u."subscriptionPlan" AS plano,
       ROUND(AVG(x.despesas), 2) AS despesa_media_usuario_mes,
       ROUND(AVG(x.despesas / NULLIF(x.depositos, 0)), 2) AS despesa_sobre_renda
FROM (
    SELECT "usuarioId", date_trunc('month', "data") AS mes,
           SUM(CASE WHEN "idTipoOperacao" = 2 THEN "valor" ELSE 0 END) AS despesas,
           SUM(CASE WHEN "idTipoOperacao" = 1 THEN "valor" ELSE 0 END) AS depositos
    FROM operacao_limpa
    GROUP BY 1, 2
) x
JOIN "Usuario" u ON u."emailUsuario" = x."usuarioId"
GROUP BY 1
ORDER BY 1;


-- =====================================================================
-- 4. CONSULTAS DE APOIO
-- =====================================================================

-- A. Tabela analítica usuário-mês (base da modelagem — o notebook completa os percentuais por categoria)
SELECT o."usuarioId",
       CAST(date_trunc('month', o."data") AS DATE) AS mes,
       SUM(CASE WHEN o."idTipoOperacao" = 1 THEN o."valor" ELSE 0 END) AS total_depositos,
       SUM(CASE WHEN o."idTipoOperacao" = 2 THEN o."valor" ELSE 0 END) AS total_despesas,
       SUM(CASE WHEN o."idTipoOperacao" = 3 THEN o."valor" ELSE 0 END) AS total_investimentos,
       SUM(CASE WHEN o."idTipoOperacao" = 1 THEN o."valor" ELSE -o."valor" END) AS saldo_mes,
       SUM(CASE WHEN o."idTipoOperacao" = 2 AND o."idMetodoPagamento" = 1 THEN o."valor" ELSE 0 END)
         / NULLIF(SUM(CASE WHEN o."idTipoOperacao" = 2 THEN o."valor" ELSE 0 END), 0) AS perc_credito,
       COUNT(*) AS qtd_operacoes
FROM operacao_limpa o
GROUP BY 1, 2
ORDER BY 1, 2
LIMIT 10;

-- B. Hipótese H3: taxa de investimento por faixa de XP (engajamento nos cursos)
SELECT CASE WHEN u."totalXp" < 200 THEN '1. menos de 200 XP'
            WHEN u."totalXp" < 500 THEN '2. 200 a 499 XP'
            ELSE '3. 500 XP ou mais' END AS faixa_xp,
       COUNT(DISTINCT u."emailUsuario") AS usuarios,
       ROUND(100.0 * SUM(CASE WHEN o."idTipoOperacao" = 3 THEN o."valor" ELSE 0 END)
             / SUM(CASE WHEN o."idTipoOperacao" = 1 THEN o."valor" ELSE 0 END), 1) AS perc_renda_investida
FROM operacao_limpa o
JOIN "Usuario" u ON u."emailUsuario" = o."usuarioId"
GROUP BY 1
ORDER BY 1;
