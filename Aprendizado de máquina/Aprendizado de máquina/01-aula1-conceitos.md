<img src="assets/logo-udf.jpg" alt="UDF Centro Universitário" width="230">

**Profa. Kadidja Valéria | UDF**  
Ciência de Dados e Aprendizado de Máquina · Sistemas de Informação · 2026.2

# Aula 1 — Conceitos e classificação de problemas

## Identificação

- Estudante ou equipe: **Kauane Braga dos Santos Silva de Sousa e Isabella Ana Dutra de Sousa**
- Turma: **Sistemas de Informação — Noturno — Quarta-feira**
- Data de realização: **16/10/2026**
- Integrantes e contribuições (se em equipe): **Kauane — execução do notebook, experimentos e experimento do MVC Finance; Isabella — PBLs, revisão das respostas e conferência dos links e arquivos. Ambas revisaram o conteúdo completo.**

## Objetivos

Distinguir programação tradicional e Machine Learning, identificar atributos e alvo e diferenciar classificação, regressão e agrupamento.

## 1. Explicação com suas palavras

1. Como um modelo aprende com dados? **O algoritmo recebe muitos exemplos (registros com atributos e, no caso supervisionado, o resultado conhecido) e ajusta parâmetros internos para reduzir o erro entre o que ele prevê e o que realmente aconteceu. Ao final, as regras não foram escritas por um programador: foram extraídas dos padrões presentes nos dados. Depois testamos o modelo em dados que ele não viu, para saber se ele generaliza.**
2. Qual diferença entre algoritmo e modelo? **Algoritmo é o procedimento de aprendizado (por exemplo, "árvore de decisão" ou "regressão linear"). Modelo é o resultado de aplicar esse algoritmo a um conjunto de dados específico: a árvore com as perguntas e limites já definidos, ou a equação com os coeficientes já calculados. O mesmo algoritmo gera modelos diferentes com dados diferentes.**
3. Compare uma regra de bloqueio de palavra com um modelo de spam. **A regra é programação tradicional: alguém escreve "se a mensagem contém 'promoção', bloqueie". Ela é simples e explicável, mas rígida: bloqueia mensagens legítimas que usam a palavra e deixa passar spam que escreve "pr0moção". O modelo de spam aprende, a partir de mensagens já revisadas como spam/legítima, a combinação de muitos sinais (palavras, remetente, links, horário) e pode ser retreinado quando os spammers mudam de estratégia. Em compensação, depende de dados rotulados de qualidade e também erra.**
4. Dê um exemplo de atributo e alvo e defina o momento da previsão. **No laboratório: atributos = frequência, nota e entregas até a semana 4; alvo = evasão ao fim do semestre (0/1). O momento da previsão é o fim da semana 4: só podem entrar atributos já conhecidos nesse instante, e o alvo só será conhecido no fim do semestre. No nosso TCC, o MVC Finance: atributo = título digitado da transação ("farmácia centro"); alvo = categoria da despesa ("Saúde"); a previsão acontece no momento em que o usuário digita o título no modal "Adicionar Transação", antes de escolher a categoria.**

## 2. Quadro comparativo

| Critério | Supervisionado | Não supervisionado |
| --- | --- | --- |
| Presença de alvo no treino | Sim, cada exemplo tem a resposta conhecida (rótulo ou valor). | Não há alvo; só atributos. |
| Pergunta que pode responder | "Qual será a classe/valor deste novo caso?" | "Que grupos ou padrões existem nestes dados?" |
| Tipo de saída | Categoria (classificação) ou número (regressão). | Grupos, estruturas, registros atípicos. |
| Tarefas e exemplo | Classificação: spam/legítima; regressão: tempo de espera em minutos. | Agrupamento: perfis de compra; detecção de anomalias. |
| Dados necessários | Histórico com atributos e desfecho registrado de forma confiável. | Atributos relevantes e comparáveis (escalas tratadas). |
| Forma de avaliação | Comparação com o alvo real em dados de teste: acurácia, matriz de confusão, MAE, R². | Medidas internas (ex.: silhueta) e, principalmente, interpretação e utilidade dos grupos por especialistas. |
| Limitação | Rótulos caros, possivelmente enviesados; só aprende o que foi rotulado. | Não há "resposta certa"; grupos podem não ter significado prático. |

## 3. Situações-problema

| Caso | Situação-problema |
| --- | --- |
| 1 Educação | Prever evadiu/permaneceu com histórico rotulado de turmas anteriores. |
| 2 Saúde | Estimar o tempo de espera em minutos a partir de registros de atendimento. |
| 3 Comércio | Descobrir perfis de compra sem categorias prévias de clientes. |
| 4 Finanças | Prever inadimplente/adimplente com contratos e desfechos conhecidos. |
| 5 Segurança digital | Distinguir spam/legítima com mensagens já revisadas. |
| 6 Comércio | Estimar o total de vendas em reais na próxima semana. |
| 7 Educação | Agrupar perfis de acesso ao ambiente virtual sem rótulo de evasão. |
| 8 Saúde | Classificar exames em categorias previamente definidas por especialistas. |

| Caso escolhido | Alvo ou ausência de alvo | Categoria, quantidade ou grupos? | Abordagem e justificativa | Dados necessários e limitação |
| --- | --- | --- | --- | --- |
| 1 Educação | Alvo: evadiu/permaneceu | Categoria | Supervisionado — classificação, pois o alvo é uma classe conhecida em turmas anteriores. | Frequência, notas, entregas até o momento da previsão. Limitação: turmas antigas podem não representar as atuais; o modelo não explica causas. |
| 2 Saúde | Alvo: tempo de espera (min) | Quantidade | Supervisionado — regressão, pois o alvo é numérico contínuo. | Horário, dia, nº de pacientes, equipe disponível. Limitação: picos raros (surtos) e mudanças de processo distorcem a previsão. |
| 3 Comércio | Sem alvo | Grupos | Não supervisionado — agrupamento, pois não há categorias prévias; queremos descobrir perfis. | Frequência de compra, ticket médio, categorias compradas. Limitação: grupos dependem dos atributos e da escala; precisam de interpretação humana. |
| 5 Segurança digital | Alvo: spam/legítima | Categoria | Supervisionado — classificação, com mensagens já revisadas como rótulo. | Texto, remetente, links, histórico. Limitação: spammers mudam de tática (dados mudam com o tempo); rótulos podem conter erros. |
| 6 Comércio | Alvo: vendas em R$ | Quantidade | Supervisionado — regressão, alvo numérico em reais. | Vendas passadas, sazonalidade, promoções, feriados. Limitação: divisão deve respeitar a ordem temporal; eventos inéditos não são previstos. |
| 7 Educação | Sem alvo (não há rótulo de evasão) | Grupos | Não supervisionado — agrupamento de perfis de acesso. | Logs de acesso: frequência, horário, recursos usados. Limitação: um grupo de "pouco acesso" não significa risco de evasão; privacidade dos logs. |
| 8 Saúde | Alvo: categoria definida por especialistas | Categoria | Supervisionado — classificação, pois as classes já existem e há exemplos rotulados. | Imagens/resultados laudados. Limitação: exige laudos confiáveis e revisão médica; erros têm alto custo. |

## 4. Raciocínio crítico

“Detectar fraude” define sozinho o tipo de aprendizado? **Não. O tipo de aprendizado depende dos dados disponíveis e da pergunta, não do nome do problema. Se existe histórico de operações já investigadas e marcadas como fraude/legítima, é possível usar classificação supervisionada: o modelo aprende padrões de fraudes conhecidas, mas tende a não reconhecer golpes novos e sofre com o desbalanceamento (fraudes são raras). Se não há rótulos, pode-se buscar operações atípicas sem supervisão (detecção de anomalias ou agrupamento): isso pode revelar comportamentos novos, mas "atípico" não é sinônimo de "fraude" — muitas operações incomuns são legítimas e precisam de investigação humana. Na prática, as duas abordagens podem ser combinadas.**

## 5. Conexão com o nosso TCC — MVC Finance

O MVC Finance (TCC de Kauane e Isabella, com Jhonathan de Moura Santos) é um aplicativo web de gestão financeira pessoal com módulo de educação financeira. Hoje ele usa IA generativa (GPT-4o-mini) para o relatório mensal, mas nenhum modelo de ML treinado com dados próprios. Classificamos três problemas que o sistema poderia resolver com ML:

| Problema no MVC Finance | Alvo ou ausência de alvo | Categoria, quantidade ou grupos? | Abordagem e justificativa | Dados necessários e limitação |
| --- | --- | --- | --- | --- |
| Sugerir a categoria ao digitar o título da transação | Alvo: uma das categorias de despesa | Categoria | Supervisionado — classificação; as transações já registradas têm categoria escolhida pelo usuário (rótulo). Reduz o esforço do registro manual, citado no TCC como barreira. Experimento na [atividade 07](07-aplicacao-mvc-finance.md). | Títulos e categorias históricos, com consentimento. Limitação: títulos genéricos ("pix") e rótulos escolhidos errado pelo usuário. |
| Estimar o total de despesas do próximo mês | Alvo: valor em R$ | Quantidade | Supervisionado — regressão; alvo numérico conhecido ao fim de cada mês. | Totais mensais por categoria; divisão temporal obrigatória. Limitação: gastos inesperados e poucos meses de histórico por usuário. |
| Descobrir perfis de gasto para recomendar cursos | Sem alvo | Grupos | Não supervisionado — agrupamento; não existe rótulo de "perfil". Atende ao trabalho futuro do TCC de recomendar cursos com base nos gastos. | Proporção de gastos por categoria (agregada). Limitação: grupos precisam de interpretação; risco de rotular pessoas — a recomendação deve ser opcional. |

## Entrega

Salve este arquivo preenchido. Critérios: distinção conceitual, pertinência dos dados, justificativa e clareza. [Voltar ao início](README.md).
