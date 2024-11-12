  # Compiladores
  Objetivo: Descrever e analisar os passos necessários para que um programa escrito em uma LP de alto nível seja traduzido para um formato que lhe permita ser executado por um computador.
  Disciplinada por Luciana Pavani de Paula Bueno.
  
  ## Vamos Começar 🚀  
  ## 13/08/2024 - Início - Prova: 24/04
  O processo de tradução:
  Compiladores são programas que traduzem de uma linguagem de alto nível para linguagem de máquina.
  UM compilador é constituído internamente por fases. Cada fase no processo de tradução constitui-se com a seguinte por meio de uma linguagem intermediária adequada.

  ![fluxograma](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/fluxograma.png)

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

  ## 01/10/2024 - Expressões Regulares (ER) - Início ao Segundo Semestre
  - especificação e reconhecimento de padrões de caracteres
  - ER básicas (ER são padrões)
  ![compiladores_compiladores](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/compiladores_compiladores.png)
  - Operações básicas com ER:
    - * escolha entre alternativas
    ![escolha_entre_alternativas](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/escolha_entre_alternativas.png)
    - * concatenações
    ![concatenacoes](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/concatenacao.png)
    - * repetições
    ![repeticoes](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/repeticao.png)

    Prioridade do compilador:
    ![prioridade](https://github.com/DevIago15/cco-facul/blob/main/6%20Semestre/Compiladores/img/prioridade.png)

   Exercício:
   1 - Considere Alfabeto = {a, b, c}. Escreva uma ER para o conjunto de todas as cadeias sobre esse alfabeto que contém exatamente um b.
   R: cadeias: = abc, bac, acb, b, ab, ba, bc... ER = (a | c) * b (a | c)*

   2 - Com o mesmo Alfabeto anterior, encontre uma ER que considere o conjunto de todas as cadeias de caracteres que contem no maximo um b.
   R:  (a | c)* | (a | c)* b (a | c)*

   3 - ER sobre Alfabeto que considere o conjunto de todas as cadeias de caracteres compostas por um único b, rodeado pelo mesmo número de a's.
   R: ER()

   ## 08/10/2024
   - Uma ou mais repetições (o "tem que ter"): +
  Ex: 7 + 0
  bi + p
  (0 | 1)+
  - Qualquer caractere: "-"
  Casa com qualquer coisa (símbolo de E). É muito abrangente
  Exemplos:
  n.o
  e.tendido
  .*b.*
  - Um intervalo de caracteres: "[]"
  É bem mais exigente, exemplos:
  [aeiou]
  n[ãa]o
  - Intervalos múltiplos (intervalos em listas) "[-]": segue a ordenação do conjunto de caracteres ASCII.
  - Qualquer caractere fora de um conjunto ~ ou ^, exemplos:
    - ^(a | b | c)
    - lista negada
      - [^abc]
      - [^0-0]
  - Subexpressões opcionais: "?" pode ter ou não ter
  Exemplos:
    - falar?
    - (0 | 1)?
    fala[r!]?
  Chaves: {n, m}
  repete de n a m
  Exemplos: (a | b) {1, 3}
  - a{3,}
  - [0-9]{3}
  - Escape: "\"
    - Usa o metacaractere literal ex: "\*"

  ## 22/10/2024 - Imprimir para a semana que vem
  1 - Dê exemplos, quando possível, ao menos 5, de cadeias reconhecidas pelas ERs abaixo:
  a) 0*1+ -> 1, 01001, 011, 00001
  b) (0|1)00(0|1) -> 000, 1001, 000, 1000
  c) (0*10*10*10*)* -> vazio, 111, 0111, 01011
  d) (01)* |1 -> vazio,  1, 01, 0101, 010101
  e) 01*|1 -> 0, 1, 01, 011, 0111
  f) 0(1*|1) -> 0, 01, 011, 0111, 011111

  2 - Escreva a ER equivalente ao conjunto de cadeias sobre Σ = {0,1} que:
  a) termine com três 1's consecutivos; -> [(0 | 1 ) * 11]
  b) tenha ao menos um 1. -> (0 | 1)* 1 (0 | 1)*
  c) tenha ao máximo um 1 -> 0*10* | 0*

  3 - Escreva uma ER para detectar:
  a) um número de PIN com qualquer sequência de 4 números; -> [0 - 9]{4}
  b) um endereço IP na versão IPV4 -> num = [0 - 9] | [1 - 9] [0 - 9] | 1 [0 - 9] [0 - 9] | 2 [0 - 4] [0 - 9] | 2 5 [0 - 4] ou seja num \ . num \ . num \ . num
  c) uma string -> ".*"

  4 -  Escreva uma ER que represente:
  a) uma lista de inteiros separados por vírgulas -> [0 - 9]+ (, [0 - 9]*)*
  b) qualquer número inteiro entre 1 e 20. -> 1 [0 - 9] | 20 | [1 - 9])

  5- Escreva ER para reconhecer: 
  a) Números inteiros -> -? [0 - 9]+
  b) números com ponto -> -?[0 - 9] + \ . [0 - 9]+
  c) números inteiros, reais ou com expoente, tais como 52, -871, 0.01237, -3.75, 6.33e4, -7.48e-2. -> d = [0 - 9]; -?d+(\ . d*)?(e -? d*)?
  d) Identificadores que comecem com uma letra e possam conter letra, nº e sublinhado. ->  [a - z A - Z] (_|[a - z A-Z]| [0 - 9])*
  e) as palavras reservadas if, while, do, for, else -> (if | while | do | for | else)
  f) comentários, entre /* e  */ 
  g) operadores relacionais <, >, <=, >=, =, <>.
