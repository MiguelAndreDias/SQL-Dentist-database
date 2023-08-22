
-- Povoamento tabelas

INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4710-001', 'Barcelos');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4700-420', 'Braga');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4700-005', 'Barcelos');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4750-012', 'Braga');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4700-010', 'Barcelos');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4700-069', 'Braga');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4700-001', 'Guimarães');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4700-002', 'Braga');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4710-005', 'Barcelos');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4700-104', 'Braga');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4750-002', 'Braga');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4750-102', 'Esposende');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4700-004', 'Braga');
INSERT INTO clinica_dentaria.codigo_postal (cod_postal, localidade) VALUES ('4750-017', 'Póvoa Lanhoso');

-- ----------------------------------------------

INSERT INTO clinica_dentaria.especialidade (id_especialidade, nome_especialidade) VALUES (301, 'Implantologia');
INSERT INTO clinica_dentaria.especialidade (id_especialidade, nome_especialidade) VALUES (302, 'Odontopediatria');
INSERT INTO clinica_dentaria.especialidade (id_especialidade, nome_especialidade) VALUES (303, 'Endodontologia');
INSERT INTO clinica_dentaria.especialidade (id_especialidade, nome_especialidade) VALUES (304, 'Periodontologia');

alter table clinica_dentaria.dentista auto_increment = 100000;
INSERT INTO clinica_dentaria.dentista (sexo, n_telefone, nome, data_nascimento, morada, hora_inicio_turno, hora_fim_turno, inicio_atividade_pro, codigo_postal_cod_postal, especialidade_id_especialidade) VALUES ('M', 967895642, 'Jose Maria',  '1970-01-23', 'Rua de Cima n.º 223, 5.º DTO', '14:00:00', '19:00:00', '1990-02-23', '4710-001', 301);
INSERT INTO clinica_dentaria.dentista (sexo, n_telefone, nome, data_nascimento, morada, hora_inicio_turno, hora_fim_turno, inicio_atividade_pro, codigo_postal_cod_postal, especialidade_id_especialidade) VALUES ('M', 967895567, 'Antonio Pinto', '1979-11-21', 'Rua de Baixo n.º 125, 2.º ESQ', '08:00:00', '13:00:00', '1999-01-23', '4700-420', 302);
INSERT INTO clinica_dentaria.dentista (sexo, n_telefone, nome, data_nascimento, morada, hora_inicio_turno, hora_fim_turno, inicio_atividade_pro, codigo_postal_cod_postal, especialidade_id_especialidade) VALUES ('M', 960085632, 'Manuel Maria Neves', '1964-03-24', 'Rua de Sul n.º 789, 9.º DTO', '14:00:00', '19:00:00', '1979-07-23', '4700-005', 304);
INSERT INTO clinica_dentaria.dentista (sexo, n_telefone, nome, data_nascimento, morada, hora_inicio_turno, hora_fim_turno, inicio_atividade_pro, codigo_postal_cod_postal, especialidade_id_especialidade) VALUES ('M', 937878142, 'Pedro Pinto Silva', '1978-02-13', 'Rua de Este n.º 456, 1.º DTO', '08:00:00', '13:00:00', '1980-01-23', '4750-012', 301);
INSERT INTO clinica_dentaria.dentista (sexo, n_telefone, nome, data_nascimento, morada, hora_inicio_turno, hora_fim_turno, inicio_atividade_pro, codigo_postal_cod_postal, especialidade_id_especialidade) VALUES ('F', 914863642, 'Marta Catarina', '1982-09-11', 'Rua de Cima n.º 120, 3.º ESQ', '08:00:00', '13:00:00', '2007-04-20', '4700-010', 303);
INSERT INTO clinica_dentaria.dentista (sexo, n_telefone, nome, data_nascimento, morada, hora_inicio_turno, hora_fim_turno, inicio_atividade_pro, codigo_postal_cod_postal, especialidade_id_especialidade) VALUES ('F', 936784206, 'Raquel Peixoto', '1977-09-11', 'Rua do Lado n.º 420, 6.º FRT', '14:00:00', '19:00:00', '2002-08-16', '4700-069', 302);

-- ----------------------------------------------

alter table clinica_dentaria.odontograma auto_increment = 255000;
INSERT INTO clinica_dentaria.odontograma (id_dente, data_tratamento, tipo_tratamento) VALUES (28, '2018-03-14', 'Restauração dentária');
INSERT INTO clinica_dentaria.odontograma (id_dente, data_tratamento, tipo_tratamento) VALUES (22, '2018-06-10', 'Restauração dentária');
INSERT INTO clinica_dentaria.odontograma (id_dente, data_tratamento, tipo_tratamento) VALUES (13, '2019-11-23', 'Destartarização');
INSERT INTO clinica_dentaria.odontograma (id_dente, data_tratamento, tipo_tratamento) VALUES (14, '2019-02-27', 'Desvitalização');
INSERT INTO clinica_dentaria.odontograma (id_dente, data_tratamento, tipo_tratamento) VALUES (46, '2018-12-20', 'Restauração dentária');
INSERT INTO clinica_dentaria.odontograma (id_dente, data_tratamento, tipo_tratamento) VALUES (35, '2019-12-10', 'Destartarização');
INSERT INTO clinica_dentaria.odontograma (id_dente, data_tratamento, tipo_tratamento) VALUES (22, '2019-08-17', 'Destartarização');
INSERT INTO clinica_dentaria.odontograma (id_dente, data_tratamento, tipo_tratamento) VALUES (22, '2019-05-07', 'Restauração dentária');
INSERT INTO clinica_dentaria.odontograma (id_dente, data_tratamento, tipo_tratamento) VALUES (22, '2018-09-01', 'Restauração dentária');

alter table clinica_dentaria.ficha_dentaria auto_increment = 250000;
INSERT INTO clinica_dentaria.ficha_dentaria (tartarectomia, medicacao, odontograma_id_odonto) VALUES (null, null, 255000);
INSERT INTO clinica_dentaria.ficha_dentaria (tartarectomia, medicacao, odontograma_id_odonto) VALUES (null, null, 255001);
INSERT INTO clinica_dentaria.ficha_dentaria (tartarectomia, medicacao, odontograma_id_odonto) VALUES (null, null, 255002);
INSERT INTO clinica_dentaria.ficha_dentaria (tartarectomia, medicacao, odontograma_id_odonto) VALUES (null, null, 255003);
INSERT INTO clinica_dentaria.ficha_dentaria (tartarectomia, medicacao, odontograma_id_odonto) VALUES (null, null, 255004);
INSERT INTO clinica_dentaria.ficha_dentaria (tartarectomia, medicacao, odontograma_id_odonto) VALUES (null, null, 255005);
INSERT INTO clinica_dentaria.ficha_dentaria (tartarectomia, medicacao, odontograma_id_odonto) VALUES (null, null, 255006);
INSERT INTO clinica_dentaria.ficha_dentaria (tartarectomia, medicacao, odontograma_id_odonto) VALUES (null, null, 255007);
INSERT INTO clinica_dentaria.ficha_dentaria (tartarectomia, medicacao, odontograma_id_odonto) VALUES (null, null, 255008);

alter table clinica_dentaria.clientes auto_increment = 200000;
INSERT INTO clinica_dentaria.clientes (sexo, NIF, n_telefone, NOME, data_nascimento, morada, n_utente_saude, codigo_postal_cod_postal, ficha_dentaria_id_ficha) VALUES ('M', 500001001, 919999999, 'Manuel Marques', '1970-01-23', 'Rua de Cima n.º 753, 4.º DTO', 123456789, '4700-001', 250000);
INSERT INTO clinica_dentaria.clientes (sexo, NIF, n_telefone, NOME, data_nascimento, morada, n_utente_saude, codigo_postal_cod_postal, ficha_dentaria_id_ficha) VALUES ('M', 500001002, 928888888, 'Pedro Paulo', '1991-04-22', 'Rua de Sul n.º 89, 5.º DTO', 198765432, '4700-002', 250001);
INSERT INTO clinica_dentaria.clientes (sexo, NIF, n_telefone, NOME, data_nascimento, morada, n_utente_saude, codigo_postal_cod_postal, ficha_dentaria_id_ficha) VALUES ('F', 500001003, 937777777, 'Maria Jose Silva', '2012-11-01', 'Rua de Este n.º 765, 5.º ESQ', 142356798, '4710-005', 250002);
INSERT INTO clinica_dentaria.clientes (sexo, NIF, n_telefone, NOME, data_nascimento, morada, n_utente_saude, codigo_postal_cod_postal, ficha_dentaria_id_ficha) VALUES ('M', 500001004, 962222222, 'Jose Manuel Marques', '1970-09-26', 'Rua de Oeste n.º 324, 5.º DTO', 198735642, '4700-104', 250003);
INSERT INTO clinica_dentaria.clientes (sexo, NIF, n_telefone, NOME, data_nascimento, morada, n_utente_saude, codigo_postal_cod_postal, ficha_dentaria_id_ficha) VALUES ('M', 500001005, 930000002, 'Jacinto Homem', '1982-12-23', 'Rua de Este n.º 456, 5.º ESQ', 189345276, '4750-002', 250004);
INSERT INTO clinica_dentaria.clientes (sexo, NIF, n_telefone, NOME, data_nascimento, morada, n_utente_saude, codigo_postal_cod_postal, ficha_dentaria_id_ficha) VALUES ('F', 500001006, 918976534, 'Sara Catarina Costa', '1986-11-02', 'Rua de Sul n.º 256, 9.º DTO', 164532789, '4750-102', 250005);
INSERT INTO clinica_dentaria.clientes (sexo, NIF, n_telefone, NOME, data_nascimento, morada, n_utente_saude, codigo_postal_cod_postal, ficha_dentaria_id_ficha) VALUES ('M', 500001007, 934675821, 'Jose Carlos Moreira', '1970-09-07', 'Rua de Oeste n.º 96, 4.º DTO', 123409875, '4700-004', 250006);
INSERT INTO clinica_dentaria.clientes (sexo, NIF, n_telefone, NOME, data_nascimento, morada, n_utente_saude, codigo_postal_cod_postal, ficha_dentaria_id_ficha) VALUES ('F', 500001008, 996969696, 'Joana Silva', '2010-04-03', 'Rua de Este n.º 285, 2.º ESQ', 145723983, '4750-017', 250007);
INSERT INTO clinica_dentaria.clientes (sexo, NIF, n_telefone, NOME, data_nascimento, morada, n_utente_saude, codigo_postal_cod_postal, ficha_dentaria_id_ficha) VALUES ('F', 500001009, 912345678, 'Rosa Maria Carvalho', '2001-11-13', 'Rua de Sul n.º 48, 7.º DTO', 123476559, '4750-002', 250008);

-- ----------------------------------------------
alter table clinica_dentaria.tecnicos auto_increment = 300000;
INSERT INTO clinica_dentaria.tecnicos (sexo, n_telefone, nome, data_nascimento, morada, hora_inicio_turno, hora_fim_turno, inicio_atividade_pro, codigo_postal_cod_postal) VALUES ('M', 960000012, 'Rui José',  '1989-02-03', 'Rua de Canto n.º 223, 1.º DTO', '08:00:00', '19:00:00', '2010-02-23', '4710-001');
INSERT INTO clinica_dentaria.tecnicos (sexo, n_telefone, nome, data_nascimento, morada, hora_inicio_turno, hora_fim_turno, inicio_atividade_pro, codigo_postal_cod_postal) VALUES ('F', 960450045, 'Maria Quinhas',  '1969-02-03', 'Rua do Fundo n.º 205, 7.º ESQ', '08:00:00', '19:00:00', '1999-06-13', '4700-420');
INSERT INTO clinica_dentaria.tecnicos (sexo, n_telefone, nome, data_nascimento, morada, hora_inicio_turno, hora_fim_turno, inicio_atividade_pro, codigo_postal_cod_postal) VALUES ('F', 960033013, 'Cláudia Fonseca',  '1984-02-03', 'Rua do Carvalho n.º 123, 5.º FRT', '08:00:00', '19:00:00', '2005-12-01', '4700-069');
INSERT INTO clinica_dentaria.tecnicos (sexo, n_telefone, nome, data_nascimento, morada, hora_inicio_turno, hora_fim_turno, inicio_atividade_pro, codigo_postal_cod_postal) VALUES ('M', 960069032, 'Quim Jorge',  '1978-02-03', 'Rua ao Lado n.º 420, 3.º DTO', '08:00:00', '19:00:00', '2000-04-09', '4700-004');

-- ----------------------------------------------

alter table clinica_dentaria.consulta auto_increment = 400000;
INSERT INTO clinica_dentaria.consulta (preco, clientes_id_cliente, dentista_id_dentista, data_hora) VALUES (45, 200007, 100005, '2017-01-23 14:30:00');
INSERT INTO clinica_dentaria.consulta (preco, clientes_id_cliente, dentista_id_dentista, data_hora) VALUES (45, 200000, 100003, '2018-04-03 09:30:00');
INSERT INTO clinica_dentaria.consulta (preco, clientes_id_cliente, dentista_id_dentista, data_hora) VALUES (45, 200001, 100004, '2018-09-18 11:30:00');
INSERT INTO clinica_dentaria.consulta (preco, clientes_id_cliente, dentista_id_dentista, data_hora) VALUES (45, 200003, 100004, '2017-11-08 10:30:00');
INSERT INTO clinica_dentaria.consulta (preco, clientes_id_cliente, dentista_id_dentista, data_hora) VALUES (45, 200004, 100000, '2019-07-20 17:30:00');
INSERT INTO clinica_dentaria.consulta (preco, clientes_id_cliente, dentista_id_dentista, data_hora) VALUES (45, 200005, 100002, '2018-06-04 18:30:00');
INSERT INTO clinica_dentaria.consulta (preco, clientes_id_cliente, dentista_id_dentista, data_hora) VALUES (45, 200002, 100001, '2017-12-14 10:00:00');
INSERT INTO clinica_dentaria.consulta (preco, clientes_id_cliente, dentista_id_dentista, data_hora) VALUES (45, 200008, 100002, '2018-02-20 15:30:00');
INSERT INTO clinica_dentaria.consulta (preco, clientes_id_cliente, dentista_id_dentista, data_hora) VALUES (45, 200006, 100000, '2019-06-13 17:00:00');

-- ----------------------------------------------

alter table clinica_dentaria.exames auto_increment = 500000;
INSERT INTO clinica_dentaria.exames (preco, nome_exame, tecnicos_id_tecnico, clientes_id_cliente, data_hora) VALUES(15, 'Ortopantomografia', 300000, 200001, '2019-08-17 17:00:00');
INSERT INTO clinica_dentaria.exames (preco, nome_exame, tecnicos_id_tecnico, clientes_id_cliente, data_hora) VALUES(15, 'Teleradiografia', 300001, 200001, '2019-08-17 17:30:00');
INSERT INTO clinica_dentaria.exames (preco, nome_exame, tecnicos_id_tecnico, clientes_id_cliente, data_hora) VALUES(15, 'Sialografia', 300002, 200000, '2019-02-27 11:30:00');
INSERT INTO clinica_dentaria.exames (preco, nome_exame, tecnicos_id_tecnico, clientes_id_cliente, data_hora) VALUES(15, 'Teleradiografia', 300003, 200008, '2019-04-05 10:00:00');
INSERT INTO clinica_dentaria.exames (preco, nome_exame, tecnicos_id_tecnico, clientes_id_cliente, data_hora) VALUES(15, 'Ortopantomografia', 300004, 200008, '2019-04-05 10:30:00');

