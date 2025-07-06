select titulo, nome from 
alunos, matricula, cursos
where 
alunos_id.curs_id=alunos_id.curso_id
and 
alun_id.curs_id=alunos.cursos;

