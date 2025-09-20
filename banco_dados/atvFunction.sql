DELIMITER //

create function totalVendas(id_vendedor int)
returns decimal(10,2)
DETERMINISTIC

BEGIN 
	
	declare total_vendas DECIMAL(10,2);
    
    select sum(preco*quantidade) into total_vendas
		from notas_fiscais nf, tabela_de_vendedores tbv, itens_notas_fiscais it
    where tbv.MATRICULA = nf.MATRICULA
		and it.NUMERO=nf.NUMERO
		and tbv.MATRICULA=id_vendedor;
    return total_vendas;



END //

DELIMITER ;

drop function totalVendas;


select totalVendas (00235);
