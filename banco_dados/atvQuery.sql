#1
select f.nome 
from funcionarios as f
where f.CPF in (select l.CPF_funcionario from livros as l);

#2

select e.nome_editora, (select count(*) from livros as l where l.codigo_editora = e.codigo_editora)as quantLivros
from editoras as e ;

#3



#4




select a.nome from autores as a,(select l.titulo
								from  livros as l 
                                inner join livros_autores as la 
                                inner join autores as a on la.codigo_autor=a.codigo);
                                



select (select l.titulo as 'titulo do livro'
from  livros as l
inner join livros_autores as p
inner join autores as a on p.codigo_autor=a.codigo
),a.nome as autor, count(*) as quantidade_de_livros 
from autores as a  
inner join livros_autores as la on a.codigo=la.codigo_autor
GROUP BY A.nome;





