#1
create view VW_descrição_livro as
select a.titulo as 'livro', a.ano_publicacao as 'ano publicado',a.preco as 'preco'
from livros as a;

#2
create view VW_emprestimo_disponiveis_livro as
select a.titulo as 'livro'
from livros as a
where CPF_usuarioReservar is not null;

#3
create view VW_emprestimo_naoDisponiveis_livro as
select a.titulo as 'livro'
from livros as a
where CPF_usuarioReservar is null;

#4
create view VW_livro_sobre as
select a.titulo as 'livro',
 e.nome_editora as 'editora', 
 au.nome as 'autor'
from livros as a inner join editoras as e on a.codigo_editora = e.codigo_editora
inner join livros_autores as la
inner join autores as au on la.codigo_autor=au.codigo;

#5
create view VW_livro_cadastro as
select 
a.titulo as 'livro',
e.nome_editora as 'editora', 
au.nome as 'autor',
f.nome as 'Funionarios Responsavel'
from livros as a inner join editoras as e on a.codigo_editora = e.codigo_editora
inner join funcionarios as f on a.CPF_funcionario=f.CPF
inner join livros_autores as la
inner join autores as au on la.codigo_autor=au.codigo;

#6
/*
alter view VW_livro_cadastro as
select 
a.titulo as 'livro',
e.nome_editora as 'editora', 
au.nome as 'autor',
f.nome as 'Funionarios Responsavel'
from livros as a inner join editoras as e on a.codigo_editora = e.codigo_editora
inner join funcionarios as f on a.CPF_funcionario=f.CPF
inner join livros_autores as la
inner join autores as au on la.codigo_autor=au.codigo;
*/

#7
/*
drop view VW_livro_cadastro 
*/

#8
/*
são tabelas virtuais para facilitar criação de relatorios
*/

#9
/*
criar tabelas virtuais
*/