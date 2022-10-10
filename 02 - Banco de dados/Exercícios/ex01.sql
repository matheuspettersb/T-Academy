-- Active: 1665409771698@@127.0.0.1@3306@ex01
CREATE DATABASE ex01;
USE ex01;
CREATE TABLE clientes(
    codigo  INT AUTO_INCREMENT PRIMARY KEY,
    nome    VARCHAR(40),
    cidade  VARCHAR(20),
    idade   int
);

INSERT INTO clientes (nome, cidade, idade) VALUES
("Érica", "Curitiba", 28),
("Lucas", "Blumenau", 16),
("Larissa", "Florianópolis", 36),
("Murilo", "Joinville", 23),
("Cristiane", "Blumenau", 31),
("Robson", "Joinvile", 42),
("Mariana", null, 37),
("Jean", "Blumenau", 43),
("Luana", "Pomerode", 19),
("Cleber", "Brusque", 34),
("Hellen", "Blumenau", 28),
("Paulo", "Joinville", 44),
("Alessandra", "São Paulo", 28),
("Dênis", "Blumenau", 37),
("Bianca", "Campinas", 23),
("Gabriel", "São Paulo", 26);

#1
SELECT * FROM clientes;
#2
SELECT COUNT(*) FROM clientes;

#3
SELECT nome, idade FROM clientes WHERE idade = (SELECT MAX(idade) FROM clientes);

#4
# Arrumando o registro que joinville tem um L só
UPDATE clientes SET cidade = "Joinville" WHERE codigo = 6;
SELECT cidade FROM clientes WHERE cidade IS NOT NULL    #Tirando o registro nulo
GROUP BY cidade;

#5
SELECT cidade, COUNT(cidade) AS "Moradores" 
FROM clientes WHERE cidade IS NOT NULL      #Tirando o registro nulo
GROUP BY cidade;

#6
SELECT nome, idade FROM clientes WHERE cidade IS NULL;

#7
SELECT AVG(idade) FROM clientes;

#8
SELECT nome, idade FROM clientes WHERE idade = (SELECT MIN(idade) FROM clientes);

#9
SELECT nome, idade FROM clientes WHERE idade >= (SELECT AVG(idade) FROM clientes);

#10
SELECT nome, cidade, idade FROM clientes WHERE idade <= 30 AND idade >=20;

#11
SELECT nome, cidade, idade FROM clientes WHERE idade >= 30 
AND cidade="Blumenau";

#12
SELECT nome, cidade FROM clientes WHERE cidade = "Curitiba"
OR cidade = "Florianópolis";

#13
SELECT nome FROM clientes WHERE nome LIKE "%L%";

#14
SELECT nome FROM clientes ORDER BY nome;

#15
UPDATE clientes SET cidade = "Blumenau" WHERE cidade IS NULL;
SELECT * FROM clientes;     #pra teste

#16
DELETE FROM clientes WHERE cidade NOT LIKE "Blumenau";
SELECT * FROM clientes;     #pra teste

#17
DROP TABLE clientes;
