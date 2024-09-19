use Vendas_CCO
go

	-- View dos Itens dos Pedidos --
create view vw_PedTotal
as
	select ped_numero 'Numero do Pedido', sum(itp_qtd * itp_valor) 'Valor do Item'
	from itens_pedidos
	group by ped_numero

go
	-- Teste --
select * from vw_PedTotal

	-- View de Pedidos --
select * from pedidos

update pedidos set ped_status = 2
where ped_numero = 2 or ped_numero = 4 -- não pode ser AND aqui nunca, sempre OR 
go

create view vw_PedidoInfo
as
select p.ped_numero Pedido,
	p.ped_data Data,
	case ped_status
		when 1 then 'Ativo'
		when 2 then 'Pendente'
		when 3 then 'Cancelado'
	end Situação,
	cli.pes_nome Cliente,
	f.pes_nome Funcionario,
	est.pes_nome Estagiario
from pedidos p, pessoas cli, pessoas f, pessoas est
where p.cli_codigo = cli.pes_codigo and 
	p.fun_codigo = f.pes_codigo and
	p.est_codigo = est.pes_codigo
go

	-- Junção das Views Criadas - Perde Desempenho, porém as vezes é a única opção --
create view vw_PedDetalhes
as
select pt.[Numero do Pedido] Pedido,
	pin.Data Data,
	pt.[Valor do Item] Total,
	pin.Situação Situacao,
	pin.Cliente Cliente,
	pin.Funcionario Funcionario,
	pin.Estagiario Estagiario,
	pin.Situação Situação
from vw_PedTotal pt, vw_PedidoInfo pin
where pt.[Numero do Pedido] = pin.Pedido
go

select * from vw_PedDetalhes

	-- Dando select em outro banco de dados -- 
use master

select * from Vendas_CCO.dbo.vw_PedTotal

	-- Criando View de Produtos --
update produtos set prd_qtd = 3 where prd_codigo in (2, 4) -- atualizando situação

create view vw_Produtos
as
select p.prd_codigo Codigo,
	p.prd_descricao Produto,
	p.prd_qtd Estoque,
	p.prd_valor Preço,
	case prd_status
		when 1 then 'Ativo'
		else 'Inativo'
	end Situação,
	case
		when prd_qtd <= 5 then 'Estoque Baixo'
			else 'Normal'
		end 'Situação Estoque'
from produtos p
go

select * from vw_Produtos














