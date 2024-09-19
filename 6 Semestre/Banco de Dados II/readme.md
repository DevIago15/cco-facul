  # Banco de Dados II 
  Matéria relacionada a lógica e sintaxe de banco de dados SQL (Modelagem e criação de banco).
  Disciplinada por Sérgio Ricardo Borges Junior.
  
  ## Vamos Começar 🚀  
  ## 08/08/2024
  ![Desenho Ementa](https://github.com/DevIago15/cco-facul/blob/master/6%20Semestre/Banco%20de%20Dados%20II/img/ementa.png)

  ## 15/08/2024 - Introdução às Views
    **Prova 19/09**
    Introdução às views no SQLServer, possível visualizar em: ```/sql/criacao-views.sql```

  ## 12/09/2024 - Exercício prova
  **== 1 - Identifique os erros do código abaixo se houver e reescreva corretamente somente as linhas erradas.**
  ~~~~sql
    1 create view ped_total() --ERRO
    2 begin -- ERRO
      3 select ped_numero Pedido,
      4 sum(itp_qtd * itp_qtd -- ERRO) Total
      5 from itens_pedidos having ped_numero -> nunca pode ter order by em view
  6 end -- ERRO
  go
  ~~~~

  == 1 Correção pra prova:
  linha 1: Create View pedTotal
  linha 2: as
  linha 4: sum(itp_qtd * itp_valor) Total
  linha 5: from itens_pedidos group by ped_numero
  linha 6: retirar linha

  == 1 Correção:
  create view ped_total
  as
    select ped_numero Pedido,
    sum (itp_qtd * itp_valor) Total
    from itens_pedidos having ped_numero
  go

  **== 2 - Identifique os erros do código abaixo se houver e reescreva corretamente somente as linhas erradas.**
  ~~~~sql
  1 create view ped_info()
  2 being -- ERRO
  3 as
  4   select ped_numero Pedido, ped_data Data,
  5   case ped_status
  6     where 1 then 'Ativo' -- ERRO
  7     where 2 then 'Inativo' -- ERRO
  8   end Situacao, cli.pes_nome Cliente, fun.pes_nome Cliente --ERRO, est.pes_nome Cliente --ERRO
  9 from pedidos p, pessoas cli, pessoas fun, pessoas est
  10 where p.cli_codigo = cli.pes_codigo and
  11  p.fun_codigo = p.pes_codigo and --ERRO
  12  p.est_codigo = p.pes_codigo --ERRO
  13 end -- ERRO
~~~~

  == 2 Correção:
  linha 1: create view ped_info
  linha 2: remover linha
  linha 6: when 1 then 'Ativo'
  linha 7: when 2 then 'Inativo'
  linha 8: end Situacao, cli.pes_nome Cliente, fun.pes_nome 'Funcionário', est.pes_nome 'Estagiário'
  linha 11: p.fun_codigo = fun.pes_codigo and
  linha 12: p.est_codigo = est.pes_codigo
  linha 13: remover linha

  == 2 Correção:
  create view ped_info
  as
    select ped_numero Pedido, ped_data Data,
    case ped_status
      when 1 then 'Ativo'
      when 2 then 'Inativo'
    end Situacao, cli.pes_nome Cliente, fun.pes_nome 'Funcionário', est.pes_nome 'Estagiário'
    from pedios p, pessoas cli, pessoas fun, pessoas est
    where p.cli_codigo = cli.pes_codigo and
    p.fun_codigo = p.pes_codigo and
    p.est_codigo = p.pes_codigo
  go

== 3 - Identifique os erros do código abaixo se houver e reescreva corretamente somente as linhas erradas.
~~~sql
  1 create function reajustar { -- erro
  2 @valor money,
  3 @taxa decimal(10,2)
  4 } -- erro
  5 return table --ERRO
  6 begin
  7   select (@valor * (1 + @taxa/100)) -- ERRO
  8 end
  9 go
  -- Teste --
  10 select * from reajustar(200, 10) Resultado --ERRO
  ~~~

  == 3 Correção Prova
  linha 1: create function reajustar (
  linha 4: )
  linha 5: returns decimal(10, 2)
  linha 7: return (@valor * (1 + @taxa/100))
  linha 10: select * from dbo.reajustar(200, 10) Resultado

  == 4 - Identifique os erros do código abaixo se houver e reescreva corretamente somente as linhas erradas.
  ~~~sql
  1 create calcTotal (@codigo int) –- Calcula o valor total de um pedido
  2 return table
  3 as
  4 end -- ERRO
  5   returns
  6   (
  7   select avg(itp_qtd * itp_valor)
  8   from itens_pedidos
  9   where ped_numero = @data
  10  )
  11 begin
  go
  -- Teste --
  12 select * from calcTotal(1) Total
  ~~~

  == 4 Correção prova
  linha 1: create function caclTotal (@codigo int)
  linha 2: returns decimal
  linha 4: begin
  linha 5: return
  linha 7: select sum(itp_qtd * itp_valor)
  linha 9: where ped_numero = @codigo
  linha 11: end
  linha 12: select dbo.calcTotal(1) Total

  == 5 - Identifique os erros do código abaixo se houver e reescreva corretamente somente as linhas erradas.
  ~~~sql
  1 create table buscarProd (preco money) 
  2 return decimal(10,2)
  3 (
  4   select prd_codigo Cod,
  5   prd_descricao Produto,
  6   prd_qtd Estoque,
  7   prd_valor Preco
  8   from produtos
  9   where prd_valor > preco
  10 )
  go
  -- Teste --
  11 select dbo.buscarProd(1)
  ~~~

  == 5 - Correção Prova
  linha 1: create function buscarProd (@preco money)
  linha 2: returns table
  linha 3: return (
  linha 9: where prd_valor > @preco
  linha 11: select * from buscarProd(1)

  == 6 - Identifique os erros do código abaixo se houver e reescreva corretamente somente as linhas erradas.
  ~~~sql
  1 create function getItens_Pedido()
  2 return tables
  3 as
  4 return (
  5   select p.prd_descricao Produto,
  6   ip.itp_qtd Qtd,
  7   ip.itp_valor Preco_Unitario,
  8   ip.itp_qtd * ip.itp_valor Valor
  9   from itens_pedidos ip, produtos p
  10  where ip.prd_codigo = ip.prd_codigo and
  11  ip.ped_numero = p.ped_codigo
  12 )
  go
  -- Teste --
  13 select dbo.getPed(3)
  ~~~

  == 6 - Correção
  linha 1: create function getItens_Pedido(@nro int)
  linha 2: returns table
  linha 10: where ip.prd_codigo = p.prd_codigo and
  linha 11: ip.ped_numero = @nro
  linha 13: select * from getItens_Pedido(3)

  == 7 - Identifique os erros do código abaixo se houver e reescreva corretamente somente as linhas erradas.
  ~~~sql
  1 create function buscarPedCli (@fun int)
  2 returns @pedido table (nr int, data datetime, -- esse tipo de retorno é uma função table com uso de variavel e tem begin end
  3   total money, funcionario varchar(50))
  4 as
  5 begin
  6   insert into @ped
  7   select p.ped_numero, p.ped_data, p.ped_valor
  8   from pedidos p, pessoas fun
  9   where p.fun_codigo = p.pes_codigo and
  10  p.cli_codigo = @fun
  11 select @ped
  12 end
  go
  -- Teste --
  13 select buscarPedCli(2)
  ~~~
  == 7 Correção prova
  linha 1: create function buscarPedCli (@cli int)
  linha 6: insert into @pedido
  linha 7: select p.ped_numero, p.ped_data, p.ped_valor, fun.pes_nome
  linha 9: where p.fun_codigo = fun.pes_codigo and
  linha 10: p.cli_codigo = @cli
  linha 11: return
  linha 13: select * from buscarPedCli(2)

 

