create database exercicio_trigger;
use exercicio_trigger;
CREATE TABLE categoria (
  cate_id int(11) NOT NULL AUTO_INCREMENT,
  cate_descricao varchar(45) NOT NULL,
  cate_perc_desconto int(11) DEFAULT 0,
  PRIMARY KEY pk_categoria (cate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into categoria (cate_descricao, cate_perc_desconto) 
values ( 'ELETRODOMÉSTICOS',10),('INFORMÁTICA',15),('CELULARES',20);

CREATE TABLE produto (
  prod_cod int(11) NOT NULL AUTO_INCREMENT,
  prod_nome varchar(50) NOT NULL,
  prod_preco decimal(10,2) NOT NULL,
  prod_qt_estoque int,
  cate_id int(11) NOT NULL,
  PRIMARY KEY pk_produto (prod_cod),
  FOREIGN KEY fk_categoria_produto (cate_id) REFERENCES categoria (cate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into produto (prod_nome,prod_preco,cate_id) values 
('GELADEIRA', '1800.00', '1'),
('FOGÃO', '700.00', '1'),
('MICROONDAS', '500.00', '1'),
('NOTEBOOK', '2500.00', '2'),
('IMPRESSORA', '1200.00', '2'),
('NOBREAK', '700.00', '2'),
('SAMSUMG', '1000.00', '3'),
('MOTROLA', '1500.00', '3'),
('IPHONE', '5000.00', '3');

CREATE TABLE `estoque_categoria` (
  `esca_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL,
  `esca_qt_produto` int(11) DEFAULT NULL,
  PRIMARY KEY (`esca_id`),
  UNIQUE KEY `uk_cate_id` (`cate_id`),
  CONSTRAINT `fk_estoque_categoria_categ` FOREIGN KEY (`cate_id`) REFERENCES `categoria` (`cate_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

insert into estoque_categoria (cate_id,esca_qt_produto) values (1,3),(2,3),(3,3);


-- ------------------------------------------------------------------

-- Adicionar na tabela "produto" a coluna "prod_qt_estoque"
-- Atualizar a quantidade nas colunas "update produto set prod_qt_estoque = 50;"
-- Criar uma tabela que carrega as quantidades dos protudos no momento da compra 

CREATE TABLE `item_venda` (
  `itve_id` int(11) DEFAULT NULL,
  `prod_cod` int(11) DEFAULT NULL,
  `itve_qtd` int(11) DEFAULT NULL,
  `itve_vl_unitario` decimal(10,2) DEFAULT NULL,
  KEY `fk_item_venda_produto` (`prod_cod`),
  CONSTRAINT `item_venda_ibfk_1` FOREIGN KEY (`prod_cod`) REFERENCES `produto` (`prod_cod`)
);

-- ## Evento INSERT ---------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER tg_item_venda_pre_ins BEFORE INSERT
ON item_venda
FOR EACH ROW
BEGIN
/*
Data: 
Autor: 
Objetivo: Trigger criado gerenciar estoque de produtos (INCLUSÃO) 
*/

-- ATRIBUI VALOR UNITÁRIO DO PRODUTO BUSCANDO NA TABELA DE PRODUTO
SET @vlr_unit_prd = (SELECT prod_preco FROM produto WHERE prod_cod = NEW.prod_cod);
SET NEW.itve_vl_unitario  = @vlr_unit_prd;

-- ATUALIZA ESTOQUE: SUBTRAI QUANTIDADE DO PRODUTO EM ESTOQUE PELA QUANTIDADE DA VENDA 
UPDATE produto p SET p.prod_qt_estoque = (p.prod_qt_estoque - NEW.itve_qtd)
WHERE p.prod_cod = NEW.prod_cod;

END $$
DELIMITER ;

-- TESTE
INSERT INTO item_venda (itve_id, prod_cod,itve_qtd) VALUES (1, 7,10);
INSERT INTO item_venda (itve_id, prod_cod,itve_qtd) VALUES (1, 8,15);
INSERT INTO item_venda (itve_id, prod_cod,itve_qtd) VALUES (1, 9,5);

-- ## Evento DELETE ---------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER tg_item_venda_pos_del AFTER DELETE
ON item_venda
FOR EACH ROW
BEGIN
/*
Data: 
Autor:
Objetivo: Trigger criado gerenciar estoque de produtos (EXCLUSÃO) 
*/
-- ATUALIZA ESTOQUE: ADICIONA QUANTIDADE DE PRODUTO CANCELADO NA VENDA NA QUANTIDADE DO PRODUTO EM ESTOQUE
UPDATE produto p SET p.prod_qt_estoque = (p.prod_qt_estoque + OLD.itve_qtd)
WHERE p.prod_cod = OLD.prod_cod;

END $$
DELIMITER ;

-- TESTE
DELETE FROM item_venda WHERE itve_id = 1 AND prod_cod = 7;

