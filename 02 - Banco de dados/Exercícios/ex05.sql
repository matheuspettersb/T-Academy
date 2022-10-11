-- Active: 1665409771698@@127.0.0.1@3306
CREATE DATABASE ex05;
USE ex05;

CREATE TABLE marcas(
    codigo_marca    INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca      VARCHAR(20)
    );

CREATE TABLE produtos(
    codigo_produto  INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto    VARCHAR(50),
    valor_produto   DOUBLE,
    qtd_estoque     INT,
    codigo_marca    INT,
    FOREIGN KEY (codigo_marca) REFERENCES marcas(codigo_marca)
    );

INSERT INTO marcas (nome_marca) VALUES
("Nike"),
("Adidas"),
("Colcci"),
("Tommy Hilfiger"),
("Hering"),
("Vans"),
("Vizzano"),
("Aramis"),
("Reserva");

INSERT INTO produtos (nome_produto, valor_produto, qtd_estoque, codigo_marca) VALUES
("Tênis Adidas Performance", 345.00, 765, 2),
("Tênis Nike Revolution", 769.00, 1235, 1),
("Blusa feminina rosa", 99.00, 754, 6),
("Camisa social branca", 180.99, 235, 8),
("Bota Chelsea Lacey", 322.00, 98, 3),
("Blusa moletom Romance", 150.76, 324, 3),
("Camiseta preta base", 79.00, 1235, 4),
("Bolsa Colcci Lisa", 249.00, 112, 3),
("Camisa Adidas Originals", 346.00, 344, 2),
("Tênis WM preto", 988.00, 2341, 6),
("Bota Colcci azul", 1540.00, 143, 3),
("Scarpin feminino salto", 877.00, 673, 7),
("Camiseta Nike Dri-FIT", 124.00, 228, 1),
("Camisa polo azul", 233.00, 549, 8),
("Camisa Polo Tommy Hilfiger", 499.00, 794, 4),
("Sandália Vizzano", 1540.00, 83, 7),
("Tênis Adidas Superstar", 769.00, 326, 2),
("Camiseta algodão verde", 76.99, 1214, 9),
("Short Nike Nk", 298.00, 683, 1),
("Camisa Aramis geométrica", 355.00, 1033, 8),
("Bolsa Nike Unissex", 265.29, 596, 1),
("Camiseta Aramis vermelha", 199.00, 457, 8),
("Boné Tommy Jeans", 204.64, 68, 4),
("Jaqueta Adidas ECO", 609.98, 116, 2);

SELECT * FROM produtos;
SELECT * FROM marcas;

#1
SELECT nome_produto, nome_marca, valor_produto FROM produtos p, marcas m
WHERE p.codigo_marca = m.codigo_marca;

#2
SELECT nome_marca, COUNT(nome_produto) FROM produtos p, marcas m
WHERE p.codigo_marca = m.codigo_marca
GROUP BY nome_marca;

#3
SELECT nome_produto, valor_produto FROM produtos
ORDER BY valor_produto DESC;


DROP TABLE cargos;
#4
SELECT nome_marca, AVG(valor_produto) AS "Média por marca" FROM marcas m, produtos p
WHERE m.codigo_marca = p.codigo_marca
GROUP BY nome_marca;

#5
SELECT nome_produto, valor_produto, nome_marca, qtd_estoque FROM produtos p, marcas m
WHERE m.codigo_marca = p.codigo_marca
AND valor_produto = (SELECT MAX(valor_produto) FROM produtos);

#6
SELECT codigo_produto, nome_produto, valor_produto, qtd_estoque, nome_marca FROM produtos p, marcas  m
WHERE m.codigo_marca = p.codigo_marca
AND qtd_estoque >= 500
AND qtd_estoque <= 1000;

#7
SELECT nome_produto, valor_produto, qtd_estoque FROM produtos
WHERE nome_produto LIKE "%blusa%"
OR nome_produto LIKE "%camisa%"
OR nome_produto LIKE "%camiseta%";

#8
SELECT nome_marca, SUM(valor_produto) FROM produtos p, marcas m
WHERE m.codigo_marca = p.codigo_marca
GROUP BY nome_marca;

#9
SELECT nome_marca FROM marcas m, produtos p
WHERE m.codigo_marca = p.codigo_marca
AND p.valor_produto = (SELECT MAX(valor_produto) FROM produtos);      

#10
SELECT nome_produto, qtd_estoque FROM produtos
WHERE qtd_estoque >= (SELECT AVG(qtd_estoque) FROM produtos)
ORDER BY qtd_estoque;
#order by pra ficar clean

#11
DROP TABLE marcas, produtos;

DROP DATABASE ex05;
