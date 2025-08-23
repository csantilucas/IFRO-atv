select l.titulo as 'titulo do livro',a.nome as 'autor', e.nome_editora as 'editora', f.nome as 'Funcionario', f.funcao as 'funcao do funcionario'
from  livros as l inner join funcionarios as f
on l.CPF_funcionario=f.CPF
inner join editoras as e on l.codigo_editora=e.codigo_editora
inner join livros_autores as p
inner join autores as a on p.codigo_autor=a.codigo
where l.CPF_usuarioReservar is null;

select * from livros;

SELECT 
    l.titulo AS 'livro cadastrado',
    f.nome AS 'Funcionario',
    f.funcao AS 'funcao do funcionario'
FROM
    livros AS l
        INNER JOIN
    funcionarios AS f ON l.CPF_funcionario = f.CPF;


