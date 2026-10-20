<img src="assets/logo-udf.jpg" alt="UDF Centro Universitário" width="230">

**Profa. Kadidja Valéria | UDF**  
Ciência de Dados e Aprendizado de Máquina · Sistemas de Informação · 2026.2

# PBL — Biblioteca em Foco

## Identificação

- Estudante ou equipe: **Kauane Braga dos Santos Silva de Sousa e Isabella Ana Dutra de Sousa**
- Turma: **Sistemas de Informação — Noturno — Quarta-feira**
- Data de realização: **16/10/2026**
- Integrantes e contribuições (se em equipe): **Kauane — execução do notebook, experimentos e experimento do MVC Finance; Isabella — PBLs, revisão das respostas e conferência dos links e arquivos. Ambas revisaram o conteúdo completo.**

## Situação-problema

Uma biblioteca universitária enfrenta filas em horários específicos e baixa utilização de alguns serviços. A coordenação deseja melhorar o atendimento e planejar recursos. Este é um cenário didático.

**Público-alvo:** estudantes usuários, equipe de atendimento e gestão.

**Questão norteadora:** como os dados podem orientar o planejamento da biblioteca e a oferta de serviços sem identificar ou discriminar seus usuários?

## Investigação em equipe

1. Delimitem o problema e a decisão a apoiar.
2. Registrem o que já sabem e o que precisam investigar.
3. Formulem duas perguntas de negócio.
4. Definam a unidade de análise, os atributos e o alvo, quando houver.
5. Justifiquem a abordagem e indiquem se uma análise descritiva já seria suficiente.
6. Proponham avaliação, cuidados com os dados e limitações.

## Canvas da equipe

| Campo | Registro |
| --- | --- |
| Problema e decisão | Filas em certos horários e serviços pouco usados. Decisão: quantos atendentes escalar por faixa horária e quais serviços divulgar, reformular ou realocar. |
| Público-alvo | Estudantes usuários (melhor atendimento), equipe de atendimento (escala justa) e gestão (planejamento de recursos). |
| O que sabemos | Há filas em horários específicos (relatos e observação); alguns serviços têm baixa procura; o sistema registra empréstimos, devoluções e entradas. |
| O que precisamos investigar | Em quais dias/horários as filas ocorrem e quanto duram; se a baixa procura é por desconhecimento, horário inadequado ou falta de interesse; efeito do calendário acadêmico (provas, início de semestre). |
| Pergunta de negócio 1 | Quantos atendimentos são esperados por hora em cada dia da semana nas próximas semanas, para dimensionar a equipe? |
| Pergunta de negócio 2 | Existem perfis agregados de uso dos serviços (ex.: "só empréstimo", "estudo em sala", "uso de computadores") que ajudem a direcionar a divulgação dos serviços pouco usados? |
| Unidade de análise e período | P1: faixa de uma hora em um dia (ex.: segunda, 10h–11h), últimos 2 semestres. P2: perfil agregado de visitas/uso por semestre, sem identificação individual. |
| Atributos, unidades e origem pretendida | Dia da semana, hora, semana do calendário acadêmico (início/provas/férias), nº de entradas por hora (catraca), nº de empréstimos/devoluções (sistema da biblioteca), nº de atendentes, uso de salas e computadores (reservas). |
| Alvo e momento em que será conhecido, ou ausência de alvo | P1: alvo = nº de atendimentos na faixa horária, conhecido ao fim de cada hora; previsão feita na semana anterior. P2: sem alvo (agrupamento). |
| Abordagem e justificativa | P1: regressão (alvo numérico), começando por uma referência simples (média por dia/hora). P2: agrupamento não supervisionado sobre dados agregados. Antes de ML, uma análise descritiva (tabela/heatmap de movimento por dia × hora) provavelmente já resolve boa parte da escala; ML só se justifica se melhorar claramente essa referência. |
| Alternativa sem ML | Painel descritivo com média de atendimentos por dia/hora e por período do calendário; pesquisa rápida de satisfação e de conhecimento dos serviços. |
| Como avaliar a proposta | P1: MAE (atendimentos/hora) em semanas futuras reservadas (divisão temporal), comparado à média histórica. Indicadores de resultado: tempo médio de fila e satisfação antes/depois. P2: grupos avaliados pela equipe quanto a significado e utilidade. |
| Privacidade e limitações | Usar dados agregados por hora, sem matrícula/nome; não cruzar com dados acadêmicos individuais; acesso restrito e prazo de retenção. Limitações: dados registram só quem entrou (não quem desistiu da fila), mudanças de calendário e eventos atípicos; usuários que usam pouco a biblioteca ficam sub-representados. |

## Registro de colaboração

| Integrante | Papel | Contribuição |
| --- | --- | --- |
| Kauane Braga dos Santos Silva de Sousa | Analista de dados | Definiu unidade de análise, atributos, alvo e a proposta de regressão e agrupamento. |
| Isabella Ana Dutra de Sousa | Relatora e responsável por privacidade | Redigiu o canvas, a alternativa sem ML e os cuidados com privacidade e limitações. |

## Conclusão da equipe

**Proposta:** Começar com um painel descritivo de movimento por dia × hora e calendário acadêmico para ajustar a escala; em seguida testar uma regressão para prever atendimentos por hora, adotando-a apenas se reduzir o MAE em relação à média histórica. Para os serviços pouco usados, agrupar padrões de uso agregados e combinar com pesquisa de opinião para orientar divulgação — sempre sem identificar usuários.

**Dúvida ainda aberta:** Como medir quem desistiu da fila e não foi atendido (demanda reprimida), já que esses casos não aparecem nos registros?

**Feedback recebido e melhoria realizada:** Registrar após a apresentação. Ideia já aplicada: usamos a mesma lógica de dados agregados e sem identificação adotada no nosso TCC, o MVC Finance, que envia à IA apenas data, valor, tipo e categoria das operações (minimização de dados).

## Entrega

Canvas preenchido e síntese para apresentação de dois minutos. Avaliar coerência da pergunta, dados, abordagem, responsabilidade e colaboração. [Voltar ao início](README.md).
