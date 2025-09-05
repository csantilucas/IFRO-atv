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
    hora_sala varchar(45)
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
    FK_registro INT,
    fedback_alun VARCHAR(100),
    aval_nota INT,
    CONSTRAINT FK_REGISTRO_AVALIACAO FOREIGN KEY (FK_registro)
        REFERENCES tb_registro (PK_registro)
        ON UPDATE RESTRICT ON DELETE RESTRICT
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
        REFERENCES tb_pagamento (PK_pagamento)
        ON UPDATE RESTRICT ON DELETE RESTRICT,
	 CONSTRAINT Fk_AVALIACAO_MATRICULA FOREIGN KEY (FK_avaliacao)
        REFERENCES tb_avaliacao(PK_avaliacao) 
        ON UPDATE RESTRICT ON DELETE RESTRICT
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
    
-- 7. Inserir Horário
SELECT * FROM tb_horario;

INSERT INTO tb_horario (PK_horario, hora_turma, hora_sala)
	VALUES (1, '08:00:00', 'SALA A');
INSERT INTO tb_horario (PK_horario, hora_turma, hora_sala)
	VALUES (2, '10:00:00', 'SALA B');
INSERT INTO tb_horario (PK_horario, hora_turma, hora_sala)
	VALUES (3, '14:00:00', 'SALA C');
INSERT INTO tb_horario (PK_horario, hora_turma, hora_sala)
	VALUES (4, '16:00:00', 'SALA A');
INSERT INTO tb_horario (PK_horario, hora_turma, hora_sala)
	VALUES (5, '19:00:00', 'SALA B');
    
-- 8. Inserir Turma
SELECT * FROM tb_turma;

-- Turmas de Inglês
INSERT INTO tb_turma (PK_turma, turm_nome, FK_curso, FK_horario, FK_professor)
	VALUES (1, 'Inglês A1 - Manhã', 1, 1, 1); -- Curso 1 (Inglês A1), Horário 1 (08h, Sala A), Professor 1 (Inglês)
INSERT INTO tb_turma (PK_turma, turm_nome, FK_curso, FK_horario, FK_professor)
	VALUES (2, 'Inglês A2 - Tarde', 2, 3, 3); -- Curso 2 (Inglês A2), Horário 3 (14h, Sala C), Professor 3 (Inglês)
INSERT INTO tb_turma (PK_turma, turm_nome, FK_curso, FK_horario, FK_professor)
	VALUES (3, 'Inglês B1 - Noite', 3, 5, 4); -- Curso 3 (Inglês B1), Horário 5 (19h, Sala B), Professor 4 (Inglês)

-- Turmas de Espanhol
INSERT INTO tb_turma (PK_turma, turm_nome, FK_curso, FK_horario, FK_professor)
	VALUES (4, 'Espanhol A1 - Manhã', 4, 2, 2); -- Curso 4 (Espanhol A1), Horário 2 (10h, Sala B), Professor 2 (Espanhol)
INSERT INTO tb_turma (PK_turma, turm_nome, FK_curso, FK_horario, FK_professor)
	VALUES (5, 'Espanhol B2 - Tarde', 5, 4, 5); -- Curso 5 (Espanhol B2), Horário 4 (16h, Sala A), Professor 5 (Espanhol)

-- 9. Inserir Registro
SELECT * FROM tb_registro;

INSERT INTO tb_registro (PK_registro, regi_data, regi_descricao, regi_nivel)
	VALUES (1, '2025-06-01', 'Início das aulas de Inglês A1', 'A1');
INSERT INTO tb_registro (PK_registro, regi_data, regi_descricao, regi_nivel)
	VALUES (2, '2025-06-15', 'Progresso em Espanhol A1', 'A1');
INSERT INTO tb_registro (PK_registro, regi_data, regi_descricao, regi_nivel)
	VALUES (3, '2025-07-01', 'Finalização Módulo Inglês A2', 'A2');
INSERT INTO tb_registro (PK_registro, regi_data, regi_descricao, regi_nivel)
	VALUES (4, '2025-07-10', 'Início das aulas de Inglês B1', 'B1');
INSERT INTO tb_registro (PK_registro, regi_data, regi_descricao, regi_nivel)
	VALUES (5, '2025-07-20', 'Progresso em Espanhol B2', 'B2');
    
-- 10. Inserir Pagamento
SELECT * FROM tb_pagamento;

INSERT INTO tb_pagamento (PK_pagamento, paga_status, paga_fatura, paga_metodo, paga_nf)
	VALUES (1, 'true', 'FAT001/2025', 'Cartão', 'NF001');
INSERT INTO tb_pagamento (PK_pagamento, paga_status, paga_fatura, paga_metodo, paga_nf)
	VALUES (2, 'true', 'FAT002/2025', 'Boleto', 'NF002');
INSERT INTO tb_pagamento (PK_pagamento, paga_status, paga_fatura, paga_metodo, paga_nf)
	VALUES (3, 'false', 'FAT003/2025', 'Pix', 'NF003');
INSERT INTO tb_pagamento (PK_pagamento, paga_status, paga_fatura, paga_metodo, paga_nf)
	VALUES (4, 'true', 'FAT004/2025', 'Cartão', 'NF004');
INSERT INTO tb_pagamento (PK_pagamento, paga_status, paga_fatura, paga_metodo, paga_nf)
	VALUES (5, 'false', 'FAT005/2025', 'Boleto', 'NF005');
    
-- 12. Inserir Avaliação
SELECT * FROM tb_avaliacao;

INSERT INTO tb_avaliacao (PK_avaliacao, FK_registro, fedback_alun, aval_nota)
	VALUES (1, 1, 'Aluno dedicado, bom progresso inicial.', 90); -- Matrícula 1, Registro 1
INSERT INTO tb_avaliacao (PK_avaliacao, FK_registro, fedback_alun, aval_nota)
	VALUES (2, 3, 'Bom desempenho no módulo.', 85); -- Matrícula 2, Registro 3
INSERT INTO tb_avaliacao (PK_avaliacao, FK_registro, fedback_alun, aval_nota)
	VALUES (3, 4, 'Precisa praticar mais a conversação.', 70); -- Matrícula 3, Registro 4
INSERT INTO tb_avaliacao (PK_avaliacao, FK_registro, fedback_alun, aval_nota)
	VALUES (4, 2, 'Excelente pronúncia, muito participativo.', 95); -- Matrícula 4, Registro 2
INSERT INTO tb_avaliacao (PK_avaliacao, FK_registro, fedback_alun, aval_nota)
	VALUES (5, 5, 'Entendimento da gramática precisa de reforço.', 75); -- Matrícula 5, Registro 5

-- 11. Inserir Matrícula
SELECT * FROM tb_matricula;


INSERT INTO tb_matricula (PK_matricula, FK_aluno, FK_curso, FK_pagamento, FK_avaliacao, FK_turma)
	VALUES (1, 1, 1, 1, 1, 1); -- Aluno 1 (Ana Silva), Curso 1 (Inglês A1), Pgto 1, Turma 1
INSERT INTO tb_matricula (PK_matricula, FK_aluno, FK_curso, FK_pagamento, FK_avaliacao, FK_turma)
	VALUES (2, 2, 2, 2, 2, 2); -- Aluno 2 (Silva Ana), Curso 2 (Inglês A2), Pgto 2, Turma 2
INSERT INTO tb_matricula (PK_matricula, FK_aluno, FK_curso, FK_pagamento, FK_avaliacao, FK_turma)
	VALUES (3, 3, 3, 3, 3, 3); -- Aluno 3 (Ana Silva), Curso 3 (Espanhol B1), Pgto 3, Turma 3
INSERT INTO tb_matricula (PK_matricula, FK_aluno, FK_curso, FK_pagamento, FK_avaliacao, FK_turma)
	VALUES (4, 4, 4, 4, 4, 4); -- Aluno 4 (Ana Silva), Curso 4 (Espanhol A1), Pgto 4, Turma 4
INSERT INTO tb_matricula (PK_matricula, FK_aluno, FK_curso, FK_pagamento, FK_avaliacao, FK_turma)
	VALUES (5, 5, 5, 5, 5, 5); -- Aluno 5 (Ana Silva), Curso 5 (Espanhol B2), Pgto 5, Turma 5


-- 13. Inserir Relatório
SELECT * FROM tb_relatorio;

INSERT INTO tb_relatorio (PK_relatorio, fk_matricula, fk_turma)
	VALUES (1, 1, 1); -- Relatório para Matrícula 1 (Aluno 1, Turma 1)
INSERT INTO tb_relatorio (PK_relatorio, fk_matricula, fk_turma)
	VALUES (2, 2, 2); -- Relatório para Matrícula 2 (Aluno 2, Turma 2)
INSERT INTO tb_relatorio (PK_relatorio, fk_matricula, fk_turma)
	VALUES (3, 3, 3); -- Relatório para Matrícula 3 (Aluno 3, Turma 3)
INSERT INTO tb_relatorio (PK_relatorio, fk_matricula, fk_turma)
	VALUES (4, 4, 4); -- Relatório para Matrícula 4 (Aluno 4, Turma 4)
INSERT INTO tb_relatorio (PK_relatorio, fk_matricula, fk_turma)
	VALUES (5, 5, 5); -- Relatório para Matrícula 5 (Aluno 5, Turma 5)
    
# pesquisa pela matricula do nome, curso, nnivel do aluno, nota do aluno, e fedback do aluno
select 
PK_relatorio, pess_nome as 'aluno', curs_nome, nivel, aval_nota, fedback_alun 
from
tb_relatorio,
tb_nivel_lingua,
tb_curso,
tb_aluno,
tb_matricula,
tb_avaliacao,
tb_cadastro_pessoa
where
fk_matricula = pk_matricula and
tb_aluno.fk_nivel = PK_nivel and
FK_avaliacao = pk_avaliacao and
fk_aluno = PK_aluno and
fk_curso = PK_curso and
fk_cadastro = PK_cadastro;