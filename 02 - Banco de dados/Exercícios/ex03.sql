-- Active: 1665409771698@@127.0.0.1@3306
CREATE DATABASE ex03;
USE ex03;
CREATE TABLE alunos (
    nome    VARCHAR(40),
    turma   VARCHAR(10),
    nota01  DOUBLE,
    nota02  DOUBLE,
    nota03  DOUBLE,
    turno   VARCHAR(10)
);

INSERT INTO alunos (nome, turma, nota01, nota02, nota03, turno) VALUES
("Ana Paula", "7A", 5, 8, 7, "Vespertino"),
("Caio Neves", "8B", 3, 4, 2, "Matutino"),
("Isabella Fontana", "7C", 9, 8.5, 9, "Vespertino"),
("Daniel Luz", "8A", 2, 5, 4, "Vespertino"),
("Gabriela Braga", "8A", 10, 10, 10, "Vespertino"),
("Ellen Souza", "7A", 5, 8, 7, "Matutino"),
("Luciana Biltz", "8B", 9.5, 10, 10, "Vespertino"),
("Paulo Almeida", "8A", 10, 10, 10, "Matutino"),
("Carla Malta", "7B", 3, 7, 9, "Matutino"),
("Diogo Andrade", "8C", 10, 9, 10, "Vespertino"),
("Mônica Mota", "8A", 7, 7, 8, "Vespertino"),
("Juliana Lima", "8C", 9, 8, 2, "Vespertino"),
("Marcelo Matos","7A", 9, 10, 5, "Matutino");
SELECT * FROM alunos;

#1
SELECT nome, ((nota01+nota02+nota03)/3) AS "Média", IF(((nota01+nota02+nota03)/3)>=7, "Aprovado", "Reprovado") AS "Situação" FROM alunos;

#2
SELECT turno, COUNT(turno) AS "Quantidade no turno" FROM alunos GROUP BY turno;

#3
SELECT turma, COUNT(turma) AS "Quantidade por Turma" FROM alunos GROUP BY turma ORDER BY turma;

#4
SELECT nome, ((nota01+nota02+nota03)/3) AS "Média" FROM alunos WHERE (((nota01+nota02+nota03)/3)>7) ORDER BY nome;

#5
SELECT COUNT(turno) FROM alunos WHERE (((nota01+nota02+nota03)/3)<7) AND turno = "Vespertino" GROUP BY turno;

#6
SELECT nome FROM alunos WHERE ((nota01+nota02+nota03)/3) = (SELECT MAX(((nota01+nota02+nota03)/3)) FROM alunos);

#7
SELECT turma, (SUM((nota01+nota02+nota03)/3)/(COUNT(turma))) AS "Média da turma" FROM alunos GROUP BY turma ORDER BY turma;

#8
UPDATE alunos SET turma = "8A" WHERE turma = "8B";

#9
DROP TABLE alunos;


