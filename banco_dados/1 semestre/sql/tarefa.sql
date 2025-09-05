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

alter table aluno change profissao alun_profissao varchar(45); 
alter table curso change totaulas total_aulas varchar(45);
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

#Atualize o telefone do GLEISER RODRIGUES para (6998523245) e da MARTA CARMELE SILVA para (6998512215). DICA:(UPDATE) ---------------------------------------------------------

update professor set prof_telefone = ("6998523245") where prof_id =5;
update professor set prof_telefone = ("6998512215") where prof_id =2;

#Apague tabela curso o (Curso de PHP, versão 4.0) e o (Curso de Otimização de Sites) DICA: (DELETE) ---------------------------------------------------------------------

select*from curso;

delete from curso where curs_id = 30;

#Faça uma consulta que retorna todos os alunos que são brasileiros ordenado o resultado de forma  ascendente. ---------------------------------------------------------------

select * from aluno;
select * from aluno where  alun_nacionalidade = "Brasil"  order by alun_nome ;

#Faça uma consulta que retorne o nome a profissão e nacionalidade dos alunos que tem a profissão de programador e nasceram depois de "1998-01-01" e seja Brasileiro---------------------------------------

select * from aluno where alun_profissao ="Programador" and alun_nascimento >= 1998-01-01 and  alun_nacionalidade = "Brasil"  order by alun_nome ;

#Faça uma consulta de todos os alunos que tem a nacionalidade de Portugal e ordene a resposta pela profissão e depois por nome.----------------------------------------------------------------
 
select * from aluno where alun_nacionalidade = "portugal" order by alun_profissao asc, alun_nome asc; 

#Faça uma consulta que retorna os alunos que tem como profissão Auxiliar Administrat e a primeira letra no nome seja D.-------------------------------------------------------------------------

select * from aluno where alun_profissao = "Auxiliar Administrat" and alun_nome like'D%';

#Faça uma consulta que retorna o nome a profissão data de nascimento e o sexo dos alunos que nasceram entre "2000-01-01" e "2009-01-01" e ordene o resultado pela profissão.---------------------------------------------

select * from aluno;
describe aluno;
select alun_profissao, alun_sexo, alun_nascimento from aluno where alun_nascimento  between '2000-01-01' and '2009-01-01';

#Faça uma consulta dos alunos que tem um peso superior a 70 e menor que 90 com altura maior que 1.60 e ordene o resultado pelo nome. ---------------------------------------------------------------

select * from aluno where alun_peso between 70 and 90 and alun_altura > 1.60 order by alun_nome ;

# Faça uma consulta que conta quantos alunos são. Brasileiros e programadores.--------------------------------------------------------------------------------

select count(alun_nacionalidade) from aluno where alun_nacionalidade = "Brasil" and alun_profissao = 'Programador'  ;

#Faça uma consulta que retorna o nome a profissão data de nascimento e o sexo dos alunos que nasceram entre e "2009-01-01" e ordene o resultado pela profissão. --------------------------------------------

select alun_nome, alun_profissao, alun_nascimento, alun_sexo from aluno where alun_nascimento between  "2000-01-01"  and "2009-01-01";


# Faça uma consulta que conta quantos cursos tem carga horaria maior igual a 40 horas existe na tabela curso. ---------------------------------------------------------------------------------
describe curso;

select * from curso where curs_carga >= 40;

#Faça uma consulta que retorna qual é valor máximo da coluna totaulas.-----------------------------------------------------------------------------------------
select* from curso;
select max(total_aulas) as maior_valor from curso;

# Faça uma consulta que retorna qual é valor mínimo da coluna totaulas. ----------------------------------------------------------------------------------------

select* from curso;
select min(total_aulas) as menor_valor from curso;


#. Faça uma consulta que retorna o nome do aluno, o nome do curso e seu ID de todos os alunos que estão matriculados no curso de id=8; -------------------------------

alter table matricula change alunos_id fk_aluno int;
alter table matricula change cursos_id fk_curso int;

alter table matricula add constraint fk_alunos FOREIGN KEY (fk_aluno)REFERENCES aluno(alun_id) on delete restrict on update restrict;
alter table matricula add constraint fk_cursos FOREIGN KEY (fk_curso)REFERENCES curso(curs_id) on delete restrict on update restrict;

describe matricula;

select  alun_nome, curs_nome, curs_id from aluno, curso, matricula where fk_aluno = alun_id and fk_curso= curs_id and curs_id = 8;


#Faça uma consulta que retorna o nome do aluno, nome do curso a data de matricula dos alunos que se  matricularam de "2017-01-01" até "2019-01-01". --------------------------------
select alun_nome, curs_nome, curs_id from curso, aluno, matricula where fk_aluno = alun_id and fk_curso = curs_id and mat_data between  "2017-01-01" and "2019-01-01";

# Faça uma consulta que retorna quais cursos o aluno Elvis Schwarz está matriculado, retorne o nome do aluno, o nome do curso, a data de matricula. --------------------------------
select alun_nome, curs_nome, mat_data from curso, aluno, matricula where fk_aluno=alun_id and fk_curso= curs_id and alun_nome = "Elvis Schwarz";


#Faça uma consulta que retorna quais alunos estão matriculados no curso Lógica de Programação, retorne 
#o nome deles, o nome do curso, a matricula, a carga horaria do curso e ordene o resultado em forma 
#ascendente pelo nome do aluno. 

select alun_nome, curs_nome, mat_id, curs_carga from aluno, curso, matricula where fk_curso = curs_id and fk_aluno= alun_id order by alun_nome