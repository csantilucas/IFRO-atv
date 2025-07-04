create database Escola_I; 
use Escola_I;

CREATE TABLE tb_endereco (
    PK_endereco INT PRIMARY KEY,
    ende_rua VARCHAR(45),
    ende_num INT,
    ende_bairro VARCHAR(20)
);

CREATE TABLE tb_cadastro_pessoa (
    PK_cadastro INT PRIMARY KEY,
    pess_nome VARCHAR(45),
    pess_CPF VARCHAR(15),
    pess_endereco VARCHAR(45),
    pess_fone INT,
    pess_nascimento DATE,
    FK_endereco int,
    CONSTRAINT FK_ENDERECO_CADASTRO_PESSOA FOREIGN KEY (FK_endereco)
        REFERENCES tb_endereco(PK_endereco)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE tb_aluno (
    PK_aluno INT PRIMARY KEY,
    alnu_nivel VARCHAR(2),
    FK_cadastro int,
    CONSTRAINT FK_CADASTRO_PESSOA_ALUNO FOREIGN KEY (FK_cadastro)
        REFERENCES tb_cadastro_pessoa(PK_cadastro)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE tb_professor (
    PK_professor INT PRIMARY KEY,
    FK_cadastro INT,
    CONSTRAINT FK_CADASTRO_PESSOA_PROFESSOR FOREIGN KEY (FK_cadastro)
        REFERENCES tb_cadastro_pessoa(PK_cadastro)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE tb_curso (
    PK_curso INT PRIMARY KEY,
    curs_nome VARCHAR(45),
    curs_descricao VARCHAR(100),
    curs_time TIME,
    curs_valor VARCHAR(45),
    curs_nivel VARCHAR(2)
);

CREATE TABLE tb_matricula (
    PK_matricula INT PRIMARY KEY,
    FK_aluno int,
    FK_curso int,
    CONSTRAINT FK_ALUNO_MATRICULA FOREIGN KEY (FK_aluno)
        REFERENCES tb_aluno(PK_aluno)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_CURSO_MATRICULA FOREIGN KEY (FK_curso)
        REFERENCES tb_curso(PK_curso)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

create table tb_horario(
	PK_horario int primary key,
    hora_turma time,
    hora_sala time
);

CREATE TABLE tb_turma (
    PK_turma INT PRIMARY KEY,
    turm_nome varchar(45),
    FK_matricula INT,
    FK_curso INT,
    FK_horario int,
    FK_professor int,
    CONSTRAINT FK_MATRICULA_TURMA FOREIGN KEY (FK_matricula)
        REFERENCES tb_aluno (PK_aluno)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT FK_CURSO_TURMA FOREIGN KEY (FK_curso)
        REFERENCES tb_curso (PK_curso)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_HORARIO_TURMA FOREIGN KEY (FK_horario)
        REFERENCES tb_horario(PK_horario)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
	constraint FK_PROFESSOR_TURMA foreign key (FK_professor)
		references tb_professor(PK_professor)
        on update restrict on delete restrict
);

create table tb_registro (
PK_registro int primary key,
regi_data date,
regi_descricao varchar(45),
regi_nivel varchar(45)
);

CREATE TABLE tb_avaliacao (
    PK_avaliacao INT PRIMARY KEY,
    FK_matricula INT,
    FK_registro INT,
    fedback_alun VARCHAR(100),
    aval_nota INT,
    CONSTRAINT FK_REGISTRO_AVALIACAO FOREIGN KEY (FK_registro)
        REFERENCES tb_registro (PK_registro),
    CONSTRAINT Fk_MATRICULA_AVALIACAO FOREIGN KEY (FK_matricula)
        REFERENCES tb_matricula (PK_matricula)
);

CREATE TABLE tb_pagamento (
    PK_pagamento INT PRIMARY KEY,
    FK_matricula INT,
    paga_metodo varchar(10),
    paga_nf varchar(10),
    CONSTRAINT Fk_MATRICULA_PAGAMENTO FOREIGN KEY (FK_matricula)
        REFERENCES tb_matricula (PK_matricula)
);

