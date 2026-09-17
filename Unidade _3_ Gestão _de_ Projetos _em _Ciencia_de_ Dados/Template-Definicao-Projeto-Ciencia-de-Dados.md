# Template - Definição do Projeto de Ciência de Dados

**Unidade:** III - Gestão de Projetos  
**Metodologia:** PBL + trabalho em equipes  
**Entregável:** Documento de definição do projeto

> **Finalidade:** delimitar um problema real e orientar o desenvolvimento do projeto de Ciência de Dados. Preencha todos os campos com informações objetivas, verificáveis e coerentes entre si.

## 1. Identificação do projeto

| Campo | Preenchimento |
|---|---|
| Título provisório do projeto | | 	MVC Finance: Aplicativo Web de Gestão Financeira Pessoal 
| Curso / disciplina | | Curso / disciplina	Ciência da Computação e Sistemas de Informação — Unidade III: Gestão de Projetos (Ciência de Dados)
| Turma | |
| Equipe | | MVC Finance
| Integrantes e funções iniciais | |Isabella Ana Dutra de Sousa (matrícula 35719117); Jhonathan de Moura Santos (matrícula 32813589); Kauane Braga dos Santos Silva de Sousa (matrícula 36358959). - funções isabella e kauane documenteção , dados/IA, Jhonathan .: front-end, back-end,
| Professor(a) | |  Gabriel Alves
| Data de elaboração | | 16/09/2026
| Versão do documento | | Versão do documento	v1.0 — elaborada a partir do TCC MVC Finance (2026)

## 2. Visão geral

### 2.1 Resumo do projeto

Em até 100 palavras, apresente o problema, o público-alvo, a proposta de análise e o resultado esperado.

**Preenchimento:**

O MVC Finance é uma plataforma SaaS web de gestão financeira pessoal voltada a usuários brasileiros, parte deles endividados e mal atendidos por planilhas e aplicativos tradicionais, que priorizam apenas o registro retrospectivo de gastos. A plataforma permite registrar receitas, despesas e investimentos, visualizar dashboards financeiros e, para assinantes do Plano Premium, gerar relatórios automáticos via Inteligência Artificial (GPT-4o-mini) que analisam as transações do mês e retornam resumo, tendências e recomendações. Inclui ainda um módulo educacional gamificado. Do ponto de vista de dados, o núcleo do projeto é transformar as transações estruturadas do usuário em insumo para relatórios personalizados e, potencialmente, em análises de padrão de consumo.

### 2.2 Declaração do projeto em uma frase

> Nosso projeto utilizará **[dados ou fonte]** para compreender/prever **[fenômeno]**, apoiando **[público ou organização]** na decisão de **[decisão ou ação]**.

**Versão da equipe:**
Nosso projeto utilizará as transações financeiras (receitas, despesas e investimentos) registradas pelos próprios usuários na plataforma MVC Finance para compreender e prever padrões de gastos e comportamento financeiro, apoiando usuários brasileiros com dificuldades de controle financeiro na decisão de organizar, planejar e melhorar a gestão de suas finanças pessoais.

## 3. Contexto e definição do problema

### 3.1 Contexto

Descreva a situação atual, o ambiente em que o problema ocorre e as evidências iniciais que demonstram sua relevância.

- Onde o problema ocorre?
- Quem é afetado?
- Quais sinais, dados ou relatos indicam sua existência?
- Por que é importante investigá-lo agora?

**Preenchimento:**
O endividamento das famílias brasileiras permanece elevado: segundo a CNC (2024), a proporção de famílias com contas a vencer recuou apenas de 77,0% para 76,7% entre novembro e dezembro, uma redução pequena diante de um patamar ainda preocupante. O mercado já oferece ferramentas de controle financeiro (planilhas e aplicativos como Mobills, Money Lover e Gestor de Despesas), mas seu uso contínuo é limitado por barreiras funcionais: foco no registro retrospectivo de despesas (pouco planejamento preditivo), necessidade de inserção manual exaustiva de dados, funcionalidades avançadas restritas a versões pagas e ausência de recursos educativos integrados nativamente — o que, segundo o BCB (2023), reduz o potencial de mudança efetiva no comportamento financeiro dos usuários. O problema ocorre, portanto, entre pessoas físicas no Brasil que tentam controlar as próprias finanças por conta própria, sem apoio simultâneo de planejamento e educação financeira.

### 3.2 Problema central

Formule o problema de maneira específica, sem antecipar uma solução.

> **Modelo:** [Público/organização] enfrenta [problema observável] no contexto de [situação], produzindo [consequência ou impacto].

**Problema definido:**
Usuários brasileiros com dificuldades de controle financeiro (parte deles endividados) enfrentam a limitação das ferramentas tradicionais de gestão financeira pessoal — que priorizam o registro retrospectivo de despesas, exigem inserção manual exaustiva de dados e carecem de educação financeira integrada — no contexto de um mercado com baixa adesão contínua a planilhas e aplicativos, produzindo manutenção do ciclo de endividamento e decisões financeiras pouco conscientes.

### 3.3 Evidências iniciais

| Evidência | Fonte | O que ela indica? | Confiabilidade / limitação |
|---|---|---|---|
| 1. | | | |
Proporção de famílias com contas a vencer caiu de 77,0% para 76,7% (nov.→dez.)	CNC (2024) — Pesquisa de Endividamento e Inadimplência do Consumidor (PEIC)	O endividamento das famílias brasileiras permanece elevado apesar de leve melhora	Dado agregado nacional; não é segmentado pelo perfil específico dos usuários da plataforma

| 2. | | | |Baixa adesão a ferramentas tradicionais e falta de educação financeira integrada	Banco Central do Brasil (2023) — Relatório de Economia Bancária; BCB (2013) — Caderno de Educação Financeira	Instrumentos de controle financeiro isolados têm pouco efeito sem letramento financeiro	Fonte institucional; não mede diretamente o comportamento dos futuros usuários do MVC Finance

| 3. | | | |Análise comparativa entre MVC Finance, Mobills, Money Lover e Gestor de Despesas	Google Play Store / análise dos autores do TCC (2026)	Concorrentes oferecem educação financeira introdutória (artigos/dicas) e recursos avançados só em planos pagos	Análise qualitativa feita pelos próprios autores, sem dados quantitativos de uso real

## 4. Público-alvo e partes interessadas

### 4.1 Público-alvo principal

| Aspecto | Descrição |
|---|---|
| Quem são os usuários ou beneficiários? | |Pessoas físicas no Brasil que buscam controlar receitas e despesas pessoais, incluindo usuários endividados ou com baixo letramento financeiro.

| Quais necessidades possuem? | |Registrar transações de forma simples, entender o próprio padrão de gastos, receber orientação/educação financeira e obter recomendações personalizadas.

| Como são afetados pelo problema? | |Como são afetados pelo problema?	Dependem de planilhas ou apps limitados a registro retrospectivo, com inserção manual exaustiva e sem apoio educativo integrado, o que dificulta a mudança de comportamento financeiro.

| Que decisão ou ação poderão tomar com os resultados? | |Ajustar hábitos de consumo por categoria, decidir migrar do Plano Gratuito para o Plano Premium (relatórios de IA ilimitados) e engajar-se no módulo educacional para melhorar o letramento financeiro

### 4.2 Partes interessadas

| Parte interessada | Interesse no projeto | Influência | Forma de envolvimento |
|---|---|---|---|
| | | Baixa / Média / Alta | | Usuários finais (Plano Gratuito e Plano Premium)	Controlar finanças pessoais e obter insights sobre os próprios gastos	Alta	Uso diário da plataforma; geração de dados de transações; feedback/avaliações

| | | Baixa / Média / Alta | | Equipe MVC Finance (Isabella, Jhonathan e Kauane)	Concluir o TCC e evoluir o produto	Alta	Desenvolvimento, modelagem de dados, documentação e apresentação

| | | Baixa / Média / Alta | | Orientador(a) do TCC (nome a confirmar — ver Seção 1)	Avaliação acadêmica do projeto e da metodologia	Média	Orientação, validação de requisitos e correções

| | | Baixa / Média / Alta | | OpenAI (provedora do modelo GPT-4o-mini)	Fornecer o serviço de geração dos relatórios de IA	Média	Integração via API paga por uso (dependência técnica externa)


## 5. Objetivos do projeto

### 5.1 Objetivo geral

Escreva um objetivo que indique o que será analisado, para qual finalidade e em qual contexto. Inicie com um verbo no infinitivo.

**Objetivo geral:**

Desenvolver um sistema SaaS (MVC Finance) que utilize os dados financeiros informados pelos próprios usuários para gerar relatórios automatizados por Inteligência Artificial e apoiar o controle e a educação financeira pessoal por meio de uma interface intuitiva e didática.___

### 5.2 Objetivos específicos

Defina de três a cinco objetivos mensuráveis e compatíveis com o prazo do projeto.

| Nº | Objetivo específico | Evidência de conclusão |
|---:|---|---|
| 1 | | | 1	Promover a educação financeira do usuário	Módulo educacional (cursos, módulos, lições e conquistas) implementado e disponível no catálogo de cursos

| 2 | | | 	Integrar o módulo educacional ao acompanhamento financeiro, fomentando aprendizado contínuo	Progresso do usuário (UserLessonProgress) e XP/gamificação vinculados ao uso da plataforma

| 3 | | | 3	Desenvolver uma arquitetura escalável e segura	Autenticação implementada, ,  e banco de dados PostgreSQL/Neon em produção

| 4 | | | 4	Validar a viabilidade de um modelo de negócio freemium	Planos Gratuito e Premium implementados, com fluxo de upgrade e pagamento (Stripe) funcional

| 5 | | |	Assegurar a segurança e a privacidade das informações financeiras dos usuários	Isolamento de dados por usuário (usuarioId) e verificação de plano Premium no servidor antes de qualquer chamada à API da OpenAI

### 5.3 Verificação dos objetivos

Marque após revisar:

- [ X ] São específicos e escritos com clareza.
- [ X] Podem ser verificados por meio de entregáveis ou métricas.
- [X ] São viáveis com os dados, recursos e tempo disponíveis.
- [ X ] Estão diretamente relacionados ao problema central.
- [ ] Consideram os usuários e a decisão que será apoiada.

## 6. Perguntas de negócio

As perguntas de negócio orientam a coleta, a análise e a comunicação dos resultados. Evite perguntas que possam ser respondidas apenas com “sim” ou “não”.

| Nº | Pergunta de negócio | Decisão apoiada | Dados necessários | Análise ou indicador possível |
|---:|---|---|---|---|
| 1 | | | | | Quais categorias de despesa mais contribuem para o desequilíbrio financeiro mensal do usuário?	Priorizar quais categorias destacar no relatório de IA e em alertas	Transações do mês (valor, categoria, tipo, data)	Agregação e ranking de despesas por categoria

| 2 | | | | |	O relatório gerado pela IA a partir das transações do mês reflete de forma fiel as tendências reais de gasto do usuário?
Ajustar o prompt e o formato de dados enviados ao GPT-4o-mini (RN-IA03)	Transações formatadas como DATA-VALOR-TIPO-CATEGORIA do mês selecionado	Comparação entre o relatório gerado e uma análise estatística direta das mesmas transações

| 3 | | | | | 	Existe relação entre o engajamento no módulo educacional (XP, cursos concluídos) e mudanças no padrão de gastos?	Priorizar investimento em gamificação/educação financeira	totalXp, UserLessonProgress, UserAchievement, histórico de Transaction	Correlação entre XP acumulado e evolução do saldo/despesas ao longo dos meses

| 4 | | | | | 4	Em que ponto o limite de 10 operações/mês do Plano Gratuito se torna uma barreira de uso?	Ajustar limites do plano gratuito e a estratégia de conversão para o Plano Premium	Contagem de registros de Transaction por usuário e por mês; campo premium	Distribuição de frequência de uso por plano (Gratuito x Premium)

| 5 | | | | |5	Quais categorias e métodos de pagamento são mais recorrentes entre usuários com alto volume de despesas?	Orientar conteúdo educativo e alertas personalizados por perfil de usuário	idCategoria, idMetodoPagamento, valor das transações	Segmentação de usuários por padrão de consumo

## 7. Hipóteses iniciais

Registre suposições que serão investigadas, sem apresentá-las como conclusões.

| Hipótese | Como poderá ser testada? | Resultado que a refutaria? |
|---|---|---|
| H1. | | |  Usuários que utilizam o relatório de IA mensalmente tendem a reduzir despesas em categorias não essenciais nos meses seguintes.	Comparar despesas por categoria antes e depois do uso do relatório de IA, por usuário.	Ausência de redução (ou aumento) de despesas nos meses seguintes ao uso do relatório.

| H2. | | |O limite de 10 operações/mês do Plano Gratuito é suficiente apenas para uma parcela dos usuários, impulsionando a conversão ao Plano Premium.	Medir o percentual de usuários do Plano Gratuito que atingem o limite mensal de operações.	Baixa proporção de usuários atingindo o limite, indicando que essa barreira não influencia a conversão.

| H3. | | |  Usuários com maior XP/progresso no módulo educacional apresentam padrões de gasto mais estáveis (menor variação mês a mês).	Correlacionar totalXp e cursos concluídos com o desvio-padrão das despesas mensais do usuário.	Ausência de correlação entre XP/progresso educacional e estabilidade financeira.

## 8. Dados necessários e viabilidade

| Conjunto ou fonte de dados | Variáveis principais | Formato | Acesso / responsável | Qualidade esperada |
|---|---|---|---|---|
| | | | | |Transaction (operações financeiras)	valor, data, idTipoOperacao, idCategoria, idMetodoPagamento, usuarioId	Estruturado (PostgreSQL via Prisma ORM)	Banco de dados da aplicação (Neon DB) / equipe de desenvolvimento	Alta — inserida diretamente pelo usuário, mas sujeita a erro de categorização manual

| | | | | | User (usuário)	idUsuario, premium, totalXp, idCursoAtual, idModuloAtual, idLicaoAtual	Estruturado (PostgreSQL)	Banco de dados da aplicação / equipe de desenvolvimento	Alta, porém sensível (LGPD) — requer anonimização para qualquer análise agregada

| | | | | | Módulo educacional (Course, Module, Lesson, UserLessonProgress, UserAchievement)	progresso do usuário, cursos/módulos/lições concluídos, conquistas	Estruturado (PostgreSQL)	Banco de dados da aplicação / equipe de desenvolvimento	Alta, mas dependente da efetiva adoção do módulo educacional pelos usuários

### 8.1 Avaliação inicial dos dados

- **Disponibilidade:** os dados existem apenas a partir do uso real da plataforma (após entrada em produção/MVP); não há base histórica externa disponível, já que a análise é feita sobre dados gerados pelos próprios usuários
- 
- **Volume e período coberto:** Volume e período coberto: variável, dependente do tamanho da base de usuários ativos; o escopo por análise é mensal e por usuário, conforme a regra RN-IA02 do relatório de IA.
- **Dados ausentes, duplicados ou inconsistentes previstos:** duplicados ou inconsistentes previstos: categorização manual incorreta pelo usuário, poucos registros para usuários novos (dados esparsos), possíveis duplicidades de lançamento.
- **Necessidade de integração entre fontes:** baixa — não há fontes externas descritas no TCC; os dados estão centralizados no próprio banco (PostgreSQL/Neon via Prisma ORM).
- **Restrições legais, contratuais ou institucionais:**Lei Geral de Proteção de Dados Pessoais — LGPD (Lei nº 13.709/2018). Dados financeiros são sensíveis e exigem base legal, minimização e cuidado redobrado em qualquer uso analítico.

### 8.2 Privacidade, ética e segurança

- [ X] A equipe verificou se há dados pessoais ou sensíveis.
- [ X] A coleta e o uso dos dados possuem finalidade legítima e explícita.
- [ X] O acesso será limitado às pessoas autorizadas.
- [ ] Dados pessoais serão minimizados, anonimizados ou pseudonimizados quando necessário.
- [ ] Possíveis vieses e impactos sobre grupos serão analisados.
- [ ] A divulgação dos resultados evitará reidentificação ou exposição indevida.

**Cuidados específicos deste projeto:**

Cuidados específicos deste projeto: os dados financeiros são altamente sensíveis. O TCC menciona conformidade com a LGPD,  e hashing de senha com BCrypt, mas não detalha processos de anonimização caso os dados sejam usados para estudos estatísticos ou de Ciência de Dados além do relatório individual de IA — a equipe deve endereçar esse pon

## 9. Escopo do projeto

| Dentro do escopo | Fora do escopo |
|---|---|
| | |Registro, edição e exclusão de transações financeiras (receita/despesa/investimento)	Integração bancária automática (open finance) — não mencionada no TCC
| | |Geração de relatório de Inteligência Artificial (GPT-4o-mini) para usuários do Plano Premium	Modelos preditivos de Machine Learning desenvolvidos pela própria equipe (o TCC usa a API da OpenAI, não um modelo próprio)
| | | Módulo educacional gamificado (cursos, módulos, lições, conquistas, XP)	Análises estatísticas avançadas/painéis de Ciência de Dados além do relatório individual em Markdown

**Restrições conhecidas:** tempo, acesso a dados, ferramentas, infraestrutura, conhecimento técnico ou normas.

Restrições conhecidas: prazo acadêmico do TCC; dependência de custo/disponibilidade da API paga da OpenAI (GPT-4o-mini); equipe reduzida (3 integrantes); infraestrutura em nuvem (Neon DB) sujeita a limites do plano contratado.

## 10. Resultados e entregáveis previstos

| Entregável | Descrição | Formato | Responsável | Critério de aceite |
|---|---|---|---|---|
| Base tratada | | | | |
| Análise exploratória | | | | |
| Visualizações / painel | | | | |
| Relatório ou apresentação | | | | |
| Outro | | | | |

## 11. Critérios de sucesso

Defina como a equipe saberá se o projeto alcançou seus objetivos.

| Critério | Indicador ou evidência | Meta | Forma de verificação |
|---|---|---|---|
| Relevância para o problema | | | |
| Qualidade dos dados | | | |
| Qualidade da análise | | | |
| Utilidade para o público-alvo | | | |
| Comunicação dos resultados | | | |

## 12. Plano inicial de trabalho

| Etapa | Atividades principais | Responsável(is) | Prazo | Dependências |
|---|---|---|---|---|
| 1. Definição | | | | |
| 2. Obtenção dos dados | | | | |
| 3. Preparação dos dados | | | | |
| 4. Análise / modelagem | | | | |
| 5. Validação | | | | |
| 6. Comunicação | | | | |

## 13. Riscos do projeto

| Risco | Probabilidade | Impacto | Estratégia de resposta | Responsável |
|---|---|---|---|---|
| | Baixa / Média / Alta | Baixo / Médio / Alto | | |
| | Baixa / Média / Alta | Baixo / Médio / Alto | | |
| | Baixa / Média / Alta | Baixo / Médio / Alto | | |

## 14. Organização da equipe

| Integrante | Papel principal | Responsabilidades | Apoio necessário |
|---|---|---|---|
| | | | |
| | | | |
| | | | |
| | | | |

## 15. Validação da definição do projeto

Antes da entrega, confirme:

- [ ] O problema é real, relevante e delimitado.
- [ ] O público-alvo e as partes interessadas estão identificados.
- [ ] O objetivo geral e os objetivos específicos são coerentes.
- [ ] As perguntas de negócio orientam decisões concretas.
- [ ] Há dados potencialmente disponíveis para responder às perguntas.
- [ ] O escopo é compatível com o prazo e os recursos.
- [ ] Os critérios de sucesso são mensuráveis.
- [ ] Riscos, privacidade, ética e segurança foram considerados.
- [ ] Funções e responsabilidades foram distribuídas.

## 16. Aprovação e registro de ajustes

| Responsável | Validação / observação | Data |
|---|---|---|
| Representante da equipe | | |
| Professor(a) / orientador(a) | | |

### Ajustes solicitados após a apresentação inicial

________________________________________________________________________________

________________________________________________________________________________

