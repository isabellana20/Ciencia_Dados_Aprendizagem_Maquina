**Definição do Projeto de Ciência de Dados**

**MVC Finance — Aplicativo Web de Gestão Financeira Pessoal**

*Preenchido com base no TCC da Equipe MVC Finance (Isabella, Jhonathan e
Kauane) — UDF, 2026*



1\. Identificação do projeto

|                                    |                                                                                                                                                                                                                                                                                                          |
|------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Título provisório do projeto**   | MVC Finance: Aplicativo Web de Gestão Financeira Pessoal com Módulo de Relatórios por Inteligência Artificial                                                                                                                                                                                            |
| **Curso / disciplina**             | Ciência da Computação e Sistemas de Informação — Unidade III: Gestão de Projetos (Ciência de Dados)                                                                                                                                                                                                      |
| **Turma**                          | ⚠ Não informado no TCC — preencher com a turma da disciplina.                                                                                                                                                                                                                                            |
| **Equipe**                         | Equipe MVC Finance                                                                                                                                                                                                                                                                                       |
| **Integrantes e funções iniciais** | Isabella Ana Dutra de Sousa (matrícula 35719117); Jhonathan de Moura Santos (matrícula 32813589); Kauane Braga dos Santos Silva de Sousa (matrícula 36358959). ⚠ O TCC não especifica a função de cada integrante (ex.: front-end, back-end, dados/IA, documentação) — recomenda-se definir na Seção 14. |
| **Professor(a)**                   | ⚠ Divergência encontrada no TCC: a capa e a folha de rosto indicam "Orientadora: Prof.ª Dra. Kerlla Luz" (citada 3 vezes), mas a seção de Agradecimentos cita "nosso orientador Wilson Amaral". A equipe deve confirmar qual é o nome correto antes de submeter este documento.                          |
| **Data de elaboração**             | Brasília, 2026 (data exata de elaboração deste documento não especificada — preencher ao entregar)                                                                                                                                                                                                       |
| **Versão do documento**            | v1.0 — elaborada a partir do TCC MVC Finance (2026)                                                                                                                                                                                                                                                      |

2\. Visão geral

2.1 Resumo do projeto

O MVC Finance é uma plataforma SaaS web de gestão financeira pessoal
voltada a usuários brasileiros, parte deles endividados e mal atendidos
por planilhas e aplicativos tradicionais, que priorizam apenas o
registro retrospectivo de gastos. A plataforma permite registrar
receitas, despesas e investimentos, visualizar dashboards financeiros e,
para assinantes do Plano Premium, gerar relatórios automáticos via
Inteligência Artificial (GPT-4o-mini) que analisam as transações do mês
e retornam resumo, tendências e recomendações. Inclui ainda um módulo
educacional gamificado. Do ponto de vista de dados, o núcleo do projeto
é transformar as transações estruturadas do usuário em insumo para
relatórios personalizados e, potencialmente, em análises de padrão de
consumo.

2.2 Declaração do projeto em uma frase

Nosso projeto utilizará as transações financeiras (receitas, despesas e
investimentos) registradas pelos próprios usuários na plataforma MVC
Finance para compreender e prever padrões de gastos e comportamento
financeiro, apoiando usuários brasileiros com dificuldades de controle
financeiro na decisão de organizar, planejar e melhorar a gestão de suas
finanças pessoais.

3\. Contexto e definição do problema

3.1 Contexto

O endividamento das famílias brasileiras permanece elevado: segundo a
CNC (2024), a proporção de famílias com contas a vencer recuou apenas de
77,0% para 76,7% entre novembro e dezembro, uma redução pequena diante
de um patamar ainda preocupante. O mercado já oferece ferramentas de
controle financeiro (planilhas e aplicativos como Mobills, Money Lover e
Gestor de Despesas), mas seu uso contínuo é limitado por barreiras
funcionais: foco no registro retrospectivo de despesas (pouco
planejamento preditivo), necessidade de inserção manual exaustiva de
dados, funcionalidades avançadas restritas a versões pagas e ausência de
recursos educativos integrados nativamente — o que, segundo o BCB
(2023), reduz o potencial de mudança efetiva no comportamento financeiro
dos usuários. O problema ocorre, portanto, entre pessoas físicas no
Brasil que tentam controlar as próprias finanças por conta própria, sem
apoio simultâneo de planejamento e educação financeira.

3.2 Problema central

Usuários brasileiros com dificuldades de controle financeiro (parte
deles endividados) enfrentam a limitação das ferramentas tradicionais de
gestão financeira pessoal — que priorizam o registro retrospectivo de
despesas, exigem inserção manual exaustiva de dados e carecem de
educação financeira integrada — no contexto de um mercado com baixa
adesão contínua a planilhas e aplicativos, produzindo manutenção do
ciclo de endividamento e decisões financeiras pouco conscientes.

3.3 Evidências iniciais

| **Evidência**                                                                    | **Fonte**                                                                                                    | **O que ela indica?**                                                                                          | **Confiabilidade / limitação**                                                                |
|----------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Proporção de famílias com contas a vencer caiu de 77,0% para 76,7% (nov.→dez.)   | CNC (2024) — Pesquisa de Endividamento e Inadimplência do Consumidor (PEIC)                                  | O endividamento das famílias brasileiras permanece elevado apesar de leve melhora                              | Dado agregado nacional; não é segmentado pelo perfil específico dos usuários da plataforma    |
| Baixa adesão a ferramentas tradicionais e falta de educação financeira integrada | Banco Central do Brasil (2023) — Relatório de Economia Bancária; BCB (2013) — Caderno de Educação Financeira | Instrumentos de controle financeiro isolados têm pouco efeito sem letramento financeiro                        | Fonte institucional; não mede diretamente o comportamento dos futuros usuários do MVC Finance |
| Análise comparativa entre MVC Finance, Mobills, Money Lover e Gestor de Despesas | Google Play Store / análise dos autores do TCC (2026)                                                        | Concorrentes oferecem educação financeira introdutória (artigos/dicas) e recursos avançados só em planos pagos | Análise qualitativa feita pelos próprios autores, sem dados quantitativos de uso real         |

4\. Público-alvo e partes interessadas

4.1 Público-alvo principal

|                                                          |                                                                                                                                                                                                         |
|----------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Quem são os usuários ou beneficiários?**               | Pessoas físicas no Brasil que buscam controlar receitas e despesas pessoais, incluindo usuários endividados ou com baixo letramento financeiro.                                                         |
| **Quais necessidades possuem?**                          | Registrar transações de forma simples, entender o próprio padrão de gastos, receber orientação/educação financeira e obter recomendações personalizadas.                                                |
| **Como são afetados pelo problema?**                     | Dependem de planilhas ou apps limitados a registro retrospectivo, com inserção manual exaustiva e sem apoio educativo integrado, o que dificulta a mudança de comportamento financeiro.                 |
| **Que decisão ou ação poderão tomar com os resultados?** | Ajustar hábitos de consumo por categoria, decidir migrar do Plano Gratuito para o Plano Premium (relatórios de IA ilimitados) e engajar-se no módulo educacional para melhorar o letramento financeiro. |

4.2 Partes interessadas

| **Parte interessada**                                   | **Interesse no projeto**                                              | **Influência** | **Forma de envolvimento**                                                     |
|---------------------------------------------------------|-----------------------------------------------------------------------|----------------|-------------------------------------------------------------------------------|
| Usuários finais (Plano Gratuito e Plano Premium)        | Controlar finanças pessoais e obter insights sobre os próprios gastos | Alta           | Uso diário da plataforma; geração de dados de transações; feedback/avaliações |
| Equipe MVC Finance (Isabella, Jhonathan e Kauane)       | Concluir o TCC e evoluir o produto                                    | Alta           | Desenvolvimento, modelagem de dados, documentação e apresentação              |
| Orientador(a) do TCC ⚠ (nome a confirmar — ver Seção 1) | Avaliação acadêmica do projeto e da metodologia                       | Média          | Orientação, validação de requisitos e correções                               |
| OpenAI (provedora do modelo GPT-4o-mini)                | Fornecer o serviço de geração dos relatórios de IA                    | Média          | Integração via API paga por uso (dependência técnica externa)                 |

5\. Objetivos do projeto

5.1 Objetivo geral

Desenvolver um sistema SaaS (MVC Finance) que utilize os dados
financeiros informados pelos próprios usuários para gerar relatórios
automatizados por Inteligência Artificial e apoiar o controle e a
educação financeira pessoal por meio de uma interface intuitiva e
didática.

5.2 Objetivos específicos

| **Nº** | **Objetivo específico**                                                                     | **Evidência de conclusão**                                                                                                       |
|--------|---------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| 1      | Promover a educação financeira do usuário                                                   | Módulo educacional (cursos, módulos, lições e conquistas) implementado e disponível no catálogo de cursos                        |
| 2      | Integrar o módulo educacional ao acompanhamento financeiro, fomentando aprendizado contínuo | Progresso do usuário (UserLessonProgress) e XP/gamificação vinculados ao uso da plataforma                                       |
| 3      | Desenvolver uma arquitetura escalável e segura                                              | Autenticação implementada, criptografia AES-256, hashing de senha (BCrypt) e banco de dados PostgreSQL/Neon em produção          |
| 4      | Validar a viabilidade de um modelo de negócio freemium                                      | Planos Gratuito e Premium implementados, com fluxo de upgrade e pagamento (Stripe) funcional                                     |
| 5      | Assegurar a segurança e a privacidade das informações financeiras dos usuários              | Isolamento de dados por usuário (usuarioId) e verificação de plano Premium no servidor antes de qualquer chamada à API da OpenAI |

5.3 Verificação dos objetivos

**☒** São específicos e escritos com clareza.

**☒** Podem ser verificados por meio de entregáveis ou métricas.

**☒** São viáveis com os dados, recursos e tempo disponíveis (conforme
funcionalidades já descritas no TCC).

**☒** Estão diretamente relacionados ao problema central.

☐ Consideram os usuários e a decisão que será apoiada — ⚠ o TCC não traz
validação direta com usuários reais (pesquisa/entrevista); recomenda-se
a equipe registrar isso.

6\. Perguntas de negócio

*As perguntas abaixo foram elaboradas com base nos recursos de dados já
descritos no TCC (entidade Transaction, regras RN-IA01 a RN-IA03 do
relatório de IA, módulo educacional). Recomenda-se que a equipe as
valide e ajuste conforme prioridade.*

| **Nº** | **Pergunta de negócio**                                                                                                  | **Decisão apoiada**                                                                | **Dados necessários**                                                     | **Análise ou indicador possível**                                                          |
|--------|--------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|---------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| 1      | Quais categorias de despesa mais contribuem para o desequilíbrio financeiro mensal do usuário?                           | Priorizar quais categorias destacar no relatório de IA e em alertas                | Transações do mês (valor, categoria, tipo, data)                          | Agregação e ranking de despesas por categoria                                              |
| 2      | O relatório gerado pela IA a partir das transações do mês reflete de forma fiel as tendências reais de gasto do usuário? | Ajustar o prompt e o formato de dados enviados ao GPT-4o-mini (RN-IA03)            | Transações formatadas como DATA-VALOR-TIPO-CATEGORIA do mês selecionado   | Comparação entre o relatório gerado e uma análise estatística direta das mesmas transações |
| 3      | Existe relação entre o engajamento no módulo educacional (XP, cursos concluídos) e mudanças no padrão de gastos?         | Priorizar investimento em gamificação/educação financeira                          | totalXp, UserLessonProgress, UserAchievement, histórico de Transaction    | Correlação entre XP acumulado e evolução do saldo/despesas ao longo dos meses              |
| 4      | Em que ponto o limite de 10 operações/mês do Plano Gratuito se torna uma barreira de uso?                                | Ajustar limites do plano gratuito e a estratégia de conversão para o Plano Premium | Contagem de registros de Transaction por usuário e por mês; campo premium | Distribuição de frequência de uso por plano (Gratuito x Premium)                           |
| 5      | Quais categorias e métodos de pagamento são mais recorrentes entre usuários com alto volume de despesas?                 | Orientar conteúdo educativo e alertas personalizados por perfil de usuário         | idCategoria, idMetodoPagamento, valor das transações                      | Segmentação de usuários por padrão de consumo                                              |

7\. Hipóteses iniciais

| **Hipótese**                                                                                                                                      | **Como poderá ser testada?**                                                                   | **Resultado que a refutaria?**                                                                          |
|---------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| H1. Usuários que utilizam o relatório de IA mensalmente tendem a reduzir despesas em categorias não essenciais nos meses seguintes.               | Comparar despesas por categoria antes e depois do uso do relatório de IA, por usuário.         | Ausência de redução (ou aumento) de despesas nos meses seguintes ao uso do relatório.                   |
| H2. O limite de 10 operações/mês do Plano Gratuito é suficiente apenas para uma parcela dos usuários, impulsionando a conversão ao Plano Premium. | Medir o percentual de usuários do Plano Gratuito que atingem o limite mensal de operações.     | Baixa proporção de usuários atingindo o limite, indicando que essa barreira não influencia a conversão. |
| H3. Usuários com maior XP/progresso no módulo educacional apresentam padrões de gasto mais estáveis (menor variação mês a mês).                   | Correlacionar totalXp e cursos concluídos com o desvio-padrão das despesas mensais do usuário. | Ausência de correlação entre XP/progresso educacional e estabilidade financeira.                        |

8\. Dados necessários e viabilidade

| **Conjunto ou fonte de dados**                                                   | **Variáveis principais**                                               | **Formato**                             | **Acesso / responsável**                                          | **Qualidade esperada**                                                               |
|----------------------------------------------------------------------------------|------------------------------------------------------------------------|-----------------------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Transaction (operações financeiras)                                              | valor, data, idTipoOperacao, idCategoria, idMetodoPagamento, usuarioId | Estruturado (PostgreSQL via Prisma ORM) | Banco de dados da aplicação (Neon DB) / equipe de desenvolvimento | Alta — inserida diretamente pelo usuário, mas sujeita a erro de categorização manual |
| User (usuário)                                                                   | idUsuario, premium, totalXp, idCursoAtual, idModuloAtual, idLicaoAtual | Estruturado (PostgreSQL)                | Banco de dados da aplicação / equipe de desenvolvimento           | Alta, porém sensível (LGPD) — requer anonimização para qualquer análise agregada     |
| Módulo educacional (Course, Module, Lesson, UserLessonProgress, UserAchievement) | progresso do usuário, cursos/módulos/lições concluídos, conquistas     | Estruturado (PostgreSQL)                | Banco de dados da aplicação / equipe de desenvolvimento           | Alta, mas dependente da efetiva adoção do módulo educacional pelos usuários          |

8.1 Avaliação inicial dos dados

Disponibilidade: os dados existem apenas a partir do uso real da
plataforma (após entrada em produção/MVP); não há base histórica externa
disponível, já que a análise é feita sobre dados gerados pelos próprios
usuários.

Volume e período coberto: variável, dependente do tamanho da base de
usuários ativos; o escopo por análise é mensal e por usuário, conforme a
regra RN-IA02 do relatório de IA.

Dados ausentes, duplicados ou inconsistentes previstos: categorização
manual incorreta pelo usuário, poucos registros para usuários novos
(dados esparsos), possíveis duplicidades de lançamento.

Necessidade de integração entre fontes: baixa — não há fontes externas
descritas no TCC; os dados estão centralizados no próprio banco
(PostgreSQL/Neon via Prisma ORM).

Restrições legais, contratuais ou institucionais: Lei Geral de Proteção
de Dados Pessoais — LGPD (Lei nº 13.709/2018). Dados financeiros são
sensíveis e exigem base legal, minimização e cuidado redobrado em
qualquer uso analítico.

8.2 Privacidade, ética e segurança

**☒** A equipe verificou se há dados pessoais ou sensíveis (dados
financeiros e de identificação do usuário, conforme modelo de dados do
TCC).

**☒** A coleta e o uso dos dados possuem finalidade legítima e explícita
(gestão financeira pessoal e geração de relatórios ao próprio usuário).

**☒** O acesso será limitado às pessoas autorizadas (isolamento de dados
por usuarioId e verificação de plano Premium no servidor, conforme
RN-IA01/RN-IA02).

☐ Dados pessoais serão minimizados, anonimizados ou pseudonimizados
quando necessário — ⚠ não detalhado no TCC para fins de análise de dados
agregada; recomenda-se a equipe definir o processo se este projeto usar
a base para estudos estatísticos.

☐ Possíveis vieses e impactos sobre grupos serão analisados — ⚠ não
abordado no TCC.

☐ A divulgação dos resultados evitará reidentificação ou exposição
indevida — ⚠ não abordado no TCC; recomenda-se definir antes de publicar
qualquer análise agregada.

Cuidados específicos deste projeto: os dados financeiros são altamente
sensíveis. O TCC menciona conformidade com a LGPD, criptografia AES-256
e hashing de senha com BCrypt, mas não detalha processos de anonimização
caso os dados sejam usados para estudos estatísticos ou de Ciência de
Dados além do relatório individual de IA — a equipe deve endereçar esse
ponto (⚠).

9\. Escopo do projeto

| **Dentro do escopo**                                                                            | **Fora do escopo**                                                                                                          |
|-------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Registro, edição e exclusão de transações financeiras (receita/despesa/investimento)            | Integração bancária automática (open finance) — não mencionada no TCC                                                       |
| Dashboard financeiro com filtro por mês e gráficos de evolução                                  | Aplicativo mobile nativo — a solução é uma plataforma web (SaaS)                                                            |
| Geração de relatório de Inteligência Artificial (GPT-4o-mini) para usuários do Plano Premium    | Modelos preditivos de Machine Learning desenvolvidos pela própria equipe (o TCC usa a API da OpenAI, não um modelo próprio) |
| Módulo educacional gamificado (cursos, módulos, lições, conquistas, XP)                         | Análises estatísticas avançadas/painéis de Ciência de Dados além do relatório individual em Markdown                        |
| Modelo de negócio freemium com pagamento via Stripe (Plano Básico/Gratuito e Plano Pro/Premium) |                                                                                                                             |

Restrições conhecidas: prazo acadêmico do TCC; dependência de
custo/disponibilidade da API paga da OpenAI (GPT-4o-mini); equipe
reduzida (3 integrantes); infraestrutura em nuvem (Neon DB) sujeita a
limites do plano contratado.

10\. Resultados e entregáveis previstos

| **Entregável**            | **Descrição**                                                                                    | **Formato**                                 | **Responsável**                               | **Critério de aceite**                                             |
|---------------------------|--------------------------------------------------------------------------------------------------|---------------------------------------------|-----------------------------------------------|--------------------------------------------------------------------|
| Base tratada              | Banco de dados relacional com as entidades User, Transaction, Course, Module, Lesson etc.        | PostgreSQL (Neon) via Prisma ORM            | Equipe MVC Finance                            | Modelo de dados implementado conforme o Diagrama de Classes do TCC |
| Análise exploratória      | Extração e formatação das transações do mês em texto estruturado (DATA-VALOR-TIPO-CATEGORIA)     | Texto estruturado enviado à API GPT-4o-mini | Equipe MVC Finance                            | Dados corretamente filtrados por usuário e mês, conforme RN-IA02   |
| Visualizações / painel    | Dashboard financeiro com gráficos de evolução e filtro por mês                                   | Interface web (React / Next.js)             | Equipe MVC Finance                            | Dashboard exibindo indicadores consolidados e atualizados por mês  |
| Relatório ou apresentação | Relatório de Inteligência Artificial (resumo, análise por categoria, tendências e recomendações) | Markdown, exibido em modal/dashboard        | Equipe MVC Finance + API GPT-4o-mini (OpenAI) | Relatório gerado conforme regras RN-IA01 a RN-IA03                 |
| Outro                     | TCC escrito (documento acadêmico completo)                                                       | PDF / Word                                  | Equipe MVC Finance                            | Aprovação pela banca examinadora                                   |

11\. Critérios de sucesso

| **Critério**                  | **Indicador ou evidência**                                        | **Meta**                                                          | **Forma de verificação**                                                         |
|-------------------------------|-------------------------------------------------------------------|-------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Relevância para o problema    | Uso do relatório de IA pelos usuários do Plano Premium            | Adoção recorrente (mensal) do recurso                             | Registro de geração de relatórios no sistema                                     |
| Qualidade dos dados           | Consistência da categorização das transações registradas          | Baixo índice de dados incompletos ou duplicados                   | Auditoria periódica do banco de dados                                            |
| Qualidade da análise          | Coerência entre o relatório de IA e os dados reais do usuário     | Relatório reflete corretamente resumo, tendências e recomendações | Validação manual comparando relatório gerado x dados brutos                      |
| Utilidade para o público-alvo | Percepção de utilidade do relatório de IA e do módulo educacional | Feedback positivo dos usuários / avaliadores                      | ⚠ Pesquisa de satisfação (não realizada no TCC) e avaliação da banca examinadora |
| Comunicação dos resultados    | Clareza do TCC, dos protótipos de tela e do dashboard             | Aprovação na defesa do TCC                                        | Avaliação da banca examinadora                                                   |

12\. Plano inicial de trabalho

*O TCC menciona que os requisitos são desenvolvidos ao longo de sprints,
com backlog e kanban (metodologia ágil), mas não especifica datas de
cronograma. A estrutura abaixo é sugerida com base nessas informações; a
equipe deve inserir prazos reais (⚠).*

| **Etapa**                | **Atividades principais**                                                                                   | **Responsável(is)** | **Prazo**   | **Dependências**                                  |
|--------------------------|-------------------------------------------------------------------------------------------------------------|---------------------|-------------|---------------------------------------------------|
| 1\. Definição            | Levantamento de requisitos (RF01–RFxx), casos de uso e diagrama de classes                                  | Equipe MVC Finance  | ⚠ a definir | —                                                 |
| 2\. Obtenção dos dados   | Implementação de cadastro/autenticação e registro de transações pelos usuários                              | Equipe MVC Finance  | a definir | Depende do módulo de autenticação                 |
| 3\. Preparação dos dados | Formatação das transações (DATA-VALOR-TIPO-CATEGORIA) para envio à API                                      | Equipe MVC Finance  | a definir | Depende do modelo de dados (entidade Transaction) |
| 4\. Análise / modelagem  | Integração com o GPT-4o-mini (OpenAI) para geração do relatório de IA (UC-17)                               | Equipe MVC Finance  |  a definir | Depende da configuração da OPENAI_API_KEY         |
| 5\. Validação            | Testes do fluxo do relatório de IA (incluindo fluxo alternativo sem API key e verificação de plano Premium) | Equipe MVC Finance  |  a definir | Depende de ambiente de testes configurado         |
| 6\. Comunicação          | Elaboração do TCC, protótipos de tela e defesa perante a banca examinadora                                  | Equipe MVC Finance  | ⚠a definir | Depende da aprovação da orientação                |

13\. Riscos do projeto

| **Risco**                                                                               | **Probabilidade** | **Impacto** | **Estratégia de resposta**                                                                                                        | **Responsável**    |
|-----------------------------------------------------------------------------------------|-------------------|-------------|-----------------------------------------------------------------------------------------------------------------------------------|--------------------|
| Indisponibilidade ou custo elevado da API OpenAI (GPT-4o-mini)                          | Média             | Alto        | Manter o fluxo alternativo já previsto no UC-17 para quando a OPENAI_API_KEY não estiver configurada; monitorar custo por chamada | Equipe MVC Finance |
| Não conformidade com a LGPD no tratamento de dados financeiros sensíveis                | Baixa             | Alto        | Reforçar isolamento de dados por usuário, criptografia AES-256 e revisão da política de privacidade                               | Equipe MVC Finance |
| Baixa adesão de usuários ao Plano Premium, comprometendo a validação do modelo freemium | Média             | Médio       | Ajustar o limite do Plano Gratuito (atualmente 10 operações/mês) e comunicar melhor o valor do relatório de IA                    | Equipe MVC Finance |

14\. Organização da equipe

*O TCC não detalha a função específica de cada integrante no
desenvolvimento — apenas Kauane consta como autora nos metadados do
arquivo entregue. Recomenda-se que a equipe preencha esta seção antes da
entrega (⚠).*

| **Integrante**                         | **Papel principal**                                          | **Responsabilidades** | **Apoio necessário** |
|----------------------------------------|--------------------------------------------------------------|-----------------------|----------------------|
| Isabella Ana Dutra de Sousa            |   Documentação (Casos de Uso / Dados e IA)                                                | ⚠ a definir           | ⚠ a definir          |
| Jhonathan de Moura Santos              | ⚠ a definir                                                  | ⚠ a definir           | ⚠ a definir          |
| Kauane Braga dos Santos Silva de Sousa | ⚠ a definir (autora identificada nos metadados do documento) | ⚠ a definir           | ⚠ a definir          |

15\. Validação da definição do projeto

**☒** O problema é real, relevante e delimitado (endividamento e baixa
adesão a ferramentas tradicionais, com base em dados da CNC e do BCB).

**☒** O público-alvo e as partes interessadas estão identificados.

**☒** O objetivo geral e os objetivos específicos são coerentes.

**☒** As perguntas de negócio orientam decisões concretas (elaboradas
com base no relatório de IA e no módulo educacional; ⚠ a validar com a
equipe).

**☒** Há dados potencialmente disponíveis para responder às perguntas
(entidades Transaction, User e módulo educacional já modeladas no TCC).

☐ O escopo é compatível com o prazo e os recursos — ⚠ cronograma
detalhado não informado no TCC.

☐ Os critérios de sucesso são mensuráveis — ⚠ alguns dependem de
pesquisa de satisfação ainda não realizada.

☐ Riscos, privacidade, ética e segurança foram considerados — ⚠ vieses,
anonimização e reidentificação ainda não foram tratados no TCC.

☐ Funções e responsabilidades foram distribuídas — ⚠ pendente (ver Seção
14).

16\. Aprovação e registro de ajustes

| **Responsável**              | **Validação / observação**                                                       | **Data** |
|------------------------------|----------------------------------------------------------------------------------|----------|
| Representante da equipe      | ⚠ a preencher pela equipe no momento da entrega                                  | ⚠        |
| Professor(a) / orientador(a) | ⚠ a preencher — confirmar antes o nome correto do(a) orientador(a) (ver Seção 1) | ⚠        |

Ajustes solicitados após a apresentação inicial

⚠ A preencher pela equipe após a apresentação/validação com o(a)
professor(a) orientador(a).
