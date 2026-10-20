<img src="assets/logo-udf.jpg" alt="UDF Centro Universitário" width="230">

**Profa. Kadidja Valéria | UDF**  
Ciência de Dados e Aprendizado de Máquina · Sistemas de Informação · 2026.2

# Autoavaliação e conferência da entrega

## Identificação

- Estudante ou equipe: **Kauane Braga dos Santos Silva de Sousa e Isabella Ana Dutra de Sousa**
- Turma: **Sistemas de Informação — Noturno — Quarta-feira**
- Data de realização: **16/10/2026**
- Integrantes e contribuições (se em equipe): **Kauane — execução do notebook, experimentos e experimento do MVC Finance; Isabella — PBLs, revisão das respostas e conferência dos links e arquivos. Ambas revisaram o conteúdo completo.**

## Checklist

- [x] Diferenciei IA, Ciência de Dados e ML com um exemplo.
- [x] Completei o quadro supervisionado/não supervisionado.
- [x] Justifiquei pelo menos cinco situações-problema.
- [x] Registrei a investigação da biblioteca.
- [x] Identifiquei atributos, alvo, unidade e momento da previsão.
- [x] Executei e documentei a prática em Python ou Orange.
- [x] Escolhi configurações usando treino/validação.
- [x] Mantive o teste fora do ajuste e da seleção.
- [x] Interpretei acurácia, matriz, MAE e R².
- [x] Comparei com uma referência e discuti erros.
- [x] Registrei limitações, dados sintéticos, privacidade e vieses.
- [x] Formulei recomendações de apoio com revisão humana.
- [x] Respondi às questões individuais.
- [x] Conferi os links e os arquivos de evidências.
- [x] Substituí os campos PREENCHER ou justifiquei os não aplicáveis.

## Reflexão individual

- O que aprendi e consigo explicar: **Como aplicar ML a um sistema que nós mesmas desenvolvemos (o MVC Finance): a sugestão de categoria é classificação, a previsão de gastos é regressão e os perfis de gasto são agrupamento. Também: a diferença entre programação tradicional e ML; supervisionado (classificação/regressão) × não supervisionado (agrupamento); por que separar o teste antes de qualquer transformação; como ler a matriz de confusão e calcular acurácia e sensibilidade; o que significam MAE e R².**
- Qual foi minha principal dificuldade: **Entender por que a acurácia sozinha engana (classes desbalanceadas) e por que o R² não é porcentagem de acertos.**
- Qual evidência mostra meu avanço: **O [notebook executado](notebooks/laboratorio-equipe.ipynb), o cálculo manual da matriz (117/150 = 0,78) e da sensibilidade (42/61 ≈ 0,689) no [registro do laboratório](03-aula2-laboratorio.md) e as respostas da [revisão](05-revisao.md).**
- Como contribuímos com a equipe: **Kauane executou os notebooks e o experimento do MVC Finance; Isabella conduziu os PBLs, revisou as respostas e conferiu links e arquivos. Ligamos a disciplina ao nosso TCC (MVC Finance) na [atividade 07](07-aplicacao-mvc-finance.md).**
- O que preciso revisar: **Métricas para classes desbalanceadas (precisão, F1) e validação com divisão temporal.**
- Ferramentas de apoio utilizadas, incluindo IA quando houver, e como verifiquei as respostas: **Python/Jupyter com scikit-learn 1.9.1; assistente de IA (Claude) para apoio na redação e organização. Os números foram conferidos executando o notebook (semente 42) e refazendo os cálculos manualmente.**

## Critérios de avaliação

Escala sugerida do material: nível 3 consistente, 2 adequado com lacunas, 1 parcial, 0 ausente/incoerente. Nota do critério = peso × nível/3. A professora pode ajustar a aplicação.

| Critério | Peso aula 1 | Peso aula 2/PBL |
| --- | --- | --- |
| Problema e conceitos | 3,0 | 2,0 |
| Dados e justificativa | 2,0 | 2,0 |
| Método e avaliação | 1,0 | 3,0 |
| Interpretação e responsabilidade | 2,0 | 2,0 |
| Clareza e colaboração | 2,0 | 1,0 |
| Total | 10,0 | 10,0 |

Na aula 1, método corresponde à avaliação proposta. Na aula 2, inclui execução e interpretação. A maior acurácia isolada não assegura a melhor avaliação da atividade.

## Fontes de apoio

- SCIKIT-LEARN. *User Guide*. https://scikit-learn.org/stable/user_guide.html.
- SCIKIT-LEARN. *Common pitfalls and recommended practices*. https://scikit-learn.org/stable/common_pitfalls.html.
- ORANGE DATA MINING. *Test and Score*. https://orangedatamining.com/widget-catalog/evaluate/testandscore/.

Referências indicadas no material didático do módulo, consultadas em 14 out. 2026. Registre a data da sua própria consulta quando utilizar novas fontes.

[Voltar ao início](README.md).
