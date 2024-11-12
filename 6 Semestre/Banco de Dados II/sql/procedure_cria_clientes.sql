create procedure cadClientes 
(
	@nome varchar (50),
	@cpf varchar(12),
	@renda decimal (10,2)
)
as
begin
	begin try
		begin tran
		declare @cod int
		select @cod = pes_codigo from 
		pessoas where pes_cpf = @cpf
		if @@ROWCOUNT = 0 -- pessoa não cadastrada
		begin
			insert into pessoas values (@nome, @cpf, 1)
			insert into clientes values (@@IDENTITY, @renda, @renda * 0.25)
			commit
			return 0 -- sucesso no cadastrado
		end -- fim do if rowcount
		else
		begin
			if not exists (select * from clientes where pes_codigo = @cod) -- se cliente não está cadastrado
			begin -- fim do if not exists
				insert into clientes values (@cod, @renda, @renda * 0.25)
				commit
				return 2 -- uma pessoa se tornou um cliente
			end -- fim do if not exists
			rollback
		end
	end try
	begin catch
		rollback
		return 1 -- retorna erro
	end catch
end
go

-- teste
declare @r int
exec @r = cadClientes 'Thor', '111111', 10000