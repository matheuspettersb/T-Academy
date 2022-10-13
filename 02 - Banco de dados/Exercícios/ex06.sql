-- Active: 1665409771698@@127.0.0.1@3306
CREATE DATABASE ex06;
USE ex06;

CREATE TABLE professores (
    codigo_prof INT AUTO_INCREMENT PRIMARY KEY,
    nome_prof   VARCHAR(20)
);

CREATE TABLE materias (
    codigo_materia  INT AUTO_INCREMENT PRIMARY KEY,
    codigo_prof     INT,
    nome_materia    VARCHAR(20),
    FOREIGN KEY (codigo_prof) REFERENCES professores(codigo_prof)
);

CREATE TABLE turmas (
    codigo_turma    INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma      VARCHAR(2),
    turno_turma     VARCHAR(10)
);

CREATE TABLE alunos (
    codigo_aluno    INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno      VARCHAR(30)
);

CREATE TABLE alunos_turmas (
    codigo_aluno    INT,
    codigo_materia  INT,
    codigo_turma    INT,
    FOREIGN KEY (codigo_aluno) REFERENCES alunos(codigo_aluno),
    FOREIGN KEY (codigo_materia) REFERENCES materias(codigo_materia),
    FOREIGN KEY (codigo_turma) REFERENCES turmas(codigo_turma)
);
describe alunos_turmas;

INSERT INTO professores (nome_prof) VALUES
("Renato"),
("Oscar"),
("Cátia"),    
("Osvaldo"),
("Marília"),
("Paula"),
("Otávio"),
("Airton");

INSERT INTO materias (codigo_prof, nome_materia) VALUES
(1, "Matemática"),
(2, "Geografia"),
(7, "Química"),
(6, "Filosofia"),
(1, "Física"),
(3, "Português"),
(3, "Inglês"),
(6, "Sociologia"),
(5, "Português"),
(4, "História"),
(4, "Sociologia"),
(5, "Espanhol"),
(8, "Biologia"),
(8, "Química");

INSERT INTO turmas (nome_turma, turno_turma) VALUES
("6A", "Matutino"),
("6B", "Vespertino"),
("7A", "Matutino"),
("7A", "Vespertino"),
("8A", "Matutino"),
("8B", "Vespertino");

INSERT INTO alunos (nome_aluno) VALUES
("Alessandra"),
("Emanuela"),
("Cíntia"),
("Diego"),
("Eduardo"),
("Larissa"),
("Jonathan"),
("Cleber"),
("Jéssica"),
("Lucas"),
("Murilo"),
("Marcelo"),
("Rebeca"),
("Tatiana"),
("Taís"),
("Gabriel"),
("Felipe"),
("Eliza"),
("Sarah"),
("Patrícia");

INSERT INTO alunos_turmas (codigo_aluno, codigo_materia, codigo_turma) VALUES
(1, 1, 1),
(2, 5, 1),
(3, 10, 2),
(4, 14, 1),
(5, 1, 1),
(6, 2, 6),
(7, 3, 2),
(8, 6, 3),
(9, 5, 4),
(10, 4, 4),
(11, 1, 5),
(12, 5, 2),
(13, 8, 3),
(14, 13, 6),
(15, 6, 5),
(16, 14, 3),
(17, 9, 5),
(18, 3, 1),
(19, 8, 4),
(20, 5, 6),
(4, 10, 3),
(15, 2, 1),
(12, 10, 1),
(9, 8, 6);

#1
SELECT a.nome_aluno, m.nome_materia, t.nome_turma FROM alunos_turmas alt
INNER JOIN alunos a
ON a.codigo_aluno = alt.codigo_aluno
INNER JOIN materias m
ON m.codigo_materia = alt.codigo_materia
INNER JOIN turmas t
ON t.codigo_turma = alt.codigo_turma;   

#2
SELECT p.nome_prof, m.nome_materia FROM professores p
INNER JOIN materias m
ON m.codigo_prof = p.codigo_prof;

#3
SELECT t.nome_turma, COUNT(a.nome_aluno) FROM alunos_turmas alt
INNER JOIN turmas t
ON t.codigo_turma = alt.codigo_turma
INNER JOIN alunos a
ON a.codigo_aluno = alt.codigo_aluno
GROUP BY nome_turma;

#4
SELECT t.turno_turma, COUNT(a.nome_aluno) FROM alunos_turmas alt
INNER JOIN turmas t
ON t.codigo_turma = alt.codigo_turma
INNER JOIN alunos a
ON a.codigo_aluno = alt.codigo_aluno
GROUP BY t.turno_turma;

#5
SELECT a.nome_aluno, t.nome_turma, m.nome_materia FROM alunos_turmas alt
INNER JOIN alunos a
ON a.codigo_aluno = alt.codigo_aluno
INNER JOIN materias m
ON m.codigo_materia = alt.codigo_materia
INNER JOIN turmas t
ON t.codigo_turma = alt.codigo_turma
INNER JOIN professores p
ON p.codigo_prof = m.codigo_prof
WHERE p.nome_prof = "Renato";

#6
SELECT nome_prof FROM professores p
INNER JOIN materias m
ON p.codigo_prof = m.codigo_prof
WHERE m.nome_materia = "Quimica";

#7
SELECT a.nome_aluno FROM alunos_turmas alt
INNER JOIN alunos a
ON a.codigo_aluno = alt.codigo_aluno
INNER JOIN materias m
ON m.codigo_materia = alt.codigo_materia
WHERE m.nome_materia = "Historia";

#8
SELECT nome_prof FROM professores p
INNER JOIN materias m
ON p.codigo_prof = m.codigo_prof
WHERE m.nome_materia = "Português"
OR m.nome_materia = "Inglês"
GROUP BY p.nome_prof;

#9
SELECT m.nome_materia, COUNT(a.nome_aluno) FROM alunos_turmas alt
INNER JOIN alunos a
ON a.codigo_aluno = alt.codigo_aluno
INNER JOIN materias m
ON m.codigo_materia = alt.codigo_materia
GROUP BY m.nome_materia;

#10
SELECT a.nome_aluno FROM alunos_turmas alt
INNER JOIN alunos a
ON a.codigo_aluno = alt.codigo_aluno
INNER JOIN materias m
ON m.codigo_materia = alt.codigo_materia
INNER JOIN professores p
ON p.codigo_prof = m.codigo_prof
WHERE p.nome_prof = "Paula"
AND m.nome_materia = "Sociologia";
#catia e ingles n tinha nada

#11
SELECT COUNT(a.nome_aluno) FROM alunos_turmas alt
INNER JOIN alunos a
ON a.codigo_aluno = alt.codigo_aluno
INNER JOIN materias m
ON m.codigo_materia = alt.codigo_materia
INNER JOIN turmas t
ON t.codigo_turma = alt.codigo_turma
INNER JOIN professores p
ON p.codigo_prof = m.codigo_prof
WHERE p.nome_prof = "Renato"
and m.nome_materia = "Matemática";

#12
SELECT m.nome_materia FROM materias m
INNER JOIN professores p
ON p.codigo_prof = m.codigo_prof
WHERE p.nome_prof = "Airton";

#13
SELECT COUNT(nome_aluno) FROM alunos_turmas alt
INNER JOIN turmas t
ON t.codigo_turma = alt.codigo_turma
INNER JOIN alunos a
ON a.codigo_aluno = alt.codigo_aluno
INNER JOIN materias m
ON m.codigo_materia = alt.codigo_materia
WHERE turno_turma = "Vespertino"
AND nome_materia = "Biologia";

#14
DROP TABLE alunos, turmas, materias, professores, alunos_turmas;
DROP DATABASE ex06;