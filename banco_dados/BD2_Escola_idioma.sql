create database Escola_Idioma; 
use Escola_Idioma;

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
    pess_fone INT,
    pess_nascimento DATE,
    FK_endereco int,
    CONSTRAINT FK_ENDERECO_CADASTRO_PESSOA FOREIGN KEY (FK_endereco)
        REFERENCES tb_endereco(PK_endereco)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

create table tb_nivel_lingua(
PK_nivel int primary key,
lingua varchar(45),
nivel varchar(2)
);

CREATE TABLE tb_curso (
    PK_curso INT PRIMARY KEY,
    curs_nome VARCHAR(45),
    curs_descricao VARCHAR(100),
    curs_time TIME,
    curs_valor VARCHAR(45),
    FK_nivel int,
    constraint FK_NIVEL_CURSO foreign key(FK_nivel)
		REFERENCES tb_nivel_lingua(PK_nivel)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE tb_aluno (
    PK_aluno INT PRIMARY KEY,
    FK_nivel int,
    FK_cadastro int,
    CONSTRAINT FK_CADASTRO_PESSOA_ALUNO FOREIGN KEY (FK_cadastro)
        REFERENCES tb_cadastro_pessoa(PK_cadastro)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_NIVEL_ALUNO FOREIGN KEY (FK_nivel)
        REFERENCES tb_nivel_lingua(PK_nivel)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);


CREATE TABLE tb_professor (
    PK_professor INT PRIMARY KEY,
    prof_especialidade varchar(45),
    FK_cadastro INT,
    CONSTRAINT FK_CADASTRO_PESSOA_PROFESSOR FOREIGN KEY (FK_cadastro)
        REFERENCES tb_cadastro_pessoa(PK_cadastro)
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
    FK_curso INT,
    FK_horario int,
    FK_professor int,
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
        REFERENCES tb_registro (PK_registro)
);

CREATE TABLE tb_pagamento (
    PK_pagamento INT PRIMARY KEY,
    paga_status varchar(10) default "false",
    paga_fatura varchar(45),
    paga_metodo varchar(10),
    paga_nf varchar(10)
);

CREATE TABLE tb_matricula (
    PK_matricula INT PRIMARY KEY,
    FK_aluno int,
    FK_curso int,
    FK_pagamento INT,
    FK_avaliacao int,
    FK_turma int,
    constraint FK_TURMA_MATRICULA foreign key(FK_turma)
		references tb_turma(PK_turma)
		ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT FK_ALUNO_MATRICULA FOREIGN KEY (FK_aluno)
        REFERENCES tb_aluno(PK_aluno)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_CURSO_MATRICULA FOREIGN KEY (FK_curso)
        REFERENCES tb_curso(PK_curso)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT Fk_PAGAMENTO_MATRICULA FOREIGN KEY (FK_pagamento)
        REFERENCES tb_pagamento (PK_pagamento),
	 CONSTRAINT Fk_AVALIACAO_MATRICULA FOREIGN KEY (FK_avaliacao)
        REFERENCES tb_avaliacao(PK_avaliacao)
);

CREATE TABLE tb_relatorio (
    PK_relatorio INT PRIMARY KEY,
    fk_matricula int,
    fk_turma int,
    CONSTRAINT FK_MATRICULA_RELATORIO FOREIGN KEY (FK_matricula)
        REFERENCES tb_matricula(PK_matricula)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_TURMA_RELATORIO FOREIGN KEY (FK_turma)
        REFERENCES tb_turma(PK_turma)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

#INSERCAO DE DADOS NAS TABELAS
-- 1. Inserir Endereco
select * from tb_endereco; 

INSERT INTO tb_endereco (PK_endereco, ende_rua, ende_num, ende_bairro)
	VALUES (1, 'Rua das Flores', 1223, 'Centro');
INSERT INTO tb_endereco (PK_endereco, ende_rua, ende_num, ende_bairro)
	VALUES (2, 'Rua jardim', 2314, 'cidade verde');
INSERT INTO tb_endereco (PK_endereco, ende_rua, ende_num, ende_bairro)
	VALUES (3, 'Rua Jardim', 1923, 'cidede verde');
INSERT INTO tb_endereco (PK_endereco, ende_rua, ende_num, ende_bairro)
	VALUES (4, 'Rua das Flores', 9123, 'Centro');
INSERT INTO tb_endereco (PK_endereco, ende_rua, ende_num, ende_bairro)
	VALUES (5, 'Rua das Flores', 5123, 'Centro');
    
INSERT INTO tb_endereco (PK_endereco, ende_rua, ende_num, ende_bairro)
	VALUES (6, 'Rua das Flores', 1323, 'Centro');
INSERT INTO tb_endereco (PK_endereco, ende_rua, ende_num, ende_bairro)
	VALUES (7, 'Rua jardim', 2389, 'cidade verde');
INSERT INTO tb_endereco (PK_endereco, ende_rua, ende_num, ende_bairro)
	VALUES (8, 'Rua Jardim', 3423, 'cidede verde');
INSERT INTO tb_endereco (PK_endereco, ende_rua, ende_num, ende_bairro)
	VALUES (9, 'Rua das Flores', 1233, 'Centro');
INSERT INTO tb_endereco (PK_endereco, ende_rua, ende_num, ende_bairro)
	VALUES (10, 'Rua das Flores', 5553, 'Centro');


-- 2. Inserir Pessoa (para o Aluno)
select * from tb_cadastro_pessoa;
 -- Inserir Pessoa (para o Aluno)
INSERT INTO tb_cadastro_pessoa (PK_cadastro, pess_nome, pess_CPF, pess_fone, pess_nascimento, FK_endereco)
	VALUES (1, 'Ana Silva', '123.456.789-00', 987654321, '2000-05-15', 1);
INSERT INTO tb_cadastro_pessoa (PK_cadastro, pess_nome, pess_CPF, pess_fone, pess_nascimento, FK_endereco)
	VALUES (2, 'Silva Ana', '435.446.100-40', 987654321, '2000-05-15', 2);
INSERT INTO tb_cadastro_pessoa (PK_cadastro, pess_nome, pess_CPF, pess_fone, pess_nascimento, FK_endereco)
	VALUES (3, 'Ana Silva', '553.056.179-05',  987654321, '2000-05-15', 3);
INSERT INTO tb_cadastro_pessoa (PK_cadastro, pess_nome, pess_CPF, pess_fone, pess_nascimento, FK_endereco)
	VALUES (4, 'Ana Silva', '123.456.789-00', 987654321, '2000-05-15', 4);
INSERT INTO tb_cadastro_pessoa (PK_cadastro, pess_nome, pess_CPF, pess_fone, pess_nascimento, FK_endereco)
	VALUES (5, 'Ana Silva', '190.236.119-22', 987654321, '2000-05-15', 5);

-- Inserir Pessoa (para o Professor)
INSERT INTO tb_cadastro_pessoa (PK_cadastro, pess_nome, pess_CPF, pess_fone, pess_nascimento, FK_endereco)
	VALUES (6, 'Carlos Souza', '223.654.321-11', 912345678, '1980-11-20', 6); 
INSERT INTO tb_cadastro_pessoa (PK_cadastro, pess_nome, pess_CPF, pess_fone, pess_nascimento, FK_endereco)
	VALUES (7, 'Pedro Paulo', '432.654.321-11', 915455678, '1980-8-2', 7); 
INSERT INTO tb_cadastro_pessoa (PK_cadastro, pess_nome, pess_CPF, pess_fone, pess_nascimento, FK_endereco)
	VALUES (8, 'Paulo', '987.654.121-11', 915355678, '1980-1-8', 8);
INSERT INTO tb_cadastro_pessoa (PK_cadastro, pess_nome, pess_CPF, pess_fone, pess_nascimento, FK_endereco)
	VALUES (9, 'Luiz', '987.654.341-11', 913455678, '1980-3-20', 9);
INSERT INTO tb_cadastro_pessoa (PK_cadastro, pess_nome, pess_CPF, pess_fone, pess_nascimento, FK_endereco)
	VALUES (10, 'Henrique', '222.623.321-11', 953455678, '1980-4-20', 10); 


-- 3. Inserir nivel
#ingles

select * from tb_nivel_lingua;

INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (1, 'ingles', 'A1');
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (2, 'ingles', 'A2');
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (3, 'ingles', 'B1');
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (4, 'ingles', 'B2');
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (5, 'ingles', 'C1');
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (6, 'ingles', 'C2');

#espanhol
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (7, 'espanhol', 'A1');
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (8, 'espanhol', 'A2');
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (9, 'espanhol', 'B1');
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (10, 'espanhol', 'B2');
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (11, 'espanhol', 'C1');
INSERT INTO tb_nivel_lingua (PK_nivel, lingua, nivel)
VALUES (12, 'espanhol', 'C2');


-- 4. Inserir Curso
select*from tb_curso;

INSERT INTO tb_curso (PK_curso, curs_nome, curs_descricao, curs_time, curs_valor, FK_nivel)
VALUES (1, 'ingles', 'curso de lingua inglesa, vivel fluente', '19:00:00', 'R$ 800.00', '1');
INSERT INTO tb_curso (PK_curso, curs_nome, curs_descricao, curs_time, curs_valor, FK_nivel)
VALUES (2, 'ingles', 'curso de lingua inglesa, nivel fluente/intermediario', '19:00:00', 'R$ 500.00', '2');
INSERT INTO tb_curso (PK_curso, curs_nome, curs_descricao, curs_time, curs_valor, FK_nivel)
VALUES (3, 'espanhol', 'curso de lingua espanhola , nivel intermediario', '19:00:00', 'R$ 300.00', '4');
INSERT INTO tb_curso (PK_curso, curs_nome, curs_descricao, curs_time, curs_valor, FK_nivel)
VALUES (4, 'espanhol;', 'curso de lingua espanhola, nivel fluente', '19:00:00', 'R$ 300.00', '7');
INSERT INTO tb_curso (PK_curso, curs_nome, curs_descricao, curs_time, curs_valor, FK_nivel)
VALUES (5, 'espanhol;', 'curso de lingua espanhola, nivel iniciante', '19:00:00', 'R$ 150.00', '12');

-- ---------------------------------------------------------

-- 5. Inserir Aluno 
select * from tb_aluno;

INSERT INTO tb_aluno (PK_aluno, FK_nivel, FK_cadastro)
	VALUES (1, 1, 1);
INSERT INTO tb_aluno (PK_aluno, FK_nivel, FK_cadastro)
	VALUES (2, 2, 2);
INSERT INTO tb_aluno (PK_aluno, Fk_nivel, FK_cadastro)
	VALUES (3, 4, 3);
INSERT INTO tb_aluno (PK_aluno, FK_nivel, FK_cadastro)
	VALUES (4, 7, 4);
INSERT INTO tb_aluno (PK_aluno, FK_nivel, FK_cadastro)
	VALUES (5, 12, 5);

-- 6. Inserir professor
select * from tb_professor;

INSERT INTO tb_professor (PK_professor, FK_cadastro, prof_especialidade)
	VALUES (1, 6, 'lingua inglesa'); 
INSERT INTO tb_professor (PK_professor, FK_cadastro, prof_especialidade)
	VALUES (2, 7, 'lingua espanhola'); 
INSERT INTO tb_professor (PK_professor, FK_cadastro, prof_especialidade)
	VALUES (3, 8, 'lingua inglesa');
INSERT INTO tb_professor (PK_professor, FK_cadastro, prof_especialidade)
	VALUES (4, 9, 'lingua inglesa');
INSERT INTO tb_professor (PK_professor, FK_cadastro, prof_especialidade)
	VALUES (5, 7, 'lingua espanhola');


