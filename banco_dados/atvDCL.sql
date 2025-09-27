select*from mysql.user;

show grants for 'marcos.alves';

#1
create user'marcos.rost'@'%'identified by 'luisa2109';
create user 'renato.soares'@'localhost' identified by 'marta3029';
create user 'marta.rocha'@'localhost' identified by '12365';
create user 'josefina.andrade','192.168.0.23'identified by '45632';
create user 'andre.alves'@'%'identified by '78945';


#2
ALTER USER 'marcos.rost'@'%' IDENTIFIED BY '79845';
ALTER user 'renato.soares'@'localhost' identified by '45612';
ALTER user 'marta.rocha'@'localhost' identified by '12345';
ALTER user 'josefina.andrade','192.168.0.23'identified by '14725';
ALTER user 'andre.alves'@'%'identified by '78945';



#3

drop user 'andre.alves'@'%';


#4
create view vw_rel_liv_est as
select l.titulo as 'livro',
 e.nome_editora as 'editora', 
 au.nome as 'autor'
from livros as l 
inner join editoras as e on l.codigo_editora = e.codigo_editora
inner join livros_autores as la
inner join autores as au on la.codigo_autor=au.codigo;



#5

grant all on *.* to 'marcos.root'@'%' with grant option;
grant select,update, delete, insert on biblioteca.* to 'renato.soares'@'localhost';
GRANT SELECT ON biblioteca.vw_rel_liv_est TO 'marta.rocha'@'localhost';
GRANT SELECT (titulo), UPDATE (preco) ON biblioteca.livros TO 'josefina.andrade'@'192.168.0.23';
GRANT SELECT ON biblioteca.vw_rel_liv_est TO 'andre.alves'@'%';

#6

show grants for 'renato.soares'@'localhost';
show grants for 'marta.rocha'@'localhost';

