select * from pessoas
select * from clientes

-- modo beginners
alter procedure cadCli (	
	@nome varchar(50), 
	@cpf varchar(12),
	@renda decimal(10,2)
)
as
begin
	insert into pessoas values
	(@nome, @cpf, 1)

	insert into clientes values
	(@@identity, @renda, @renda * 0.25)
end

-- teste
exec cadCli 'Iagoo pla', '7775555', 1000

select * from pessoas
select * from clientes

--- modo intermedium
create procedure cadCliIntermedium (
	@nome varchar(50), 
	@cpf varchar(12),
	@renda decimal(10,2)
)
as
begin
	begin try
		insert into pessoas values
		(@nome, @cpf, 1)

		insert into clientes values
		(@@identity, @renda, @renda * 0.25)
	end try
	begin catch
		print @@error
	end catch
end

-- teste
exec cadCliIntermedium 'Iago JR', '8555552', 10000

--- modo brabo
create procedure cadCliBrabo (
	@nome varchar(50), 
	@cpf varchar(12),
	@renda decimal(10,2)
)
as
begin
	begin try
		begin tran
			insert into pessoas values
			(@nome, @cpf, 1)

			insert into clientes values
			(@@identity, @renda, @renda * 0.25)
			commit
		end try
		begin catch
		rollback
		print @@error
	end catch
end
-- teste
exec cadCliBrabo 'Iago JR', '8555552', 10000

-- modo mais brabo ainda
alter procedure cadCliBraboMais (
	@nome varchar(50), 
	@cpf varchar(12),
	@renda decimal(10,2)
)
as
begin
	begin try
		begin tran
			insert into pessoas values
			(@nome, @cpf, 1)

			insert into clientes values
			(@@identity, @renda, @renda * 0.25)
			commit
		end try
		begin catch
			rollback
			raiserror ('Problema no cadastrar Cliente', 16, 1) --- define erro vermelho
			return 1
	end catch
end


-- teste
declare @r int
exec @r = cadCliBraboMais 'Iago quinto', '600000', 1000
if @r = 1
	print 'SE FODEU EN'
else
	print 'OK DEMAIS CARALHO'




