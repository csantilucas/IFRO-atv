#1

DELIMITER $$
create procedure 
	bp_buscarLivros(in p_nomeLivro varchar(50))
BEGIN 
	select
		l.titulo as titulo, e.nome_editora as editora, a.nome as autor
	from livros as l
		inner join editoras AS e  on l.codigo_editora= e.codigo_editora 
		inner join livros_autores as la on l.numero= la.numero_livro
		inner join autores as a on la.codigo_autor=a.codigo
	where l.titulo= p_nomeLivro;

END$$
DELIMITER ;


call bp_buscarLivros('O Pelicano');

#drop procedure bp_buscarLivros;



#2
delimiter //
create procedure 
	pc_cadastrarFuncionario(in ps_CPF varchar(11),
					in ps_nome varchar(45),
                    in ps_endereco varchar(100),
                    in ps_telefone varchar(45),
                    out ps_msg varchar(100)
	)
	BEGIN 
		DECLARE cpf_existente int;
		
		if (ps_cpf = '') THEN
			SET ps_msg = 'Erro: O campo CPF é obrigatório.';
		elseif ( ps_nome = '') THEN
			SET ps_msg = 'Erro: O campo Nome é obrigatório.';
		else
			select count(*) into cpf_existente from usuarios as u where u.CPF_usuario=ps_cpf;
		
			if (cpf_existente > 0) then
				set ps_msg = 'usuario cadastrado';
            else
				insert into usuarios (CPF_usuario, nome, endereco, telefone) values
									(ps_CPF, ps_nome, ps_endereco, ps_telefone);
				set ps_msg = 'inserido com sucesso';           
			end if;
        end if;

END//
DELIMITER ;




call pc_cadastrarFuncionario ('00100300405','Paulo','rua paraiso, 3425, jardim dos principes','(69)90000-0000', @msg_retorno);
select @msg_retorno;

#drop procedure pc_cadastrarFuncionario;



#3


DELIMITER //
create procedure pc_deleteLivro(in ps_numberLivro int,
								out ps_msg varchar(45))
begin
	declare numberLivro int;
    set ps_msg = 'ERRO!';

	select count(*) into numberLivro from livros as l where l.numero=ps_numberLivro;
        
	if (numberLivro = 0 ) then 
		set ps_msg='nenhum livros encontrado';
	else
		delete from livros as l where l.numero=ps_numberLivro ;
		set ps_msg = 'livro excluido';
	end if;
   

end //
DELIMITER ;


call pc_deleteLivro( 10277843,@mensagem);
select @mensagem;


drop procedure pc_deleteLivro;