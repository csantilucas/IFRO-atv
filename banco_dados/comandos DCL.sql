show grants for 'user_test'@'localhost';
create user 'user_test'@'localhost' identified by '12345678';
grant create, drop on base_usuario_teste.* to 'user_test'@'localhost';
grant select (nome) on biblioteca.usuarios to 'user_test'@'localhost';

select*from mysql.user;
create database base_usuario_teste;

REVOKE ALL, GRANT OPTION FROM 'user_test'@'localhost';

FLUSH PRIVILEGES;


