select tt.ci_turma as id,REPLACE(tt.ds_ofertaitem||' - '||tt.ds_turma,' |','|') as descricao
,(	select 
	
	COUNT(*)
	from academico.tb_aluno ta
	join academico.tb_ultimaenturmacao tue on tue.cd_aluno = ta.ci_aluno
	join educacenso_exp.tb_pessoa_receita tr on tr.nr_cpf = ta.nr_cpf
	where tue.cd_turma = tt.ci_turma
	and tue.nr_anoletivo = 2019
	and (	( (NOT tr.fl_nome_errado OR tr.fl_nome_errado is null) AND ta.nm_aluno != tr.nm_pessoa ) or 
		( (NOT tr.fl_nascimento_errado OR tr.fl_nascimento_errado is null) AND ta.dt_nascimento != tr.dt_nascimento ) or
		( (NOT tr.fl_mae_errado OR tr.fl_mae_errado is null) AND ta.nm_mae != tr.nm_mae )
		)
	)AS QTD
from academico.tb_turma tt
where tt.nr_anoletivo = 2019
and tt.fl_ativo = 'S' 
and tt.cd_unidade_trabalho = 677
and cd_etapa not in (137,138,149,200,206,207,208,209,210,211,213,214)
