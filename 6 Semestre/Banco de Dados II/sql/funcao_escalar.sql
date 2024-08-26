Use Vendas_CCO
GO

-- Fun��o Escalar => fun��o escalar � uma rela��o entre dois conjuntos que possui um retorno s�
create function reajustar
(
@valor decimal(10,2), -- variavel come�a com @
@taxa decimal(10,2)
)
returns decimal(10,2)
as -- pescocinho da formula
begin
	return (@valor * (1 + @taxa/100))
end
go

-- Teste -> obrigado a colocar o local em que ela est� armazenada
select dbo.reajustar (200, -7.5) Resultado


-- Uso da fun��o
select * from produtos

select prd_descricao Produto, -- incluindo um reajuste sem mexer na tabela
	prd_valor 'Pre�o Atual',
	dbo.reajustar(prd_valor, 10) Aumento,
	dbo.reajustar(prd_valor, -15) Desconto
from produtos
go

update produtos set -- realizando um update com a fun��o
	prd_valor = dbo.reajustar(prd_valor, 5)
	where prd_codigo in (1, 3, 5)
go

select * from produtos

-- criando tabela com a fun��o escalar (tabela com coluna calculada)
create table simulacao
(
	id int not null primary key identity,
	valor decimal(10,2),
	taxa decimal (10,2),
	valor_final as dbo.reajustar(valor, taxa)
)

insert into simulacao(valor, taxa) values (1000, 20)
go

insert into simulacao(valor, taxa) values (1000, -10)
go

insert into simulacao(valor, taxa) values (51.47, 27.69)
go

select * from simulacao

-- Criando outra fun��o
select * from itens_pedidos
go

select sum(itp_qtd * itp_valor) Total
from itens_pedidos
where ped_numero = 3
go

create function calculaTotalPedido
(
	@nr int
)
returns money
as
begin
	return (
		select sum(itp_qtd * itp_valor)
		from itens_pedidos
		where ped_numero = @nr
	)
end
go

select dbo.calculatotalPedido (3) Total

select * from pedidos
update pedidos set
	ped_valor = dbo.calculaTotalPedido(ped_numero)

-- Nova fun��o escalar

select * from pedidos
go

alter function buscarPedidoCliente (@cliente int)
returns int
as
begin
	return (select count (*) from pedidos
	where cli_codigo = @cliente)
end
go

select dbo.buscarPedidoCliente(2) 'Quantidade de Vendas'
go


 -- Fun��o escalar para o estoque m�dio
 create function calculaEstoqueMedio(@produto int)
 returns int
 as
 begin
 return (
	select avg(itp_qtd) 'Estoque M�dio'
	from itens_pedidos
	where prd_codigo = @produto
 )
 end
 go

 select dbo.calculaEstoqueMedio(3) 'Estoque M�dio'

