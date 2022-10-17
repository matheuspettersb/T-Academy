-- Active: 1665409771698@@127.0.0.1@3306
CREATE DATABASE extra03;
USE extra03;

CREATE TABLE clientes (
    cd_cliente      INT AUTO_INCREMENT PRIMARY KEY,
    nm_cliente      VARCHAR(30),
    email_cliente   VARCHAR(50)
);

DELIMITER $$
CREATE PROCEDURE cadastrar (IN nome VARCHAR(30), IN email VARCHAR(50))
BEGIN
    INSERT INTO clientes VALUES (null, nome, email);
END $$
DELIMITER ;

CALL cadastrar ("amogus", "amogusus@impostor.com");

SELECT * FROM clientes;

DROP PROCEDURE cadastrar;

DELIMITER $$

CREATE PROCEDURE cadastrar (IN nome VARCHAR(30), IN email VARCHAR(50), OUT mensagem VARCHAR(30))
BEGIN
	DECLARE qtd_email INT DEFAULT 0;
	DECLARE qtd_at INT = 0;
	DECLARE i INT = 1;

SELECT COUNT(*) INTO qtd_emaiL FROM clientes WHERE email_cliente = email;
WHILE i < LEN(email)
    BEGIN 
        IF (SELECT SUBSTRING(email, 1, i) = "@") THEN
            qtd_at = (qtd_at+1)
        END IF;
    END;
IF qtd_email <> 0  THEN
    SET mensagem = "Falha ao cadastrar";
ELSEIF qtd_at <> 1 THEN
    SET mensagem = "Falha ao cadastrar";
ELSEIF LEN(nome)<3 OR LEN(nome)>30 THEN
    SET mensagem = "Falha ao cadastrar";
ELSEIF email IS NULL OR LEN(email) < 10 THEN
    SET mensagem = "Falha ao cadastrar";
ELSE
    INSERT INTO clientes VALUES (null, nome, email);
    SET mensagem = "Cadastrado com sucesso";
END $$
DELIMITER ;
