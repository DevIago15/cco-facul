  # Compiladores
  Objetivo: Descrever e analisar os passos necessários para que um programa escrito em uma LP de alto nível seja traduzido para um formato que lhe permita ser executado por um computador.
  Disciplinada por Luciana Pavani de Paula Bueno.
  
  ## Vamos Começar 🚀  
  ## 13/08/2024 - Início
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
  ![a](https://github.com/DevIago15/cco-facul/blob/master/6%20Semestre/Compiladores/img/fluxograma.png)
  ![b](https://github.com/DevIago15/cco-facul/blob/master/6%20Semestre/Compiladores/img/fluxograma.png)
  ```c) while I<200  do I := J + I>;```
  ![d](https://github.com/DevIago15/cco-facul/blob/master/6%20Semestre/Compiladores/img/fluxograma.png)
  ```e) "Aqui@temos um arroba"```
