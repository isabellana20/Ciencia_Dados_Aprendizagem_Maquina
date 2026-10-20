<img src="assets/logo-udf.jpg" alt="UDF Centro Universitário" width="230">

**Profa. Kadidja Valéria | UDF**  
Ciência de Dados e Aprendizado de Máquina · Sistemas de Informação · 2026.2

# PBL integrador — Apoio à Permanência

## Identificação

- Estudante ou equipe: **Kauane Braga dos Santos Silva de Sousa e Isabella Ana Dutra de Sousa**
- Turma: **Sistemas de Informação — Noturno — Quarta-feira**
- Data de realização: **16/10/2026**
- Integrantes e contribuições (se em equipe): **Kauane — execução do notebook, experimentos e experimento do MVC Finance; Isabella — PBLs, revisão das respostas e conferência dos links e arquivos. Ambas revisaram o conteúdo completo.**

## Contexto

Uma instituição quer compreender sinais associados à evasão e oferecer apoio antes do fim do semestre. Público-alvo: estudantes matriculados e equipe de apoio acadêmico. O cenário é didático e a prática usa dados sintéticos.

**Questão norteadora:** como identificar situações que merecem atenção e oferecer apoio, reconhecendo erros do modelo e dificuldades que os dados não capturam?

## Proposta da equipe

### 1. Delimitação

- Problema e público: **Estudantes que abandonam o curso durante o semestre muitas vezes só são percebidos tarde demais. Público: estudantes matriculados (beneficiários do apoio) e equipe de apoio acadêmico (usuária das informações).**
- Decisão que o resultado pode apoiar: **Priorizar a ordem de contato da equipe de apoio para oferecer um convite voluntário (monitoria, orientação, acolhimento) a partir da semana 4.**
- Definição de evasão, unidade e horizonte: **Evasão = estudante sem matrícula ativa/sem frequência ao fim do semestre (excluindo transferência interna e trancamento formal, que seriam analisados à parte). Unidade: estudante em um semestre. Horizonte: previsão ao fim da semana 4 para o desfecho no fim do semestre.**

### 2. Perguntas de negócio

1. **Quais estudantes, com base em frequência, notas e entregas até a semana 4, têm maior chance estimada de não concluir o semestre e poderiam receber um convite de apoio?**
2. **Quantos convites a equipe consegue atender e qual sensibilidade (proporção de casos de evasão alcançados) obtemos com essa capacidade?**

### 3. Dados necessários

| Dado | Papel no projeto | Disponível quando? | Origem pretendida | Necessidade e risco |
| --- | --- | --- | --- | --- |
| Frequência até a semana 4 (%) | Atributo | Fim da semana 4 | Diário de classe | Sinal forte na simulação; risco baixo se agregado. Faltas justificadas podem distorcer. |
| Nota parcial até a semana 4 | Atributo | Fim da semana 4 | Sistema acadêmico | Útil; pode ter ausências (avaliações ainda não lançadas). |
| Entregas de atividades até a semana 4 | Atributo | Fim da semana 4 | Ambiente virtual | Útil; depende do professor usar o AVA. |
| Situação ao fim do semestre | Alvo | Fim do semestre | Secretaria acadêmica | Necessário para treinar; definição precisa ser padronizada. |
| Identificador pseudonimizado | Ligação entre bases (não entra no modelo) | Sempre | Secretaria | Necessário para unir dados; risco de reidentificação — acesso restrito. |
| Dados socioeconômicos/sensíveis | Não usar como atributo; apenas para auditoria de equidade, se autorizada | — | — | Alto risco de discriminação; só com base legal, consentimento e comitê de ética. |

Diferencie dados usados na simulação e dados que seriam necessários para uma investigação real: **Na simulação usamos só 3 atributos sintéticos gerados por uma fórmula escolhida, com 600 registros independentes. Uma investigação real precisaria de históricos de vários semestres, definição oficial de evasão, dados de várias turmas e cursos, informação temporal (para divisão por período), informações para auditoria de grupos e participação dos próprios estudantes (ex.: questionário de dificuldades), com aprovação ética e conformidade com a LGPD.**

### 4. Abordagem e algoritmo

- Classificação, regressão ou outra formulação, com justificativa: **Classificação binária supervisionada, pois o alvo (evadiu/permaneceu) é uma categoria conhecida no histórico. Codificar 1/0 não transforma em regressão.**
- Algoritmo introdutório escolhido: **Árvore de decisão (`max_depth=5`, `min_samples_leaf=10`) com imputação pela mediana em pipeline — interpretável, permite explicar as regras para a equipe.**
- Referência simples: **`DummyClassifier` que sempre prevê a classe mais frequente (permaneceu).**

### 5. Avaliação

- Preparação, divisão e validação: **Holdout estratificado 75/25 (450/150), semente 42; imputação aprendida só no treino; escolha da profundidade por validação cruzada estratificada de 5 partes no treino; teste usado uma única vez. Em dados reais: treinar em semestres anteriores e testar em semestre posterior.**
- Métricas e razão da escolha: **Acurácia (visão geral), matriz de confusão e sensibilidade da classe 1 (proporção de evasões alcançadas), porque o falso negativo — deixar de convidar quem precisa — é o erro mais grave aqui. Comparação obrigatória com a referência.**
- Resultados efetivamente calculados e link da evidência: **Árvore: acurácia de validação 0,722 ± 0,039; teste 0,780 (referência 0,593); TN=75, FP=14, FN=19, TP=42; sensibilidade 0,689. Evidência: [notebook executado](notebooks/laboratorio-equipe.ipynb), [registro do laboratório](03-aula2-laboratorio.md), [matriz](assets/matriz-confusao.png).**
- Erros relevantes e consequências: **19 falsos negativos (≈31% dos evadidos não sinalizados) ficariam sem convite direcionado; 14 falsos positivos receberiam contato desnecessário. Por isso o apoio deve ser aberto a todos e o modelo serve apenas para priorizar.**

### 6. Limites e proteção

- Por que os resultados não demonstram causalidade? **O modelo encontra associações entre atributos e o desfecho; não houve intervenção controlada. Baixa frequência e evasão podem ter causas comuns (trabalho, saúde, problemas financeiros). Além disso, na simulação as associações foram definidas pela própria fórmula.**
- Por que dados sintéticos não validam uso institucional? **Porque refletem apenas as suposições de quem os gerou: a distribuição, o ruído e as relações foram escolhidas. Não representam a população real, seus grupos, mudanças ao longo do tempo nem a qualidade dos registros da instituição.**
- Que grupos podem ser mal representados? Como investigar isso com evidências apropriadas? **Estudantes trabalhadores/noturnos, ingressantes, estudantes com deficiência, cursos pequenos, EAD. Investigar comparando sensibilidade e taxa de falsos positivos por grupo em dados reais autorizados, com amostra suficiente, apoio de comitê de ética e escuta dos próprios estudantes. O conjunto sintético não tem grupos e não permite afirmar equidade.**
- Como minimizar dados, restringir acesso e definir retenção? **Seguimos a mesma prática do nosso TCC, o MVC Finance, que envia ao serviço de IA só data, valor, tipo e categoria, sem nome, e-mail ou identificador, e não armazena o relatório gerado. Aqui: Usar apenas os atributos necessários; pseudonimizar; acesso só à equipe de apoio com registro de quem acessou; não compartilhar com professores para fins de avaliação; excluir/anonimizar as listas ao fim do semestre e manter só dados agregados para reavaliar o modelo, conforme a LGPD.**
- Como garantir revisão humana e contestação? **A lista é revisada pela equipe de apoio antes de qualquer contato; o estudante é informado de que o convite é opcional e pode pedir explicação e correção dos dados; nenhuma decisão acadêmica é tomada com base no modelo; canal para reclamações e reavaliação periódica do modelo.**

### 7. Recomendações de apoio

- Ação voluntária proposta: **Convite acolhedor (e-mail/mensagem e contato da coordenação) para conversa com a equipe de apoio, monitoria, orientação de estudos e informação sobre bolsas/auxílios — sem mencionar "risco de evasão" de forma estigmatizante.**
- Como acolher estudantes não sinalizados pelo modelo: **Divulgação ampla dos serviços de apoio para toda a turma, canal de autoencaminhamento e encaminhamento por professores e colegas — o modelo não é a única porta de entrada.**
- O que precisa ser verificado antes de aplicação real: **Desempenho com dados reais e divisão temporal; auditoria por grupos; aprovação ética e jurídica (LGPD); definição oficial de evasão; capacidade da equipe; piloto com acompanhamento e avaliação do efeito do apoio.**

Previsões não são certezas. Priorize apoio e revisão humana, sem punições ou decisões automáticas prejudiciais.

## Apresentação de cinco minutos

| Tempo | Conteúdo | Responsável |
| --- | --- | --- |
| 1 minuto | Problema e dados | Isabella |
| 2 minutos | Método e resultados | Kauane |
| 1 minuto | Limitações | Isabella |
| 1 minuto | Recomendações de apoio | Kauane |

## Contribuições

| Integrante | Contribuição verificável |
| --- | --- |
| Kauane Braga dos Santos Silva de Sousa | Execução do notebook ([laboratorio-equipe.ipynb](notebooks/laboratorio-equipe.ipynb)), seções 4 e 5 (abordagem e avaliação) e recomendações de apoio. |
| Isabella Ana Dutra de Sousa | Seções 1–3 (delimitação, perguntas e dados) e 6 (limites e proteção), com base na experiência de minimização de dados do nosso TCC (MVC Finance). |

[Voltar ao início](README.md).
