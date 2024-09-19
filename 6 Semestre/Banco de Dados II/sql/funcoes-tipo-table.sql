use Vendas_CCO

-- Funções do tipo table -- => É uma função que retorna uma tabela
select * from produtos

alter function buscarProd(
	@preco decimal(10, 2)
)

returns table 
as
	return (select prd_descricao Produto, 
	prd_qtd Estoque,
	prd_valor 'Preco'
	from produtos where prd_valor >= @preco)
	go

-- Testando a função
select * from buscarProd (2)

-- qual a diferença dessa função pra uma view
-- função tem parâmetro

create view vw_Produtoss
as
select prd_descricao Produto, 
	prd_qtd Estoque,
	prd_valor 'Preco'
	from produtos 

select * from vw_Produtoss
where preco >= 2

------------- Dando inser na tb com uma view ---------------

create table myTable
(
	id int not null primary key identity,
	nome varchar(50),
	data datetime default getdate(),
	status int default 0
)
go

insert into myTable (nome) values ('Palmeiras')

select * from myTable

create view vw_MT
as
	select * from myTable

insert into vw_MT (nome) values ('Palmeiras b')

---------------- Função do tipo table que vai passar o pedido e vai retornar a soma do pedidor
create function getItens(@nr_pedido int)
returns table
as
return (
	select p.prd_descricao Produto,
		ip.itp_qtd Quantidade,
		ip.itp_valor 'Preço Unitário',
		ip.itp_qtd * ip.itp_valor Valor
	from itens_pedidos ip, produtos p
	where ped_numero = @nr_pedido and
	ip.prd_codigo = p.prd_codigo
)
go

select sum(valor) Total from getItens (2)

---Insert com Select -------------------
select * from myTable

insert into myTable (nome) select produto from vw_Produtoss
insert into myTable (nome, status) select produto, 10 from vw_Produtoss

-------------------------------------
declare @prod table (nome varchar(50), preco money)
insert into @prod values ('Lapis', 10)
insert into @prod select prd_descricao, prd_valor
from produtos
select * from @prod
go

create function buscarProd2 (@preco decimal (10,2))
returns @prod table (nome varchar(50), qtd int, preco money)
as
begin
	insert into @prod
		select prd_descricao, prd_qtd, prd_valor
		from produtos
		where prd_valor > @preco

	insert into @prod select 'Escrivaninha', 5, 150
	insert into @prod values ('Lapis do Morais', 100, 2)
		
		return

end

select * from buscarProd2 (2)