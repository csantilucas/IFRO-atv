#1 ---------------------------------
DELIMITER //
DROP TRIGGER if exists tg_atuliza_estoque;
create trigger tg_atuliza_estoque AFTER INSERT ON produto
for each row
begin

	update estoque_categoria as ec 
    set esca_qt_produto= esca_qt_produto + 1
    where cate_id = NEW.cate_id;
    
end; 
//
DELIMITER ;


#2 --------------------------------

DELIMITER //
CREATE TRIGGER tg_diminui_estoque AFTER DELETE
ON produto
FOR EACH ROW
BEGIN
    UPDATE estoque_categoria
    SET esca_qt_produto = esca_qt_produto - 1
    WHERE cate_id = OLD.cate_id;
END;
//
DELIMITER ;



# test ----------------------------------

-- 1. Verifique os valores atuais do estoque
SELECT c.cate_descricao, ec.esca_qt_produto
FROM estoque_categoria ec
JOIN categoria c ON ec.cate_id = c.cate_id;

-- Resultado esperado inicialmente:
-- ELETRODOMÉSTICOS | 3
-- INFORMÁTICA      | 3
-- CELULARES        | 3

-- 2. Insira um novo produto na categoria 'INFORMÁTICA' (cate_id = 2)
INSERT INTO produto (prod_nome, prod_preco, cate_id) VALUES ('MOUSE GAMER', '350.00', 2);

-- 3. Verifique o estoque novamente
SELECT c.cate_descricao, ec.esca_qt_produto
FROM estoque_categoria ec
JOIN categoria c ON ec.cate_id = c.cate_id;

-- Resultado esperado agora (Informática aumentou para 4):
-- ELETRODOMÉSTICOS | 3
-- INFORMÁTICA      | 4
-- CELULARES        | 3

-- 4. Delete um produto da categoria 'CELULARES' (cate_id = 2)

select*from produto;
DELETE FROM produto WHERE prod_cod = '15';

-- 5. Verifique o estoque pela última vez
SELECT c.cate_descricao, ec.esca_qt_produto
FROM estoque_categoria ec
JOIN categoria c ON ec.cate_id = c.cate_id;




