#DDL
create database Sistema;
#drop database sistema;
CREATE TABLE categoria (
    cat_id INT PRIMARY KEY AUTO_INCREMENT,
    cat_nome VARCHAR(45)
);

CREATE TABLE produto (
    prod_id INT PRIMARY KEY AUTO_INCREMENT,
    prod_nome VARCHAR(45),
    fk_categoria INT,
    FOREIGN KEY (fk_categoria)
        REFERENCES categoria (cat_id)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

describe produto;
alter table produto add prod_valor decimal (10,2);


#DML
SELECT * FROM categoria; 
SELECT * FROM produto; 


#iserir valores na tabela
insert into categoria values (1, "limpeza"), (2, "eletronico");
insert into produto  (prod_nome, fk_categoria, prod_valor) values ("celular", 2, 10.5);

#alterar os valores da tabela
UPDATE produto 
SET 
    prod_nome = 'Poco X6',
    prod_valor = 1500
WHERE
    prod_id = 2;

delete from produto
where prod_id=1;