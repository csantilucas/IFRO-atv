select @@autocommit;
set @@autocommit = 0;
create database teste;

CREATE TABLE cliente (
clie_matricula INT NOT NULL ,
clie_nome VARCHAR(100) NOT NULL,
clie_email VARCHAR(200),
PRIMARY KEY PK_CLIENTE (clie_matricula));

START TRANSACTION;
-- INSERE REGISTROS
INSERT INTO cliente (clie_matricula,clie_nome,clie_email) VALUES (100, 'JOAO DA SILVA', 'joao@gmail.com');
savepoint sp1;
INSERT INTO cliente (clie_matricula,clie_nome,clie_email) VALUES (200, 'MARIA GOMES', 'maria@hotmail.com');
savepoint sp2;
INSERT INTO cliente (clie_matricula,clie_nome,clie_email) VALUES (300, 'ALINE SILVA', 'aline@uol.com');
savepoint sp3;
SELECT * FROM cliente;
-- RETORNA O TABELA PARA ESTADO ANTERIOR DO START TRANSACTION
commit;
rollback to savepoint sp1;
rollback;

SELECT * FROM cliente;


DELIMITER $$
DROP PROCEDURE IF EXISTS pc_insere_lote $$
CREATE PROCEDURE pc_insere_lote ()
MAIN: BEGIN 
	-- CRIANDO UMA VARIAVEL PARA RECEBER O ERRO SE HOUVER
    DECLARE erro_sql TINYINT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro_sql = TRUE;
   -- INICIANDO UMA TRANSAÇÃO
   START TRANSACTION;
   -- REALIZANDO O INSERT
	INSERT INTO cliente (clie_matricula, clie_nome, clie_email) 
    values (17,'Marta Moreira','ma.mo@gmail.com');
    INSERT INTO cliente (clie_matricula, clie_nome, clie_email) 
    values (18,'Jose Silva','jo.sil@gmail.com');
    INSERT INTO cliente (clie_matricula, clie_nome, clie_email) 
    values (19,'Carla Nunes','ca.nu@gmail.com');
    IF erro_sql = FALSE THEN
		COMMIT;
		SELECT 'Transação efetivada com sucesso	' AS Resultado;
    ELSE
		ROLLBACK;
        SELECT 'Erro na Transação' AS Resultado;
        LEAVE MAIN;
	END IF;
END $$
DELIMITER ;

call pc_insere_lote ();



DELIMITER $$
DROP PROCEDURE IF EXISTS pc_insere_cliente $$
CREATE PROCEDURE pc_insere_cliente (IN pn_matricula INT, 
									IN ps_nome VARCHAR(100), 
									IN ps_email VARCHAR(200))
MAIN: BEGIN 
	-- CRIANDO UMA VARIAVEL PARA RECEBER O ERRO SE HOUVER
    DECLARE erro_sql TINYINT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro_sql = TRUE;
   -- INICIANDO UMA TRANSAÇÃO
   START TRANSACTION;
   -- REALIZANDO O INSERT
	INSERT INTO cliente (clie_matricula, clie_nome, clie_email) 
    values (pn_matricula, ps_nome, ps_email);
    IF erro_sql = FALSE THEN
		COMMIT;
		SELECT 'Transação efetivada com sucesso	' AS Resultado;
    ELSE
		ROLLBACK;
        SELECT 'Erro na Transação' AS Resultado;
        LEAVE MAIN;
	END IF;
END $$
DELIMITER ;

call pc_insere_cliente ("14", "Carlinhsssssssssssssssssssssssssssssssssssss", "carlinhos.br@gmail.com");

create table categoria(
cate_id int primary key auto_increment,
cate_descricao varchar(100),
 cate_perc_desconto int
);

DELIMITER $$
DROP PROCEDURE IF EXISTS pc_trata_excecao$$
CREATE PROCEDURE pc_trata_excecao(IN ps_categoria VARCHAR(100), pn_perc_desconto INT)
MAIN:BEGIN
/*
Data: 
Autor: 
Objetivo: Demonstrar tratamento de exceções nos procedimentos armazenados
          manipulando código e descrição de erro
*/
-- VARIÁVEL DE CONTROLE
DECLARE vs_cod_erro CHAR(5) DEFAULT '00000';
DECLARE vs_msg TEXT;
DECLARE vs_result TEXT;
DECLARE vn_excecao INT DEFAULT 0;
-- ESPECIFICA UM MANIPULADOR QUE LIDA COM UMA OU MAIS CONDIÇÕES DA EXECUÇÃO DA TRANSAÇÃO
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    	BEGIN
	      GET DIAGNOSTICS CONDITION 1
	      vs_cod_erro = RETURNED_SQLSTATE, vs_msg = MESSAGE_TEXT;
      END;
-- INICIA A TRANSAÇÃO
START TRANSACTION;
-- INSERT NA TABELA
INSERT INTO categoria (cate_descricao, cate_perc_desconto) VALUES (ps_categoria, pn_perc_desconto);
-- CHECANDO EXCEÇÃO
IF vs_cod_erro = '00000' THEN
    	  SET vs_result = CONCAT('CATEGORIA CADASTRADA COM SUCESSO!');
		  COMMIT;
	ELSE
		SET vs_result = CONCAT('ERRO NA INSERÇÃO DE DADOS, ERRO = ',vs_cod_erro,', MENSAGEM = ',vs_msg);
		ROLLBACK;
  END IF;
  -- retorno do que aconteceu
  SELECT vs_result;
END $$

DELIMITER ;

-- INVOCA PROCEDURE
CALL pc_trata_excecao ('TESTEXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',10);
