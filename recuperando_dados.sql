use oficina_mecanica;


select nome, marca, modelo  from cliente_pf
		inner join cliente on idClientePF = idCClientePF
        inner join veiculo on idcliente = idVCliente
        order by nome;
        

select Razao_social, marca, modelo  from cliente_pj
		inner join cliente on idClientePJ = idCClientePJ
        inner join veiculo on idcliente = idVCliente
        order by Razao_social;
        

select nome, Tipo_veiculo, marca, modelo  from cliente_pf
		inner join cliente on idClientePF = idCClientePF
        inner join veiculo on idcliente = idVCliente
        having Tipo_veiculo = "Moto"
        order by marca;
        

select nome_peca from estoque_pecas order by nome_peca;


select count(*) from ordem_servico;


select count(*) from ordem_servico where Status_ordem = 'Concluida'; 


select Razao_Social, CNPJ, Valor from cliente_pj
		inner join cliente on idClientePJ = idCClientePJ
        inner join orcamento on idCliente = idOCliente
        inner join ordem_servico on idOrcamento = idOSOrcamento;
	


select pf.Nome, v.Tipo_veiculo, v.Marca, v.Modelo, o.Numero_orcamento, os.Numero from cliente_pf pf
		inner join cliente c on idClientePF = idCClientePF
        inner join veiculo v on idCliente = idVCliente
        inner join orcamento o on idCliente = idOCliente
        inner join ordem_servico os on idOrcamento = idOSOrcamento;
        

select pf.Nome, v.Tipo_veiculo, v.Marca, v.Modelo, o.Numero_orcamento, os.Numero, os.Status_ordem, e.Especialidade, os.Data_conclusao
	from cliente_pf pf
		inner join cliente c on idClientePF = idCClientePF
        inner join veiculo v on idCliente = idVCliente
        inner join orcamento o on idCliente = idOCliente
        inner join ordem_servico os on idOrcamento = idOSOrcamento
        inner join equipes e on idEquipes = idOSEquipes
        having os.Status_ordem = 'Concluida' and e.Especialidade = 'Motor';
        


select Nome_peca, round((Quantidade_disponivel*Valor_unitario),2) as Valor_total_em_estoque from estoque_pecas
		order by Nome_peca;


select sum(round((Quantidade_disponivel*Valor_unitario),2)) as Valor_total_em_estoque from estoque_pecas;


select f.Nome, e.Especialidade from funcionarios f, equipes e where e.Especialidade = f.Especialidade;


select Responsavel, Numero from equipes e 
		inner join ordem_servico os on idEquipes = idOSEquipes;
        


select Razao_social, Pecas_nescessarias, Quantidade_pecas from cliente_pj
		inner join cliente on idClientePJ = idCClientePJ
        inner join orcamento on idCliente = idOcliente
        inner join precos_orcamento on idOrcamento = idPO_Orcamento
        inner join tabela_precos on idPO_Tabela_precos = idTabela_precos
        where Razao_social = 'Expresso São Miguel Ltda'
        order by Pecas_nescessarias;
        


select Especialidade, Tipo_veiculo, concat(Marca, ' | ', Modelo) as Marca_Modelo, Placa from equipes
		inner join ordem_servico on idEquipes = idOSEquipes
        inner join veiculo on idVeiculo = idOSVeiculo
        order by Especialidade and Tipo_veiculo and Marca_Modelo;