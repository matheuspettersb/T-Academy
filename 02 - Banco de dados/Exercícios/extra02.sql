-- Active: 1665409771698@@127.0.0.1@3306
CREATE DATABASE extra02;
USE extra02;

#1
CREATE TABLE alunos (
    cd_aluno        INT AUTO_INCREMENT PRIMARY KEY,
    nm_aluno        VARCHAR(30) NOT NULL,
    n1_aluno        DOUBLE NOT NULL,
    n2_aluno        DOUBLE NOT NULL,
    media_aluno     DOUBLE,
    situacao_aluno  VARCHAR(15)
);

#2
CREATE TRIGGER gerar_media
BEFORE INSERT ON alunos
FOR EACH ROW
SET NEW.media_aluno = ((NEW.n1_aluno+NEW.n2_aluno)/2);

#3
DELIMITER $$
CREATE TRIGGER seta_situacao
BEFORE INSERT ON alunos
FOR EACH ROW
BEGIN
IF NEW.media_aluno>=7 THEN
    SET NEW.situacao_aluno = "Aprovado";
ELSE
    SET NEW.situacao_aluno = "Reprovado";
END IF;
END $$
DELIMITER ;


#TESTE
INSERT INTO alunos (nm_aluno, n1_aluno, n2_aluno) VALUES
("Nelsinho", 7, 9),
("Julinho", 6, 5);

DROP TRIGGER gerar_media;
DROP TRIGGER seta_situacao;
DROP TABLE alunos;


CREATE TABLE produtos (
    cd_produto          INT AUTO_INCREMENT PRIMARY KEY,
    nm_produto          VARCHAR(30) NOT NULL,
    valor_produto       DOUBLE NOT NULL,
    valor_promocional   DOUBLE
);

CREATE TRIGGER seta_valor_promocional
BEFORE INSERT ON produtos
FOR EACH ROW
SET NEW.valor_promocional = (NEW.valor_produto*0.9);

#teste2
INSERT INTO produtos (nm_produto, valor_produto) VALUES ("Air Force do Bernas", 1000);

SELECT * FROM produtos;


DROP TABLE produtos;
DROP TRIGGER seta_valor_promocional;


#ex3
CREATE TABLE produtos (
    cd_produto          INT AUTO_INCREMENT PRIMARY KEY,
    nm_produto          VARCHAR(30) NOT NULL,
    segmento_produto    VARCHAR(20)
);

CREATE TABLE qtd_segmentos (
    nm_segmento     VARCHAR(30),
    qtd_segmento    INT
);

INSERT INTO qtd_segmentos (nm_segmento, qtd_segmento) VALUES
("segmento 1", 0),
("segmento 2", 0),
("segmento 3", 0);

DELIMITER $$
CREATE TRIGGER ajusta_qtd_segmentos
AFTER INSERT ON produtos
FOR EACH ROW
BEGIN
    UPDATE qtd_segmentos SET qtd_segmento = qtd_segmento + 1 WHERE nm_segmento = new.segmento_produto;
END $$
DELIMITER ;

INSERT INTO produtos VALUES (null, "Teste 3", "segmento 2");

SELECT * FROM qtd_segmentos;

DROP TRIGGER ajusta_qtd_segmentos;
DROP TABLE produtos, qtd_segmentos;

DROP DATABASE extra02;