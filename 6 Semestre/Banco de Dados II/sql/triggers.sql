use Vendas_CCO

select * from produtos
go

create trigger tr_01
on produtos
after update
as
begin
	select * from deleted -- só existem dentro do trigger
	select * from inserted
end
go

-- teste
select * from produtos
update produtos 
set prd_valor = prd_valor * 1.01

update produtos set
	prd_valor = 2.1
	where prd_codigo = 5

create table logprecos
(
	codigo int not null,
	data datetime not null,
	preco_antigo decimal(10,2) not null,
	preco_novo decimal(10,2) not null,
	usuario varchar(20) not null,
	primary key(codigo, data)
)
go


alter trigger tr_01
on produtos
after update
as
begin
insert into logprecos
	select i.prd_codigo, getDate(), d.prd_valor, i.prd_valor, SYSTEM_USER
	from deleted d, inserted i -- só existem dentro do trigger
	where i.prd_codigo = d.prd_codigo
end
go

select * from logprecos


