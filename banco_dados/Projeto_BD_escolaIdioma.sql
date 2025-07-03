create database Escola_Idioma; 
describe cadastro_pessoa;
describe professor;
describe aluno;

create table cadastro_pessoa (
PK_cadastro int primary key auto_increment,

pess_nome varchar (45),
pess_CPF varchar (15),
pess_ende varchar (45),
pess_fone int,
pess_nasc date
);

CREATE TABLE aluno (
	PK_aluno int primary key auto_increment,
    FK_cadastroP int,
    foreign key (FK_cadastroP)
    references cadastro_pessoa(PK_cadastro)
    on update restrict on delete restrict
);

alter table aluno add FK_matricula int;
alter table aluno add constraint FK_mat foreign key (FK_matricula) references matricula(PK_mat) on update restrict on delete restrict;


create table professor (
	PK_prof int primary key auto_increment,
    FK_cadastroP int,
    foreign key (FK_cadastroP)
    references cadastro_pessoa(PK_cadastro)
    on update restrict on delete restrict
);

alter table aluno add nivel_idioma varchar(2);
alter table aluno change nivel_idioma alun_nivel varchar(2);
alter table aluno change PK_aluno PK_alun int;
alter table professor add prof_espec varchar(45);


create table matricula(
PK_mat int primary key
);
alter table matricula add FK_curso int;
alter table matricula add foreign key(FK_curso) references curso(PK_curs) on update restrict on delete restrict;

create table curso(
PK_curs int primary key,
curs_nome varchar(45),
curs_desc varchar(100),
curs_time time,
curs_val varchar(45),
curs_nivel varchar (2)
);

create table turma(
 PK_turm int primary key,
 FK_alun int,
 FK_curs int,
 foreign key (FK_alun)
 references aluno(PK_alun)
 on update restrict on delete restrict,
 foreign key (FK_curs)
 references curso(PK_curs)
 on update restrict on delete restrict

);
describe turma;
