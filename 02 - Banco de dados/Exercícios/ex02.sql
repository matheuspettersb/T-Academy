-- Active: 1665409771698@@127.0.0.1@3306
CREATE DATABASE ex02;
USE ex02;

CREATE TABLE produtos (
    codigo  INT AUTO_INCREMENT PRIMARY KEY,
    nome    VARCHAR(50),
    marca   VARCHAR(25),
    valor   DOUBLE,
    estoque INT
);

INSERT INTO produtos (nome, marca, valor, estoque) VALUES
("Teclado", "Microsoft", 220.00, 60),
("Monitor 32", "Samsung", 3700.00, 20),
("Mouse", "Logitech", 129.90, 45),
("Impressora", "Epson", 430.00, 15),
("Mouse", "Microsoft", 199.90, 50),
("Monitor 27", "LG", 1990.80, 30),
("Cadeira Gamer", "Multilaser", 1170.00, 20),
("Teclado", "Dell", 110.00, 50),
("Mouse", "HP", 80.00, 70),
("Placa de vídeo - GeForce GTX 1660", "ASUS", 2800.00, 10),
("SSD de 256GB", "Kingston", 400.00, 15),
("Processador Core i5 - 10º geração", "Intel", 1800.00, 10),
("Mouse", "Multilaser", 44.90, 70),
("Monitor 23", "Dell", 1080.00, 40),
("Teclado", "HP", 119.90, 25);
SELECT * FROM produtos;     #Conferencia

#1
SELECT marca, COUNT(marca) FROM produtos GROUP BY marca;

#2
SELECT AVG(valor) AS "Média de valor" FROM produtos;

#3
SELECT marca, SUM(valor) AS "Soma dos valores" FROM produtos GROUP BY marca;

#4
SELECT nome, valor FROM produtos ORDER BY valor DESC;

#5
SELECT nome, valor FROM produtos WHERE valor = (SELECT MAX(valor) FROM produtos);

#6
SELECT nome, valor FROM produtos WHERE valor >= (SELECT AVG(valor) FROM produtos);

#7
SELECT nome, marca, valor, estoque FROM produtos WHERE estoque = (SELECT MAX(estoque) FROM produtos);

#8
SELECT nome, marca, valor FROM produtos WHERE valor >=100
AND valor <=500
ORDER BY valor;
# order by pra ficar mais clean

#9
SELECT nome, marca, valor FROM produtos WHERE nome LIKE "%mouse%" ORDER BY valor;

#10
SELECT nome, (SELECT LENGTH(nome)) FROM produtos;

#11
UPDATE produtos SET marca = "Alienware" WHERE marca = "Dell";

#12
DROP TABLE produtos;

