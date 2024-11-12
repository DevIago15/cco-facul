use Vendas_CCO

-- for --
create table myTableTrigger
(
	id int not null primary key identity,
	nome varchar(50) not null,
	data datetime not null
)
go

create table copyTableTrigger
(
	id int not null primary key,
	nome varchar(50) not null,
	data datetime not null
)
go

create trigger trDoCopy
on myTableTrigger
for insert 
as
begin
	insert into copyTableTrigger
	select id, nome, GETDATE()
	from inserted

end

-- teste --
insert into myTableTrigger values ('Goiaba', GETDATE())
select * from myTableTrigger
select * from copyTableTrigger