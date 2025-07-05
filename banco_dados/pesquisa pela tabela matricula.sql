# pesquisa pela matricula
select 
pess_nome as 'aluno', curs_nome as 'curso'
from
tb_aluno,
tb_matricula,
tb_curso,
tb_cadastro_pessoa
where
fk_aluno = PK_aluno and
fk_curso = PK_curso and
fk_cadastro = PK_cadastro;