create database exercicio_trigger;
use exercicio_trigger;
CREATE TABLE categoria (
  cate_id int NOT NULL AUTO_INCREMENT,
  cate_descricao varchar(45) NOT NULL,
  cate_perc_desconto int DEFAULT 0,
  PRIMARY KEY pk_categoria (cate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into categoria (cate_descricao, cate_perc_desconto) 
values ( 'ELETRODOMÉSTICOS',10),('INFORMÁTICA',15),('CELULARES',20);

CREATE TABLE produto (
  prod_cod int NOT NULL AUTO_INCREMENT,
  prod_nome varchar(50) NOT NULL,
  prod_preco decimal(10,2) NOT NULL,
  cate_id int NOT NULL,
  PRIMARY KEY pk_produto (prod_cod),
  FOREIGN KEY fk_categoria_produto (cate_id) REFERENCES categoria (cate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE estoque_categoria (
  esca_id int NOT NULL AUTO_INCREMENT,
  cate_id int NOT NULL,
  esca_qt_produto int DEFAULT NULL,
  PRIMARY KEY (esca_id),
  UNIQUE KEY uk_cate_id (cate_id),
  CONSTRAINT fk_estoque_categoria_categ FOREIGN KEY (cate_id) REFERENCES categoria (cate_id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

insert into estoque_categoria (cate_id,esca_qt_produto) values (1,3),(2,3),(3,3);