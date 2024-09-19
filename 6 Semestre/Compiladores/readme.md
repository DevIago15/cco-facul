  # Compiladores
  Objetivo: Descrever e analisar os passos necessários para que um programa escrito em uma LP de alto nível seja traduzido para um formato que lhe permita ser executado por um computador.
  Disciplinada por Luciana Pavani de Paula Bueno.
  
  ## Vamos Começar 🚀  
  ## 13/08/2024 - Início - Prova: 24/04
  O processo de tradução:
  Compiladores são programas que traduzem de uma linguagem de alto nível para linguagem de máquina.
  UM compilador é constituído internamente por fases. Cada fase no processo de tradução constitui-se com a seguinte por meio de uma linguagem intermediária adequada.

  ![Fluxograma](https://github.com/DevIago15/cco-facul/blob/master/6%20Semestre/Compiladores/img/fluxograma.png)

  Análise Léxica (AL)
  Lê o fluxo de caracteres que compõe o programa fonte => varredura de uma sequência de caracteres.
  Durante a varredura, sequências de caracteres são agrupadas em unidades significativas, chamadas lexenas. Cada lexema é mapeado em um token no formato:
  ```<nome_token, valor_atributo>```

  Portanto, o objetivo principal da análise léxica é identificar sequências de caracteres que constituem um token na linguagem.
  A AL verifica se os caracteres lidos um a um do programa fonte pertencem ao alfabeto da linguagem, identifica tokens e despreza comentários e brancos desnecessários.
  Os tokens constituem classes de símbollos como: palavras reservadas, delimitadores, identificadores...

  Também iniciam a construção da tabela de símbolos e envia mensagens de erros caso identifique unidades léxicas não aceitas pela linguagem.
  Como reconhecer tokens?
  R: Automâtos finitos ou expressões regulares
  *Exemplos:*
  ![a](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/a.png)
  ![b](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/b.png)
  ```c) while I<200  do I := J + I>;```
  ![d](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/d.png)
  ```e) "Aqui@temos um arroba"```

  ## 20/08/2024 - Análise Sintática
  Recebe da análise léxica código fonte na forma de tokens e verifica a estrutura do programa.
  ![fluxograma1](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/fluxo1.png)

  Utiliza os primeiros componentes dos tokens produzidos pela análise léxica para criar uma representação intermediária tipo árvore, que mostra a estrutura gramatical da sequência de tokens.
  É o "coração do compilador", por verificar se a sequência de tokens, forma um programa válido.

  ![exemplo1-resolvido](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/exemplo1-resolvido.png)
  ![exemplo2-resolvido](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/exemplo-2-resolvido.png)

  Para especificar a estrutura das linguagens de programação, são usadas as gramaticas livres de contexto. Então, o analizador sintático é constituido pela gramatica que descreve a linguagem fonte e que são as construções válidas na linguagem.

  Outra função da análise sintática é a detecção de erros de sintaxe, identificando a posição e o tipo de erro ocorrido . Mesmo que os erros ocorram,  o AS devem tentar recupera-los, prosseguindo a análise do texto restante.

  Tarefa: Escreva a AL e a AS do comando em C: if(a-10 > b * 2) = b;

  ## 03/09/2024 - Otimizador de Código Fonte
  Fase que faz algumas transformações no código intermediário com o objetivo de produzir um código objeto melhor. Normalmente, melhor significa mais rápido, mas outros objetivos podem ser desejados como um código menor ou um código objeto que consuma menos energia. O número de otimizações de código realizados por diferentes compiladores varia muito. Aqueles que exploram ao máximo as oportunidades de otimizações são chamados "compiladores otimizadores". Quanto mais otimizações, mais tempo é gasto nessa fase. Não há otimizações simples que melhoram significativamente o tempo de execução de programa objeto sem atrasar muito a compilação.

  Exemplos:
  ![](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/pre-c.png)
  ![]()

  Gerador de Código Objeto
  Fase que gera o código para a máquina alvo. É nessa fase que as propriedades da máquina alvo se tornam o fator principal. A depender da arquitetura da máquina, são selecionados os registradores, ou localizações de memoria para cada variável do programa, com uma cuidadosa atribuição. Cada máquina possui um conjunto diferente de instruções e de meios de acesso ao S.O para refletir os comandos do programa fonte. Exemplos em linguagem simbólica para um hardware hipotético:
  ![]()
  ![]()
