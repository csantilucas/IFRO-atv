use biblioteca;
CREATE TABLE emprestimo (
    emp_PK INT AUTO_INCREMENT PRIMARY KEY,
    emp_usuario VARCHAR(11) character set utf8, -- << CORREÇÃO APLICADA AQUI
    emp_numero INT,
    emp_dataPrevista DATE,
    CONSTRAINT FK_usuario FOREIGN KEY (emp_usuario) REFERENCES usuarios(CPF_usuario),
    CONSTRAINT fk_livro FOREIGN KEY (emp_numero) REFERENCES livros(numero)
);

select * from usuarios;

delimiter //
drop procedure if exists pc_realiza_emprestimo;
create procedure pc_realiza_emprestimo(in pn_numero int,
										in pn_CPF_usuario varchar(11),
                                        out ps_msg varchar(45))

begin

	set @valorLivro = (select count(*) from livros as l where l.numero=pn_numero);
	set @valorUsuario = (select count(*) from usuarios as u where u.CPF_usuario=pn_CPF_usuario);

	if (@valorLivro <= 0 || @valorUsuairo <=0 ){
		set ps_msg = 'livro nao encontrado';
		}        
	else{
    select date_add(curdate(), interval 7 day) as datafuture
    insert into emprestimo(emp_usuario, ump_numero, emp_dataPrevista) values (pn_cpf_usuario, pn_numero, datafuture)
}

end

//
delimiter


-- Opção A: Simples
