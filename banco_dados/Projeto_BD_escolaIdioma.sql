

create database Escola_Idioma; 
use Escola_Idioma;

describe aluno;

CREATE TABLE endereco (
    PK_ende INT PRIMARY KEY,
    ende_rua VARCHAR(45),
    ende_num INT,
    ende_bairro VARCHAR(20)
);

CREATE TABLE cadastro_pessoa (
    PK_cadastro INT PRIMARY KEY AUTO_INCREMENT,
    pess_nome VARCHAR(45),
    pess_CPF VARCHAR(15),
    pess_ende VARCHAR(45),
    pess_fone INT,
    pess_nasc DATE
);

alter table cadastro_pessoa change pess_ende FK_ende int;
alter table cadastro_pessoa add constraint FK_endereco  foreign key (FK_ende) references endereco(PK_ende) on delete restrict on update restrict;

CREATE TABLE aluno (
    PK_aluno INT PRIMARY KEY AUTO_INCREMENT,
    FK_cadastroP INT,
    FOREIGN KEY (FK_cadastroP)
        REFERENCES cadastro_pessoa (PK_cadastro)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

alter table aluno add constraint FK_cadastro_pessoa foreign key(FK_cadastroP) references cadastro_pes(PK_cadastro) on update restrict on delete restrict;

alter table aluno add FK_matricula int;
alter table aluno add constraint FK_mat foreign key (FK_matricula) references matricula(PK_mat) on update restrict on delete restrict;


CREATE TABLE professor (
    PK_prof INT PRIMARY KEY AUTO_INCREMENT,
    FK_cadastroP INT,
    FOREIGN KEY (FK_cadastroP)
        REFERENCES cadastro_pessoa (PK_cadastro)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

alter table aluno add nivel_idioma varchar(2);
alter table aluno change nivel_idioma alun_nivel varchar(2);
alter table aluno change PK_aluno PK_alun int;
alter table professor add prof_espec varchar(45);


CREATE TABLE matricula (
    PK_mat INT PRIMARY KEY
);
alter table matricula add FK_curso int;
alter table matricula add constraint FK_curso foreign key(FK_curso) references curso(PK_curs) on update restrict on delete restrict;

CREATE TABLE curso (
    PK_curs INT PRIMARY KEY,
    curs_nome VARCHAR(45),
    curs_desc VARCHAR(100),
    curs_time TIME,
    curs_val VARCHAR(45),
    curs_nivel VARCHAR(2)
);

CREATE TABLE turma (
    PK_turm INT PRIMARY KEY,
    FK_alun INT,
    FK_curs INT,
    FOREIGN KEY (FK_alun)
        REFERENCES aluno (PK_alun)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    FOREIGN KEY (FK_curs)
        REFERENCES curso (PK_curs)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE avaliacao (
    PK_aval INT PRIMARY KEY,
    FK_mat INT,
    FK_regi_aval INT,
    fedback_alun VARCHAR(100),
    aval_nota INT,
    CONSTRAINT FK_RegistroAvaliacao FOREIGN KEY (FK_regi_aval)
        REFERENCES registro(PK_registro),
    CONSTRAINT Fk_matricula FOREIGN KEY (FK_mat)
        REFERENCES matricula (PK_mat)
);

create table registro (
PK_registro int primary key,
regi_data date,
regi_descricao varchar(45),
regi_nivel varchar(45)
);




