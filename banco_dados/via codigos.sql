#CRIAR BASE DE DADOS
create database turma_2025;
drop database turma_2025;
drop table aluno;
drop table turma;
use turma_2025;
#criar uma tabela

create table turma (
	turm_id int primary key,
    turm_nome varchar(45)
);

create table aluno(
	alun_id int auto_increment, 
    alun_nome varchar(45) not null,
    alun_cidade varchar(45) not null default"vilhena",
    alun_dt_nascimento date not null,
    alun_cpf varchar(11)not null,
    fk_turm_id int,
    unique key (alun_cpf,alun_dt_nascimento),
    primary key (alun_id),
    constraint fk_aluno_turma
    foreign key (fk_turm_id)
    references turma(turm_id) 
    on delete cascade on update cascade
    );


alter table turma add turm_sala varchar(45);
alter table turma modify turm_sala int;
alter table turma change turm_sala turma_sala varchar(45);
alter table turma drop turma_sala;

create index ix_alunos_nome on aluno (alun_nome);
describe aluno;
describe turma;

#apagar a tabela



