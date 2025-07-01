use CADASTRO;
#Crie a tabela lotacao conforme o diagrama acima com suas chaves estrangeiras. Dica:(CREATE TABLE) ------------------------------------------------------------------------------------------

CREATE TABLE lotacao (
    lota_id INT PRIMARY KEY AUTO_INCREMENT,
    sala VARCHAR(45),
    fk_cursos INT,
    FOREIGN KEY (fk_cursos)
        REFERENCES cursos (curs_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    fk_professor INT,
    FOREIGN KEY (fk_professor)
        REFERENCES professor (prof_id)
        
);

#.2 Altere as colunas que não estão de acordo com a nomenclatura em alunos (profissao), cursos (totaulas), lotacao (sala) e professor (nome). Dica:(ALTER TABLE) ------------------------

rename table cursos to curso;
rename table alunos to aluno;

alter table alunos change profissao alun_profissao varchar(45); 
alter table cursos change totaulas total_aulas varchar(45);
alter table professor change nome prof_nome varchar(45);
alter table lotacao change sala lota_sala varchar(45);

show tables;
describe aluno;
describe curso;
describe lotacao;
describe matricula;
describe professor; 



#. Insira em os seguintes registros nas tabelas; Dica(INSERT INTO) ----------------------------------------------------------------------------------------------------------------------


delete from professor where prof_id=2;
delete from lotacao where fk_professor=3;

select * from professor;

insert into professor(prof_id,prof_nome,prof_formacao,prof_telefone) values (1,"Carlos Ferreira dos Santos","Tecnologo ADS","69998002020");
insert into professor(prof_id,prof_nome,prof_formacao,prof_telefone) values (2,"Marta Carmelle Silva","Graduacao e Redes","69998002020");
insert into professor(prof_id,prof_nome,prof_formacao,prof_telefone) values (3,"Daniel gusmao lopes","Graduacao em BD","69998002020");
insert into professor(prof_id,prof_nome,prof_formacao,prof_telefone) values (4,"Jose maria da penha","Tecnologo em ADS","69998002020");
insert into professor(prof_id,prof_nome,prof_formacao,prof_telefone) values (5,"Gleiser Rodrigues","Gruaduacao em SI","699322339001");

select * from lotacao;

insert into lotacao(lota_id, lota_sala, fk_cursos, fk_professor) values (1, "laboratorio 1", 15, 2);
insert into lotacao(lota_id, lota_sala, fk_cursos, fk_professor) values (2, "laboratorio 2", 27, 1);
insert into lotacao(lota_id, lota_sala, fk_cursos, fk_professor) values (3, "laboratorio 2", 25, 3);
insert into lotacao(lota_id, lota_sala, fk_cursos, fk_professor) values (4, "laboratorio 4", 25, 4);
insert into lotacao(lota_id, lota_sala, fk_cursos, fk_professor) values (5, "laboratorio 5", 10, 5);

update lotacao set lota_sala = ("laboratorio 3") where lota_id =3;
update lotacao set fk_cursos = (23) where lota_id =4;

#Atualize o telefone do GLEISER RODRIGUES para (6998523245) e da MARTA CARMELE SILVA para (6998512215). DICA:(UPDATE) 

update professor set prof_telefone = ("6998523245") where prof_id =5;
update professor set prof_telefone = ("6998512215") where prof_id =2;

#Apague tabela curso o (Curso de PHP, versão 4.0) e o (Curso de Otimização de Sites) DICA: (DELETE) 

select*from curso;

delete from curso where curs_id = 30;

#Faça uma consulta que retorna todos os alunos que são brasileiros ordenado o resultado de forma  ascendente. 

select * from aluno;
select * from aluno where  alun_nacionalidade = "Brasil"  order by alun_nome ;

#Faça uma consulta que retorne o nome a profissão e nacionalidade dos alunos que tem a profissão de programador e nasceram depois de "1998-01-01" e seja Brasileiro

select * from aluno where alun_profissao ="Programador" and alun_nascimento >= 1998-01-01 and  alun_nacionalidade = "Brasil"  order by alun_nome ;

#Faça uma consulta de todos os alunos que tem a nacionalidade de Portugal e ordene a resposta pela profissão e depois por nome.
 
select * from aluno where alun_nacionalidade = "portugal" order by alun_profissao asc, alun_nome asc; 

#Faça uma consulta que retorna os alunos que tem como profissão Auxiliar Administrat e a primeira letra no nome seja D.

select * from aluno where alun_profissao = "Auxiliar Administrat" and alun_nome like'D%';


