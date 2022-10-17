CREATE DATABASE avaliacao;
USE avaliacao;

CREATE TABLE cor (
    cd_cor  INT AUTO_INCREMENT PRIMARY KEY,
    nm_cor  VARCHAR(20) NOT NULL
);

CREATE TABLE combustivel (
    cd_combustivel  INT AUTO_INCREMENT PRIMARY KEY,
    nm_combustivel  VARCHAR(30) NOT NULL
);

CREATE TABLE marca (
    cd_marca    INT AUTO_INCREMENT PRIMARY KEY,
    nm_marca    VARCHAR(30) NOT NULL
);

CREATE TABLE modelo (
    cd_modelo   INT AUTO_INCREMENT PRIMARY KEY,
    cd_marca    INT,
    nm_modelo   VARCHAR(50) NOT NULL,
    FOREIGN KEY (cd_marca) REFERENCES marca (cd_marca)
);

CREATE TABLE endereco (
    cd_endereco INT auto_increment KEY,
    nm_endereco VARCHAR(50) NOT NULL
);

CREATE TABLE proprietario (
    cd_proprietario INT AUTO_INCREMENT PRIMARY KEY,
    cd_endereco   INT,
    nm_proprietario VARCHAR(50) NOT NULL,
    nr_telefone     VARCHAR(15),
    FOREIGN KEY (cd_endereco) REFERENCES endereco (cd_endereco)
);

CREATE TABLE acessorio (
    cd_acessorio    INT AUTO_INCREMENT PRIMARY KEY,
    ds_acessorio    VARCHAR(50)
);

CREATE TABLE veiculo (
    nr_placa        VARCHAR(7) PRIMARY KEY,
    cd_cor          INT,
    cd_proprietario INT,
    cd_modelo       INT,
    cd_combustivel  INT,
    cd_acessorio    INT,
    ano_fabricacao  VARCHAR(4),
    FOREIGN KEY (cd_cor) REFERENCES cor(cd_cor),
    FOREIGN KEY (cd_proprietario) REFERENCES proprietario(cd_proprietario),
    FOREIGN KEY (cd_modelo) REFERENCES modelo(cd_modelo),
    FOREIGN KEY (cd_combustivel) REFERENCES combustivel(cd_combustivel),
    FOREIGN KEY (cd_acessorio) REFERENCES acessorio(cd_acessorio)
);

INSERT INTO cor (nm_cor) VALUES
("Preto"),
("Branco"),
("Verde"),
("Vermelho"),
("Prata"),
("Azul"),
("Marrom"),
("Pérola"),
("Amarelo"),
("Rosa");

INSERT INTO combustivel (nm_combustivel) VALUES
("Gasolina Comum"),
("Gasolina Aditivada"),
("Etanol"),
("Álcool"),
("Eletricidade"),
("Água"),
("Uranio"),
("Energia Eólica"),
("Spin Power"),
("Propulsão Humana");

INSERT INTO marca (nm_marca) VALUES
("Volkswagen"),
("Chevrolet"),
("Toyota"),
("Renault"),
("Ford"),
("Subaru"),
("Mitsubishi"),
("Mercedes"),
("Jaguar"),
("Ferrari");

INSERT INTO endereco (nm_endereco) VALUES
("Rua Cassiano Francisco Casas"),
("Rua XV de novembro"),
("Rua 7 de Setembro"),
("Rua Indaial"),
("Rua Itajaí"),
("Rua Jesus"),
("Rua São José"),
("Rua Joinville"),
("Rua Beira Rio"),
("Rua São Paulo");

INSERT INTO modelo (cd_marca, nm_modelo) VALUES
(1, "Dodge Charger GT"),
(1, "Carro do Kevin"),
(2, "Sandero"),
(4, "Celta"),
(5, "Onix"),
(3, "Alongus"),
(2, "DeLorean"),
(7, "Maverick"),
(9, "Chevete"),
(7, "Civic");

INSERT INTO  proprietario (nm_proprietario, nr_telefone, cd_endereco) VALUES
("Mauro Brás", "+55047999999991", 1),
("Kevin Levin", "+55047999999992", 2),
("Dick Grayson", "+55047999999993", 3),
("Wilson Fisk", "+55047999999994", 4),
("Otto Octavius", "+55047999999995", 5),
("Norman Osborne", "+55047999999996", 6),
("Matt Murdock", "+55047999999997", 7),
("Peter Parker", "+55047999999998", 8),
("Max Tennyson", "+55047999999999", 9),
("Ben Tennyson", "+55047999999990", 10);

INSERT INTO acessorio (ds_acessorio) VALUES
("Apoio de braço"),
("Porta copo"),
("Teto solar"),
("Farol de milha"),
("Som potente"),
("Aparelho de som Master"),
("TVzinha"),
("Descanso de pé"),
("Rack"),
("Tapete para Porta Malas");

INSERT INTO veiculo (nr_placa, ano_fabricacao, cd_cor, cd_acessorio, cd_combustivel, cd_modelo, cd_proprietario) VALUES
("KVN0L11", "2010", 3, 10, 7, 2, 2),
("AAA0B12", "2012", 2, 3, 1, 6, 1),
("AAA0B13", "2019", 1, 4, 1, 1, 10),
("AAA0B14", "2021", 4, 3, 1, 3, 3),
("AAA0B15", "2021", 5, 3, 1, 4, 4),
("AAA0B16", "2003", 1, 1, 1, 5, 5),
("AAA0B17", "2008", 7, 2, 1, 6, 6),
("AAA0B18", "2015", 8, null, 4, 7, 7),
("AAA0B19", "2020", 9, null, 1, 8, 8),
("AAA0B20", "2022", 1, 5, 1, 9, 9);

#2 tabelas - 2
CREATE VIEW marcas_modelos AS
SELECT m.nm_marca, mo.nm_modelo FROM marca m
INNER JOIN modelo mo
ON m.cd_marca = mo.cd_marca;

CREATE VIEW proprietarios_enderecos AS
SELECT p.nm_proprietario, e.nm_endereco FROM proprietario p
INNER JOIN endereco e
ON e.cd_endereco = p.cd_endereco;

#3 tabelas - 2
CREATE VIEW carros_proprietarios AS
SELECT p.nm_proprietario, m.nm_modelo FROM veiculo v
INNER JOIN proprietario p
ON p.cd_proprietario = v.cd_proprietario
INNER JOIN modelo m
ON m.cd_modelo = v.cd_modelo;

CREATE VIEW carros_cores AS
SELECT v.nr_placa, m.nm_modelo, c.nm_cor FROM veiculo v
INNER JOIN cor c
ON c.cd_cor = v.cd_cor
INNER JOIN modelo m
ON m.cd_modelo = v.cd_modelo;

#5 tabelas
CREATE VIEW muita_info AS
SELECT p.nm_proprietario, m.nm_modelo, v.nr_placa, c.nm_cor, co.nm_combustivel FROM veiculo v
INNER JOIN proprietario p
ON p.cd_proprietario = v.cd_proprietario
INNER JOIN modelo m
ON m.cd_modelo = v.cd_modelo
INNER JOIN cor c
ON c.cd_cor = v.cd_cor
INNER JOIN combustivel co 
ON co.cd_combustivel = v.cd_combustivel;

#left join
CREATE VIEW acessorios_veiculos AS
SELECT v.nr_placa, a.ds_acessorio FROM veiculo v
LEFT JOIN acessorio a
ON v.cd_acessorio = a.cd_acessorio;

#right join
CREATE VIEW qtd_cores AS
SELECT COUNT(v.nr_placa), c.nm_cor FROM veiculo v
RIGHT JOIN cor c
ON v.cd_cor = c.cd_cor
GROUP BY nm_cor;

#TRIGGERS
DELIMITER $$
CREATE TRIGGER seta_acessorio
BEFORE INSERT ON veiculo
FOR EACH ROW
BEGIN
	IF NEW.cd_acessorio IS NULL THEN
		SET NEW.cd_acessorio = 10;
	END IF;
END $$
DELIMITER ;

#TESTE
INSERT INTO veiculo (nr_placa, ano_fabricacao, cd_cor, cd_acessorio, cd_combustivel, cd_modelo, cd_proprietario) VALUES
("ABC0D12", "2011", 1, NULL, 5, 1, 10);

SELECT * FROM veiculo;

DELETE FROM veiculo WHERE nr_placa = "ABC0D12";

DELIMITER $$
CREATE TRIGGER seta_ano
BEFORE INSERT ON veiculo
FOR EACH ROW
BEGIN
	IF NEW.ano_fabricacao < 1886 OR NEW.ano_fabricacao IS NULL THEN
		SET NEW.ano_fabricacao = 1886;
	END IF;
END $$
DELIMITER ;

INSERT INTO veiculo (nr_placa, ano_fabricacao, cd_cor, cd_acessorio, cd_combustivel, cd_modelo, cd_proprietario) VALUES
("ABC0E12", "1878", 1, NULL, 5, 1, 10),
("ABC0D12", NULL, 1, NULL, 5, 1, 10);

SELECT * FROM veiculo;

#Procedures - Cadastro
DELIMITER $$
CREATE PROCEDURE cadastrarCor (IN cor VARCHAR(20))
BEGIN
    INSERT INTO cor VALUES (null, cor);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cadastrarAcessorio (IN acessorio VARCHAR(50))
BEGIN
    INSERT INTO acessorio VALUES (null, acessorio);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cadastrarEndereco (IN endereco VARCHAR(50))
BEGIN
    INSERT INTO endereco VALUES (null, endereco);
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE cadastrarProprietario (IN nome VARCHAR(50), IN telefone VARCHAR(15), IN endereco INT)
BEGIN
    INSERT INTO proprietario VALUES (null, endereco, nome, telefone);
END $$
DELIMITER ;

CALL cadastrarCor("Ciano");
CALL cadastrarAcessorio("Air Bag");
CALL cadastrarEndereco("De baixo da ponte");
CALL cadastrarProprietario("Fernando Henrique Cardoso", "+55047912992193", 11);

#Procedures - Update
DELIMITER $$
CREATE PROCEDURE UpdateAcessorio (IN cdAcessorioVelho INT, IN acessorioNovo VARCHAR(30))
BEGIN
    UPDATE acessorio SET ds_acessorio = acessorioNovo WHERE cd_acessorio = cdAcessorioVelho;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE UpdateEndereco (IN cdEndereco INT, IN enderecoNovo VARCHAR(50))
BEGIN
    UPDATE endereco SET nm_endereco = enderecoNovo WHERE cd_endereco = cdEndereco;
END $$
DELIMITER ;

DROP PROCEDURE UpdateEndereco;

DELIMITER $$
CREATE PROCEDURE UpdateCor (IN cdCor INT, IN corNova VARCHAR(30))
BEGIN
    UPDATE cor SET nm_cor = corNova WHERE cd_cor = cdCor;
END $$
DELIMITER ;

CALL UpdateCor (11, "Roxo");
CALL UpdateAcessorio (11, "Leitor de CD");
CALL UpdateEndereco (11, "Rua São Jorge");


#Procedures - remover
DELIMITER $$
CREATE PROCEDURE deleteCor (IN cor VARCHAR(20))
BEGIN
    DELETE FROM cor WHERE nm_cor = cor;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE deleteVeiculo (IN placa VARCHAR(7))
BEGIN
    DELETE FROM veiculo WHERE nr_placa = placa;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE deleteAcessorio (IN acessorio VARCHAR(30))
BEGIN
    DELETE FROM acessorio WHERE ds_acessorio = acessorio;
END $$
DELIMITER ;

CALL deleteCor("Roxo");
CALL deleteVeiculo("ABC0D12");
CALL deleteAcessorio("Leitor de CD");

#Comados de exemplo 
#comandos de cadastro
#codigo > auto_increment, então nao é necessario

#	INSERT INTO [tabela] ([atributos]) VALUES
#	([atributos na ordem informada]);

#Update
#	UPDATE [tabela] SET [atributo] = [valor desejado] WHERE cd_[tabela] = [codigo do item que deseja alterar];

#Delete
#	DELETE FROM [tabela] WHERE cd_[tabela] = [codigo do item na linha que será deletada];

#SELECT COUNT(*), NOW() FROM TABELA
##RODAR TUDO DO ZERO NO FINAL PRA VERIFICAR ;)


#Comandos DQL 
# where, or, order by, date_format, now
SELECT m.nm_modelo, v.ano_fabricacao, DATE_FORMAT(NOW(), "%Y") AS "ano_atual" FROM veiculo v
INNER JOIN modelo m 
ON m.cd_modelo = v.cd_modelo
WHERE v.ano_fabricacao > 2010 OR ano_fabricacao < 1900
ORDER BY v.ano_fabricacao DESC;

# between, and, like
SELECT p.nm_proprietario, v.ano_fabricacao FROM veiculo v
INNER JOIN proprietario p
ON p.cd_proprietario = v.cd_proprietario
WHERE v.ano_fabricacao BETWEEN 2010 AND 2020 AND
p.nm_proprietario LIKE "%K%";

#group by, having, count
SELECT a.ds_acessorio, COUNT(v.nr_placa) FROM acessorio a
INNER JOIN veiculo v
ON a.cd_acessorio = v.cd_acessorio
GROUP BY a.ds_acessorio
HAVING (COUNT(v.nr_placa)) > 1;

#case
SELECT v.nr_placa, CASE
	WHEN v.ano_fabricacao > (SELECT AVG(ano_fabricacao) FROM veiculo) THEN "maior que a media de ano"
	ELSE "menor que a media de ano"
END AS "relaçao com a media (texto)" FROM veiculo v;

#if
SELECT IF ((SELECT AVG(ano_fabricacao) FROM veiculo) > 2010, "Média dos anos é maior que 2010", "Média dos anos é menor que 2010");

#max/min
SELECT MAX(ano_fabricacao), MIN(ano_fabricacao) FROM veiculo v;

#finalizando
DROP DATABASE avaliacao;