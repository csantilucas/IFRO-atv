#o nome da pessoa o id do curso registrado e o status do pagamento dela

SELECT 
    pess_nome AS 'Nome do Aluno',
    curs_nome AS 'Nome do Curso',
    paga_status AS 'Status do Pagamento'
FROM
    tb_aluno,
    tb_cadastro_pessoa,
    tb_matricula,
    tb_curso,
    tb_pagamento
WHERE
    FK_cadastro = PK_cadastro
        AND FK_aluno = PK_aluno
        AND FK_curso = PK_curso
        AND FK_pagamento = PK_pagamento;


#pesquisa do id do curso, que volta o nome do curso e os nomes dosalunos reistrados
SELECT 
    PK_curso as "id", curs_nome AS 'Nome do Curso', pess_nome AS 'Nome do Aluno'
FROM
    tb_curso,
    tb_matricula,
    tb_aluno,
    tb_cadastro_pessoa
WHERE
    PK_curso = FK_curso
        AND FK_aluno = PK_aluno
        AND FK_cadastro = PK_cadastro
ORDER BY PK_curso , pess_nome;



# pesquisando o nome do professor  e o nome do curo pela matricula 

SELECT
    PK_matricula AS 'ID da Matrícula',
    curs_nome AS 'Nome do Curso',
    pess_nome AS 'Nome do Professor'
FROM
    tb_matricula,
    tb_turma ,
    tb_curso ,
    tb_professor,
    tb_cadastro_pessoa
WHERE
    FK_turma = PK_turma AND
    tb_turma.FK_curso = PK_curso AND
    FK_professor = PK_professor AND
    FK_cadastro = PK_cadastro
ORDER BY
PK_matricula;

#pesquisa nome e endereco
select 
pess_nome, pess_endereco
from
tb_matricula,
tb_aluno,
tb_cadastro_pessoa,
tb_endereco
where 
FK_aluno = PK_aluno and
tb_cadastro_pessoa.FK_endereco = PK_endereco and
fk_cadastro = PK_cadastro;



    
