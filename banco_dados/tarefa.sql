use CADASTRO;
create table lotacao(
	lota_id int primary key auto_increment,
    sala varchar(45),
    fk_cursos int,
    foreign key (fk_cursos)
    references cursos(curs_id)
    ON update restrict ON delete RESTRICT,
    fk_professor int, 
    foreign key(fk_professor)
    references professor(prof_id)

);

rename table cursos to curso;
rename table alunos to aluno;

alter table alunos change profissao alun_profissao varchar(45); 
alter table cursos change totaulas total_aulas varchar(45);

show tables;
describe cursos;  