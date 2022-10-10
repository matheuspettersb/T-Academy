# "#" = comentario
CREATE DATABASE BASE;

#selecionar base por linha de comando
USE base;

#tabela base1 - produtos
CREATE TABLE produtos(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30),
    marca VARCHAR(20),
    valor DOUBLE,
    dataCadastro DATE
);

#cadastrar produtos (3 tipos)
# tipo 1
INSERT INTO produtos VALUES(null, "Notebook Inspiron", "DELL", 4599, "2022-10-10");
#padrao do banco pra data = yyyy-mm-dd

#seleção
SELECT * FROM produtos;

#tipo 2 de cadastro, n tem todas as infos
INSERT INTO produtos(nome, marca, valor) VALUES("Notebook Dell", "Dell", 2900);

#tipo 3, cadastrando varios produtos de uma vez
INSERT INTO produtos VALUES
(null, "iPhone 13", "Apple", 7000, "2020-02-08"),
(null, "Monitor Predator", "Acer", 1950, "2022-10-07"),
(null, "Notebook Vostro", "Dell", 3800, "2022-03-16");

#da pra fazer um mix do 2 e do 3 se quiser

#selecionar colunas especificas
SELECT nome, valor FROM produtos;

#select c restrição (ex: valor < 3000)
SELECT * FROM produtos WHERE valor <3000;

/* operadores
	>  Maior
    <  Menor
    >= Maior ou igual
    <= Menor ou igual
    =  Igual
    <> Diferente
*/

# Trabalhando c "Null", pra tudo usa igual, pra isso usa IS/IS NOT
SELECT * FROM produtos WHERE dataCadastro IS NOT NULL;
SELECT * FROM produtos WHERE dataCadastro IS NULL;

# agrupamento de dados
# AS = "nickname" da tabela
SELECT MAX(valor) AS "Maior Valor" FROM produtos;
SELECT MIN(valor) AS "Menor Valor" FROM produtos;
SELECT AVG(valor) AS "Média Valor" FROM produtos;
SELECT COUNT(*)   AS "Registros"   FROM produtos;
# Retorna só o valor, mas n diz quem é 
# MAX/MIN só funciona pra numero
# AVG calcula a média
# COUNT ignora quem tá nulo SE INFORMAR uma coluna, se colocar asterisco tendo a linha feita ele conta

# Condicionais
SELECT
	nome,
    valor,
    IF(valor >= 3000, valor*0.9, valor*0.95) AS "Pagamento a Vista"
FROM produtos;
 # tipo ternario, "se for maior que 3k, desconto de 10%, senão desconto de 5%
 
 # switch case
 SELECT
	nome,
    valor,
	CASE
		WHEN valor <= 1000 THEN valor*.95
		WHEN valor <= 2000 THEN valor*.90
		WHEN valor <= 4000 THEN valor*.85
        ELSE valor*0.8
	END
    AS "Valores com desconto"
FROM produtos;

# operadores lógicos
# AND e OR
SELECT * FROM produtos WHERE marca="Dell" AND valor > 3000;

# Ordenar 
# funciona pra letra/numero
# padrao ASC, mas se quiser a ordem contraria só por DESC
SELECT nome FROM produtos ORDER BY nome;

# Agrupar (sem duplicatas)
SELECT marca FROM produtos GROUP BY marca;

# Contem (like)
# X% = começa com X letra, %X termina c X letra, %X% contém X letra
SELECT nome FROM produtos WHERE nome LIKE "n%";
SELECT nome FROM produtos WHERE nome LIKE "%n";
SELECT nome FROM produtos WHERE nome LIKE "%n%";

# Alterar informação
# dá pra alterar mais de um dado de uma vez, colocando "," e especificando mais uma coluna
# se n por "where" > altera TODOS os registros
UPDATE produtos SET valor = 7000 WHERE id = 1;
SELECT * FROM produtos;

#Sub-querry
SELECT nome, MAX(valor) FROM produtos;
#Assim mostra nome pega só o primeiro registro e valor pega só o maior, mas eles n necessariamente são do mesmo registro
#Pra fazer uma "seleção composta", usa assim:
SELECT * FROM produtos WHERE valor = (SELECT MAX(valor) FROM produtos);

# remover dados - delete
DELETE FROM produtos WHERE nome LIKE "Notebook%";
SELECT * FROM produtos;
# não faz o index do auto increment voltar, continua incrmentando de onde tava
# pra limpar e reiniciar, fazer assim:

TRUNCATE TABLE produtos; # :thumbs_up:
SELECT * FROM produtos;

# comando pra listar as colunas da tabela
DESCRIBE produtos;
# criar coluna
ALTER TABLE produtos ADD COLUMN estoque INT;
# remover coluna
ALTER TABLE produtos DROP COLUMN estoque;
# alterar caracteristicas das colunas (exemplo, trocar tipagem (nesse caso só a length, mas da pra torcar o tipo tmb))
ALTER TABLE produtos MODIFY COLUMN nome VARCHAR(50);
#exemplo renomeando coluna, mantém o mesmo nome, pra trocar os 2 é só fazer os 2 comandos
ALTER TABLE produtos RENAME COLUMN nome TO produto;

#excluir tabela
DROP TABLE produtos;
# excluir a DB
DROP DATABASE base;

###EX02
-- Active: 1665409771698@@127.0.0.1@3306

CREATE DATABASE projeto;
USE projeto;

create table marcas(
    codigo_marca INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(30) NOT NULL
);

INSERT INTO marcas (nome_marca) VALUES
("Apple"),
("Samsung"),
("Xiaomi");


CREATE TABLE produtos(
 codigo_produto INT AUTO_INCREMENT PRIMARY KEY,
 nome_produto VARCHAR(40) NOT NULL,
 codigo_marca INT,
 FOREIGN KEY(codigo_marca) REFERENCES marcas(codigo_marca)   
);

INSERT INTO produtos (nome_produto, codigo_marca) VALUES
("iPhone 13", 1),
("Samsung Galaxy S20", 2),
("iPhone 12", 1);



SELECT * from marcas;
SELECT * from produtos;

#mexendo com os joins
#Inner Join
SELECT
    produtos.nome_produto,
    marcas.nome_marca
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca;
# on funciona tipo um WHERE, mas por boas praticas usar assim
# dá pra encadear os joins também

SELECT 
    marcas.nome_marca,
    COUNT(produtos.codigo_marca)
FROM produtos
INNER JOIN marcas
ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY produtos.codigo_marca;

# left/right join > obrigatoriamente mostra todos os dados de 
# uma tabela independentemente da outra usar ou nao

SELECT 
    marcas.nome_marca,
    COUNT(produtos.codigo_marca)
FROM marcas
LEFT JOIN produtos
ON produtos.codigo_marca = marcas.codigo_marca
GROUP BY produtos.codigo_marca;

# mostrar a hora do comando (now()), bom pra medir performance
# date format = formatação da data
# limit > mostra 1 só
SELECT *, 
    DATE_FORMAT(now(), "%d/%m/%Y"),
    DATE_FORMAT(NOW(), "%h:%i")   
FROM produtos LIMIT 1;







