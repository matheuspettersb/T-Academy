-- Active: 1665409771698@@127.0.0.1@3306
CREATE DATABASE ex07;
USE ex07;

CREATE TABLE professores (
    cd_prof INT AUTO_INCREMENT PRIMARY KEY,
    nm_prof VARCHAR(20)
);

CREATE TABLE cursos (
    cd_curso    INT AUTO_INCREMENT PRIMARY KEY,
    nm_curso    VARCHAR(20),
    valor_curso DOUBLE,
    cd_prof     INT,
    FOREIGN KEY (cd_prof) REFERENCES professores(cd_prof)
);

CREATE TABLE alunos (
    cd_aluno            INT AUTO_INCREMENT PRIMARY KEY,
    nm_aluno            VARCHAR(20),
    nascimento_aluno    DATE,
    estado_aluno        VARCHAR(20),
    cidade_aluno        VARCHAR(40)
);

CREATE TABLE alunos_cursos (
    cd_aluno        INT,
    cd_curso        INT,
    status_curso    VARCHAR(20)
);

INSERT INTO professores (nm_prof) VALUES
("Larissa"),
("Daniel"),
("Gustavo"),
("Carla"),
("Guilherme"),
("Carina"),
("Lúcio"),
("Bianca");

INSERT INTO cursos (nm_curso, valor_curso, cd_prof) VALUES
("Java - Básico", 1000.00, 2),
("Java - Avançado", 1250.00, 2),
("Spring Boot", 1800.00, 2),
("C#", 1140.00, 7),
("ASP.NET Core", 1800.00, 7),
("Python", 900.00, 4),
("Flask", 1020.00, 4),
("Django", 1400.00, 4),
("PHP", 950.00, 4),
("Laravel", 1600.00, 4),
("Angular", 2300.00, 1),
("React", 2100.00, 1),
("HTML", 500.00, 8),
("CSS", 700.00, 8),
("JavaScript", 900.00, 4),
("Banco de dados", 600.00, 3),
("Design Patterns", 2700.00, 8);

SELECT * FROM cursos;

INSERT INTO alunos (nm_aluno, nascimento_aluno, estado_aluno, cidade_aluno) VALUES
("Aline", "1997/03/01", "Santa Catarina", "Blumenau"),
("Mariana", "1993/08/28", "Santa Catarina", "Joinville"),
("Gustavo", "2000/11/14", "São Paulo", "Campinas"),
("Bianca", "1999/01/07", "Santa Catarina", "Blumenau"),
("Ricardo", "2002/07/30", "Paraná", "Curitiba"),
("Tamara", "2005/02/22", "São Paulo", "São Paulo"),
("Juliano", "1986/09/19", "Paraná", "Londrina"),
("Fernanda", "1987/01/28", "São Paulo", "São Paulo"),
("Alice", "2001/06/13", "Santa Catarina", "Blumenau"),
("Henrique", "1991/01/24", "Rio de Janeiro", "Niterói"),
("Marcelo", "1988/12/08", "Paraná", "Curitiba"),
("Daniela", "1998/10/14", "Santa Catarina", "Florianópolis"),
("Caroline", "2002/04/10", "Paraná", "Maringá"),
("Letícia", "1993/08/22", "São Paulo", "São Paulo"),
("Mauro", "1996/09/08", "Santa Catarina", "Jaraguá do Sul");

INSERT INTO alunos_cursos (cd_aluno, cd_curso, status_curso) VALUES
(1, 2, "Concluído"),
(3, 6, "Em andamento"),
(1, 7, "Concluído"),
(4, 2, "Em andamento"),
(9, 16, "Não iniciado"),
(8, 10, "Concluído"),
(1, 4, "Concluído"),
(4, 9, "Não iniciado"),
(10, 2, "Em andamento"),
(7, 1, "Concluído"),
(12, 2, "Não iniciado"),
(2, 1, "Não iniciado"),
(15, 7, "Não iniciado"),
(11, 2, "Concluído"),
(6, 13, "Em andamento"),
(3, 4,  "Em andamento"),
(4, 10, "Em andamento"),
(9, 17, "Concluído"),
(1, 5, "Em andamento"),
(10, 8, "Em andamento");

#1
SELECT nm_aluno, COUNT(nm_curso) FROM alunos_cursos ac
INNER JOIN alunos a
ON a.cd_aluno = ac.cd_aluno
INNER JOIN cursos c
ON c.cd_curso = a.cd_aluno
GROUP BY a.nm_aluno;

#2
SELECT status_curso, COUNT(cd_curso) AS "Quantidade" FROM alunos_cursos
GROUP BY status_curso;

#3
SELECT a.nm_aluno, nm_curso FROM alunos_cursos ac
INNER JOIN alunos a
ON a.cd_aluno = ac.cd_aluno
INNER JOIN cursos c
ON c.cd_curso = ac.cd_curso
WHERE ac.status_curso = "Concluído"
AND c.valor_curso >=1000;

#4
SELECT COUNT(nm_aluno) FROM alunos
GROUP BY estado_aluno;

#5
SELECT a.nm_aluno, c.nm_curso FROM alunos_cursos ac
INNER JOIN alunos a
ON a.cd_aluno = ac.cd_aluno
INNER JOIN cursos c
ON c.cd_curso = ac.cd_curso
WHERE ac.status_curso = "Não Iniciado";

#6
SELECT a.nm_aluno, COUNT(ac.cd_curso) FROM alunos a
INNER JOIN alunos_cursos ac
ON a.cd_aluno = ac.cd_aluno
WHERE ((SELECT DATEDIFF(CURRENT_DATE(), a.nascimento_aluno)/365.25)) < 18
GROUP BY a.nm_aluno;

#7
SELECT c.nm_curso, c.valor_curso, COUNT(ac.cd_aluno) FROM alunos_cursos ac
INNER JOIN cursos c
ON c.cd_curso = ac.cd_curso
WHERE c.valor_curso = (SELECT MAX(valor_curso) FROM cursos)
GROUP BY c.nm_curso;

#8
SELECT p.nm_prof, COUNT(c.cd_curso) FROM professores p
INNER JOIN cursos c
ON c.cd_prof = p.cd_prof
GROUP BY nm_prof;

#9
SELECT nm_prof, nm_curso, COUNT(cd_aluno) AS qt_alunos
FROM alunos_cursos ac
RIGHT JOIN cursos c
ON ac.cd_curso = c.cd_curso
RIGHT JOIN professores p 
ON p.cd_prof = c.cd_prof
GROUP BY nm_prof, nm_curso;

#10
SELECT nm_aluno, nm_curso, valor_curso, nm_prof FROM alunos_cursos ac
LEFT JOIN alunos a
ON a.cd_aluno = ac.cd_aluno
INNER JOIN cursos c
ON c.cd_curso = ac.cd_curso
INNER JOIN professores p
ON c.cd_prof = p.cd_prof;

#11
SELECT AVG(valor_curso) FROM cursos;

#12
SELECT c.nm_curso, c.valor_curso, COUNT(ac.cd_aluno) FROM alunos_cursos ac
RIGHT JOIN cursos c
ON ac.cd_curso = c.cd_curso
WHERE c.valor_curso >= (SELECT AVG(valor_curso) FROM cursos)
GROUP BY c.nm_curso;

#13
DELETE FROM alunos WHERE ((SELECT DATEDIFF(CURRENT_DATE(), nascimento_aluno)/365.25)) > 30;

#14
DROP TABLE alunos, alunos_cursos, cursos, professores;
DROP DATABASE ex07;


