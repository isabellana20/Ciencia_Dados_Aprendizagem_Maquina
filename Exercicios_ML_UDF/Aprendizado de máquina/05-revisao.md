<img src="assets/logo-udf.jpg" alt="UDF Centro Universitário" width="230">

**Profa. Kadidja Valéria | UDF**  
Ciência de Dados e Aprendizado de Máquina · Sistemas de Informação · 2026.2

# Questões de revisão — Registro individual

## Identificação

- Estudante ou equipe: **Kauane Braga dos Santos Silva de Sousa e Isabella Ana Dutra de Sousa**
- Turma: **Sistemas de Informação — Noturno — Quarta-feira**
- Data de realização: **16/10/2026**
- Integrantes e contribuições (se em equipe): **Kauane — execução do notebook, experimentos e experimento do MVC Finance; Isabella — PBLs, revisão das respostas e conferência dos links e arquivos. Ambas revisaram o conteúdo completo.**

Responda com suas palavras e apresente os cálculos quando solicitados. Os números dos exercícios manuais não são os resultados do laboratório.

## 1. Explique a diferença entre regra programada para bloquear uma palavra e modelo de spam treinado com exemplos.

**Resposta:** A regra é escrita por uma pessoa ("se contém a palavra X, bloqueie"): é fixa, fácil de explicar, mas gera bloqueios indevidos e é contornada facilmente (trocando letras, por exemplo). O modelo de spam aprende sozinho, a partir de mensagens já classificadas como spam ou legítimas, quais combinações de sinais indicam spam; generaliza para mensagens novas e pode ser retreinado, mas depende da qualidade dos rótulos e também comete erros.

## 2. Por que codificar evadiu/permaneceu como 1/0 não transforma classificação em regressão?

**Resposta:** Porque 0 e 1 são apenas códigos para categorias; o que define a tarefa é o significado do alvo. Não existe "meio evadido" nem faz sentido dizer que 1 é "uma unidade maior" que 0. O objetivo continua sendo prever a classe, e a avaliação usa acurácia, matriz de confusão e sensibilidade, não MAE.

## 3. Uma biblioteca quer estimar empréstimos e descobrir perfis. Que tarefas correspondem a cada pergunta?

**Resposta:** Estimar a quantidade de empréstimos é **regressão** (aprendizado supervisionado, alvo numérico). Descobrir perfis de usuários sem categorias prévias é **agrupamento** (aprendizado não supervisionado, sem alvo).

## 4. O que são atributo, alvo e unidade de análise no laboratório educacional?

**Resposta:** Unidade de análise: cada estudante (fictício) em um semestre. Atributos: as informações usadas para prever, conhecidas na semana 4 — `frequencia_sem4`, `nota_sem4` e `entregas_sem4`. Alvo: o que se quer prever, `evasao_fim_semestre` (0 = permaneceu, 1 = evadiu), conhecido só no fim do semestre.

## 5. Por que calcular a mediana antes de dividir os dados pode invalidar a avaliação?

**Resposta:** Porque a mediana usada para preencher ausentes passaria a conter informação dos registros de teste (vazamento de dados). O modelo seria preparado com algo que não estaria disponível na prática, e o teste deixaria de representar dados realmente novos, tornando a estimativa otimista. A mediana deve ser aprendida só no treino (por exemplo, dentro de um `Pipeline`) e apenas aplicada no teste.

## 6. Em uma matriz didática com TN=80, FP=5, FN=10, TP=5, calcule acurácia e sensibilidade. O resultado é suficiente para aprovar o modelo?

**Resposta:**
- Total = 80 + 5 + 10 + 5 = 100.
- Acurácia = (TN + TP) / total = (80 + 5) / 100 = **0,85 (85%)**.
- Sensibilidade = TP / (TP + FN) = 5 / (5 + 10) = **0,333 (33,3%)**.

Não é suficiente. Só 15 dos 100 casos são positivos; um modelo que sempre prevê negativo teria acurácia 85/100 = 0,85 — a mesma. O modelo deixa passar 2 de cada 3 positivos (10 FN). É preciso comparar com a referência, considerar o custo dos falsos negativos e validar em outros dados antes de aprovar.

## 7. Valores reais 100, 120, 140 e previsões 110, 115, 130. Calcule MAE e informe a unidade se o alvo for vendas em reais.

**Resposta:** Erros absolutos: |100 − 110| = 10; |120 − 115| = 5; |140 − 130| = 10.
MAE = (10 + 5 + 10) / 3 = 25 / 3 ≈ **8,33 reais (R$ 8,33)**. Em média, a previsão erra cerca de R$ 8,33 para mais ou para menos.

## 8. Um R² de -0,2 significa “20% de acertos negativos”? Explique.

**Resposta:** Não. R² não é porcentagem de acertos. R² = 1 − (erro quadrático do modelo / erro quadrático de prever sempre a média do conjunto avaliado). Um R² de −0,2 significa que o erro quadrático do modelo é 20% **maior** que o de simplesmente prever a média, ou seja, o modelo é pior do que essa referência trivial.

## 9. Uma árvore tem acurácia 1,00 no treino e 0,65 na validação. Que hipótese investigar e como?

**Resposta:** Hipótese de **sobreajuste**: a árvore decorou o treino (inclusive ruído) e não generaliza. Investigar com validação cruzada no treino comparando versões mais simples: limitar `max_depth`, aumentar `min_samples_leaf`, observar se a distância treino–validação diminui e se a validação melhora; verificar também possível vazamento ou atributos muito específicos (ex.: identificadores), quantidade de dados e comparação com a referência.

## 10. Por que escolher a profundidade pelo teste prejudica a estimativa final?

**Resposta:** Porque o teste passa a ser usado para tomar decisões sobre o modelo; a configuração escolhida fica ajustada às particularidades daquele conjunto e a acurácia de teste fica otimista. O teste deixa de ser uma avaliação independente. A escolha deve ser feita com validação no treino e o teste usado uma única vez no final.

## 11. Baixa frequência associada à evasão demonstra causa? Proponha explicação alternativa.

**Resposta:** Não; associação não é causalidade. Explicação alternativa: um terceiro fator pode causar as duas coisas — por exemplo, o estudante começou a trabalhar em horário conflitante, teve problema de saúde ou dificuldade financeira, o que reduz a frequência e também leva à evasão. Também pode haver causalidade reversa: quem já decidiu sair deixa de frequentar.

## 12. Um modelo sinaliza um estudante como possível evasão. Que ação responsável pode ser adotada?

**Resposta:** Uma pessoa da equipe de apoio revisa o caso e faz um convite voluntário e acolhedor (conversa, monitoria, orientação, informação sobre auxílios), sem rótulos estigmatizantes, sem punição e sem qualquer decisão acadêmica automática. O estudante pode recusar, pedir explicação e corrigir dados; as informações têm acesso restrito e são descartadas após o uso.

## Fontes adicionais consultadas

**Material da disciplina (Módulo IV); SOUSA, I. A. D.; SANTOS, J. M.; SOUSA, K. B. S. S. *MVC Finance: aplicativo web de gestão financeira pessoal*. TCC — UDF, Brasília, 2026; SCIKIT-LEARN. *User Guide* e *Common pitfalls and recommended practices*. Disponível em: https://scikit-learn.org/stable/. Acesso em: 16 out. 2026. Uso de IA: assistente de IA (Claude) usado para apoiar a redação e conferir cálculos; respostas revisadas por mim.**

[Voltar ao início](README.md).
