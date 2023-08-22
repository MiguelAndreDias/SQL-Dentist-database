
-- -----------------------------------------------------
-- Criação da tabela de Triggers
-- -----------------------------------------------------
create table trigger_dentaria(
	mensagem VARCHAR(100)
    );
	
    
-- -----------------------------------------------------
-- Trigger para medicação
-- -----------------------------------------------------
DELIMITER $$
CREATE
	TRIGGER nao_Medicacao before INSERT
    ON ficha_dentaria
    FOR EACH ROW BEGIN
		if NEW.medicacao is NULL THEN
			set new.medicacao = 'Não toma medicação';
		end if;
	END$$
DELIMITER;


-- -----------------------------------------------------
-- Trigger para tartarectomia
-- -----------------------------------------------------
DELIMITER $$
CREATE
	TRIGGER nao_tartaretomia before INSERT
    ON ficha_dentaria
    FOR EACH ROW BEGIN
		if NEW.tartarectomia is NULL THEN
			set new.tartarectomia = 'N';
		end if;
	END$$
DELIMITER;


-- -----------------------------------------------------
-- Trigger Sexo Clientes
-- -----------------------------------------------------
DELIMITER $$
CREATE
	TRIGGER sexo_clientes BEFORE INSERT
    ON clientes
    FOR EACH ROW BEGIN
		IF NEW.sexo = 'M' THEN
			INSERT INTO trigger_dentaria VALUES('cliente adicionado do sexo masculino');
		ELSEif NEW.sexo = 'F' THEN
			INSERT INTO trigger_dentaria VALUES('cliente adicionado do sexo feminino');
		END IF;
	END$$
DELIMITER ;


-- -----------------------------------------------------
-- Trigger Sexo Tecnico
-- -----------------------------------------------------
DELIMITER $$
CREATE
	TRIGGER my_trigger3 BEFORE INSERT
    ON tecnicos
    FOR EACH ROW BEGIN
		IF NEW.sex = 'M' THEN
			INSERT INTO trigger_test VALUES('técnico adicionado do sexo masculino');
		ELSEIF NEW.sex = 'F' THEN
			INSERT INTO trigger_test VALUES('técnico adicionado do sexo feminino');
		ELSE
			INSERT INTO trigger_test VALUES('técnico adicionado');
		END IF;
	END$$
DELIMITER ;


-- -----------------------------------------------------
-- Trigger Sexo Dentista
-- -----------------------------------------------------
DELIMITER $$
CREATE
	TRIGGER my_trigger3 BEFORE INSERT
    ON dentista
    FOR EACH ROW BEGIN
		IF NEW.sex = 'M' THEN
			INSERT INTO trigger_test VALUES('adicionado dentista do sexo masculino');
		ELSEIF NEW.sex = 'F' THEN
			INSERT INTO trigger_test VALUES('adicionado dentista do sexo feminino');
		ELSE
			INSERT INTO trigger_test VALUES('adicionado dentista');
		END IF;
	END$$


-- ------------------------------------------------------------------
-- Trigger para ver se um cliente tem idade para fazer ortopediatria
-- ------------------------------------------------------------------
delimiter $$
CREATE 
	TRIGGER orto_Idade BEFORE INSERT
    ON consulta
    FOR EACH ROW BEGIN
    CALL clientestipoconsultas;
    IF NEW.idade > 18 and nome_especialidade = 'Odontopediatria' then
		insert into notas values ('O paciente tem que ser menor de idade para realizar este tipo de consultas');
	end if;
end$$
delimiter

alter TABLE consulta add notas Varchar (100);

select * from clientes
select * from dentista


-- -----------------------------------------------------
-- Trigger consultas que sobrepoem
-- -----------------------------------------------------
DELIMITER $$
CREATE
	TRIGGER consulta_existe before INSERT
    ON consulta
    FOR EACH ROW BEGIN
		if new.data_hora < current_date() 
		then
			signal sqlstate '02000' set message_text = 'ERRO: Já existe uma consulta nesse dia a essa hora!';
			-- INSERT INTO trigger_dentaria VALUES('Erro: Já existe uma consulta nesse dia a essa hora!');
		end if;
	END$$
DELIMITER ;

-- drop trigger consulta_existe;
-- show triggers;

-- INSERT INTO clinica_dentaria.consulta (preco, clientes_id_cliente, dentista_id_dentista, data_hora) VALUES (45, 200004, 100000, '2019-07-20 17:30:00');


-- -----------------------------------------------------
-- Trigger consultas que sobrepoem
-- -----------------------------------------------------
DELIMITER $$
CREATE
	TRIGGER exame_existe before INSERT
    ON exames
    FOR EACH ROW BEGIN
		if new.data_hora < current_date() 
		then
			signal sqlstate '02000' set message_text = 'ERRO: Já existe um exame nesse dia a essa hora!';
		end if;
	END$$
DELIMITER ;

-- drop trigger exame_existe;
-- show triggers;

-- INSERT INTO clinica_dentaria.exames (preco, nome_exame, tecnicos_id_tecnico, clientes_id_cliente, data_hora) VALUES (45, 'Ortopantomografia', 300001, 200001, '2019-08-17 17:30:00');

-- -----------------------------------------------------
-- Procedure que junta consultas e exames: marcações
-- -----------------------------------------------------
delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `marcacoes`()
BEGIN
	select c.clientes_id_cliente, cl.NOME, c.data_hora as data_hora, 
    'Consulta' as Tipo, concat('Médico', ' ', c.dentista_id_dentista) as Funcionario
    from consulta c, clientes cl
    where c.clientes_id_cliente = cl.id_cliente
    union 
    select e.clientes_id_cliente, cl.NOME, e.data_hora as data_hora,
    'Exame' as Tipo, concat('Técnico', ' ', e.tecnicos_id_tecnico) as Funcionario
    from exames e,  clientes cl
    where e.clientes_id_cliente = cl.id_cliente
    order by data_hora desc;
end //
delimiter ;

call marcacoes;
drop procedure marcacoes;


-- -----------------------------------------------------
-- Função idade
-- -----------------------------------------------------
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `idade`(dta date) RETURNS INT(3)
deterministic
BEGIN
RETURN TIMESTAMPDIFF(YEAR, dta, CURDATE());
END //
DELIMITER ;


