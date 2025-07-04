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