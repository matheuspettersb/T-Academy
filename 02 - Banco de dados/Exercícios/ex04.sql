-- Active: 1665409771698@@127.0.0.1@3306

CREATE DATABASE ex04;
USE ex04;

CREATE TABLE cargos(
    codigo_cargo    INT AUTO_INCREMENT PRIMARY KEY,
    nome_cargo      VARCHAR(50),
    salario_cargo   INT
);

CREATE TABLE colaboradores(
    codigo_colaborador      INT AUTO_INCREMENT PRIMARY KEY,
    nome_colaborador        VARCHAR(40),
    nascimento_colaborador  DATE,
    codigo_cargo            INT,
    estado_trabalho         VARCHAR(2),
    cidade_trabalho         VARCHAR(20),
    genero_colaborador      VARCHAR(10),
    FOREIGN KEY (codigo_cargo) REFERENCES cargos (codigo_cargo)
);

INSERT INTO cargos (nome_cargo, salario_cargo) VALUES
("Desenvolvedor", 3000),
("Analista", 4500),
("Arquiteto de Software", 6200),
("Administrador de Banco de Dados", 7700),
("Gerente de Projetos", 9000);

INSERT INTO colaboradores (nome_colaborador, nascimento_colaborador, codigo_cargo, estado_trabalho, cidade_trabalho, genero_colaborador) VALUES
("Jefferson", "1973/05/19", 1, "SC", "Blumenau", "Masculino"),
("Larissa", "1991/01/22", 5, "SC", "Joinville", "Feminino"),
("Cleber", "1987/03/18", 2, "PR", "Curitiba", "Masculino"),
("Luciano", "1995/08/09", 1, "SC", "Blumenau", "Masculino"),
("Jéssica", "1988/08/22", 4, "SC", "Florianópolis", "Feminino"),
("Guilherme", "1982/11/16", 2, "SC", "Blumenau", "Masculino"),
("Marcelo", "1993/04/15", 2, "PR", "Londrina", "Masculino"),
("Brenda", "1992/02/17", 1, "SC", "Joinville", "Feminino"),
("Rebeca", "1984/06/26", 4, "SC", "Blumenau", "Feminino"),
("Cristiano", "1983/07/02", 1, "SC", "Florianópolis", "Masculino"),
("Éder", "1991/11/10", 1, "SC", "Blumenau", "Masculino"),
("William", "1992/12/17", 2, "PR", "Curitiba", "Masculino"),
("Vanessa", "1996/09/29", 1, "SC", "Blumenau", "Feminino"),
("Robson", "1984/05/30", 1, "PR", "Londrina", "Masculino"),
("Tatiana", "1990/02/03", 5, "PR", "Curitiba", "Feminino"),
("Henrique", "1999/10/07", 1, "SC", "Blumenau", "Masculino"),
("Lorena", "1996/04/20", 1, "SC", "Joinville", "Feminino"),
("Carla", "1988/09/28", 4, "PR", "Curitiba", "Feminino"),
("Alexandre", "1982/07/17", 2, "SC", "Blumenau", "Masculino");

SELECT * FROM colaboradores;
SELECT * FROM cargos;

#1
SELECT nome_colaborador, nome_cargo, salario_cargo FROM colaboradores, cargos
WHERE colaboradores.codigo_cargo = cargos.codigo_cargo;

#2
SELECT nome_cargo, COUNT(nome_cargo) AS "Qtd. pessoas no cargo" FROM colaboradores c, cargos ca
WHERE c.codigo_cargo = ca.codigo_cargo
GROUP BY  ca.nome_cargo;

#3
SELECT genero_colaborador, (SUM(salario_cargo)/COUNT(genero_colaborador)) "Média salarial do gênero" FROM colaboradores c, cargos ca
WHERE c.codigo_cargo = ca.codigo_cargo
GROUP BY c.genero_colaborador;

#4
SELECT nome_colaborador, nascimento_colaborador FROM colaboradores c
WHERE ((SELECT DATEDIFF(CURRENT_DATE(), nascimento_colaborador)/365.25)) <= 30
AND ((SELECT DATEDIFF(CURRENT_DATE(), nascimento_colaborador)/365.25)) >= 20;

#5
SELECT estado_trabalho, COUNT(estado_trabalho) AS "Colaboradores no estado" FROM colaboradores
GROUP BY estado_trabalho;

#6
SELECT cidade_trabalho, COUNT(cidade_trabalho) AS "Colaboradores na cidade" FROM colaboradores
GROUP BY cidade_trabalho;

#7
SELECT COUNT(genero_colaborador) AS "Colaboradoras com mais de 30 no PR" FROM colaboradores
WHERE genero_colaborador = "Feminino"
AND estado_trabalho = "PR"
AND ((SELECT DATEDIFF(CURRENT_DATE(), nascimento_colaborador)/365.25)) >= 30;

#8
SELECT cidade_trabalho, (SUM(salario_cargo)/COUNT(cidade_trabalho)) AS "Média salarial por cidade" FROM colaboradores c, cargos ca
WHERE c.codigo_cargo = ca.codigo_cargo
GROUP BY c.cidade_trabalho;

#9
SELECT AVG(salario_cargo) AS "Média salarial total" FROM colaboradores c, cargos ca
WHERE c.codigo_cargo = ca.codigo_cargo;

#10
SELECT * FROM colaboradores c, cargos ca
WHERE c.codigo_cargo = ca.codigo_cargo
AND (SELECT DATEDIFF(CURRENT_DATE(), nascimento_colaborador)/365.25) = (SELECT MAX((SELECT DATEDIFF(CURRENT_DATE(), nascimento_colaborador)/365.25)) FROM colaboradores);

#11
SELECT COUNT(nome_colaborador) FROM colaboradores
WHERE ((SELECT DATEDIFF(CURRENT_DATE(), nascimento_colaborador)/365.25)) <= 32
AND ((SELECT DATEDIFF(CURRENT_DATE(), nascimento_colaborador)/365.25)) >= 22;

#12
DROP TABLE colaboradores, cargos;

DROP DATABASE ex04;