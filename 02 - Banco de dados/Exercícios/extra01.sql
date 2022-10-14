-- Active: 1665409771698@@127.0.0.1@3306
CREATE DATABASE extra01;
USE extra01;

CREATE TABLE personagem (
    cd_personagem   INT AUTO_INCREMENT PRIMARY KEY,
    nm_personagem   VARCHAR(20)
);

CREATE TABLE montaria (
    cd_montaria         INT AUTO_INCREMENT PRIMARY KEY,
    nm_montaria         VARCHAR(30),
    velocidade_montaria INT,
    cd_personagem       INT,
    FOREIGN KEY (cd_personagem) REFERENCES personagem(cd_personagem)
);

CREATE TABLE item (
    cd_item     INT AUTO_INCREMENT PRIMARY KEY,
    nm_item     VARCHAR(30),
    ds_item     VARCHAR(200),
    dano_item   INT
);

CREATE TABLE poder (
    cd_poder        INT AUTO_INCREMENT PRIMARY KEY,
    nm_poder        VARCHAR(30),
    ds_poder        VARCHAR(200),
    buff_poder      VARCHAR(50),
    debuff_poder    VARCHAR(50),
    dano_poder      INT
);

CREATE TABLE inventario (
    cd_personagem   INT,
    cd_item         INT,
    cd_poder        INT,
    FOREIGN KEY (cd_personagem) REFERENCES personagem(cd_personagem),
    FOREIGN KEY (cd_item) REFERENCES item(cd_item),
    FOREIGN KEY (cd_poder) REFERENCES poder(cd_poder)
);

CREATE TABLE premio(
    cd_premio   INT AUTO_INCREMENT PRIMARY KEY,
    ds_premio   VARCHAR(20)
);

CREATE TABLE missao (
    cd_missao       INT AUTO_INCREMENT PRIMARY KEY,
    status_missao   VARCHAR(20),
    cd_personagem   INT,
    cd_premio       INT,
    FOREIGN KEY (cd_personagem) REFERENCES personagem(cd_personagem),
    FOREIGN KEY (cd_premio) REFERENCES premio(cd_premio)
);

INSERT INTO personagem (nm_personagem) VALUES
("Link"),
("Gyro Zeppeli"),
("Johnny Joestar"),
("Wander"),
("Ronan Erudon"),
("Leco");


INSERT INTO montaria (nm_montaria, velocidade_montaria, cd_personagem) VALUES
("Epona", 30, 1),
("Valkyre", 65, 2),
("Johnny Joestar", 60, 3),
("Agro", 50, 4);

INSERT INTO item (nm_item, ds_item, dano_item) VALUES
("Master Sword", "A Master Sword é uma espada poderosa forjada pela Deusa Hylia e encantada pelo Herói dos Céus para selar o mal.", 60),
("Olho Direito de Jesus Cristo", "Uma das partes do corpo de Jesus Cristo, concede ou expande as capacidades do Stand do usuário.", 0),
("Chá de Ervas", "Um delicioso chá de ervas que aumenta temporariamente o fator de cura do usuário", 0),
("Espada Antiga", "Espada poderosa que permite rastrear os Colossos na presença de luz, além de revelar seus pontos fracos", 50),
("Tyrfing", "Espada braba da quarta classe do Ronan", 60),
("Espada quebrada", "Encontrada em Undead Burg, um lixo", 5),
("Escudo de madeira", "Pega fogo e some", 0);

INSERT INTO poder (nm_poder, ds_poder, buff_poder, debuff_poder, dano_poder) VALUES
("Chute de fogo", "Só pode ser usado pelo Leco, fica mais forte a cada uso", null, null, 100),
("Vento de Farore", "Permite criar um ponto de translocação para o qual se pode teletransportar dentro de uma dungeon", null, null, 0),
("Marca da maldição", "Aquele poder do Sasuke", null, null, 0),
("Tusk", "Habilidade de Stand de quatro atos, ganha novas habilidades conforme o usuário desenvolve seu poder de Spin.", null, null, 100);

INSERT INTO inventario (cd_personagem, cd_item, cd_poder) VALUES
(1, 1, 2),
(2, 2, null),
(3, 3, 4),
(4, 4, null),
(5, 5, null),
(6, null, 1),
(6, null, 3),
(null, 6, null),
(null, 7, null);

INSERT INTO premio (ds_premio) VALUES
("30 rupeas"),
("USD 50.000.000");

INSERT INTO missao (status_missao, cd_personagem, cd_premio) VALUES
("Em andamento", 1, 1),
("Concluida", 2, 2),
("Concluida", 3, 2);

#linka os personagens com suas respectivas montarias
CREATE VIEW montaria_personagem AS
SELECT nm_montaria, nm_personagem FROM montaria m
LEFT JOIN personagem p
ON m.cd_personagem = p.cd_personagem;

#relaciona as missoes c os premios
CREATE VIEW missao_premio AS
SELECT cd_missao, ds_premio FROM missao m
INNER JOIN premio p
ON p.cd_premio = m.cd_premio;

#relaciona personagem(codigo), item (nome) e poder(nome)
CREATE VIEW inventario_personagemcd AS
SELECT p.cd_personagem, i.nm_item, pd.nm_poder FROM inventario iv
LEFT JOIN item i
ON i.cd_item = iv.cd_item
LEFT JOIN poder pd
ON pd.cd_poder = iv.cd_poder
RIGHT JOIN personagem p
ON iv.cd_personagem = p.cd_personagem;

#relaciona personagem(nome), item (nome) e poder(nome)
CREATE VIEW inventario_personagem_nome AS
SELECT p.nm_personagem, i.nm_item, pd.nm_poder FROM inventario iv
LEFT JOIN item i
ON i.cd_item = iv.cd_item
LEFT JOIN poder pd
ON pd.cd_poder = iv.cd_poder
RIGHT JOIN personagem p
ON iv.cd_personagem = p.cd_personagem;

#linka personagem, missao e premio
CREATE VIEW personagem_missao_premio AS
SELECT p.nm_personagem, m.cd_missao, pr.ds_premio FROM missao m
INNER JOIN personagem p
ON m.cd_personagem = p.cd_personagem
INNER JOIN premio pr
ON pr.cd_premio = m.cd_premio
GROUP BY cd_missao;

#linka personagem, missao, item, poder e premio
CREATE VIEW personagem_item_poder_missao_premio AS
SELECT p.nm_personagem, pd.nm_poder, i.nm_item, m.cd_missao, pr.ds_premio FROM inventario iv
INNER JOIN personagem p
ON p.cd_personagem = iv.cd_personagem
LEFT JOIN poder pd
ON pd.cd_poder = iv.cd_poder
LEFT JOIN item i
ON i.cd_item = iv.cd_item
LEFT JOIN missao m
ON m.cd_personagem = p.cd_personagem
LEFT JOIN premio pr
ON pr.cd_premio = m.cd_premio;

#linka personagem, missao, item, poder e premio, mas mostra só os codigos
CREATE VIEW cd_pers_poder_item_premio_missao AS
SELECT p.cd_personagem, pd.cd_poder, i.cd_item, m.cd_missao, pr.cd_premio FROM inventario iv
INNER JOIN personagem p
ON p.cd_personagem = iv.cd_personagem
LEFT JOIN poder pd
ON pd.cd_poder = iv.cd_poder
LEFT JOIN item i
ON i.cd_item = iv.cd_item
LEFT JOIN missao m
ON m.cd_personagem = p.cd_personagem
LEFT JOIN premio pr
ON pr.cd_premio = m.cd_premio;

#mostra tudo de importante
CREATE VIEW tudao AS
SELECT iv.cd_personagem, p.nm_personagem, mt.nm_montaria, i.nm_item, pd.nm_poder, m.cd_missao, pr.ds_premio FROM inventario iv
LEFT JOIN personagem p
ON p.cd_personagem = iv.cd_personagem
LEFT JOIN montaria mt
ON mt.cd_personagem = p.cd_personagem
LEFT JOIN missao m
ON p.cd_personagem = m.cd_personagem
LEFT JOIN premio pr
ON pr.cd_premio = m.cd_premio
LEFT JOIN poder pd
ON pd.cd_poder = iv.cd_poder
LEFT JOIN item i
ON i.cd_item = iv.cd_item;

#mostra tudo de importante, mas só os codigos (execeto o nome do personagem)
CREATE VIEW tudao_cd AS
SELECT iv.cd_personagem, p.nm_personagem, mt.cd_montaria, i.cd_item, pd.cd_poder, m.cd_missao, pr.cd_premio FROM inventario iv
LEFT JOIN personagem p
ON p.cd_personagem = iv.cd_personagem
LEFT JOIN montaria mt
ON mt.cd_personagem = p.cd_personagem
LEFT JOIN missao m
ON p.cd_personagem = m.cd_personagem
LEFT JOIN premio pr
ON pr.cd_premio = m.cd_premio
LEFT JOIN poder pd
ON pd.cd_poder = iv.cd_poder
LEFT JOIN item i
ON i.cd_item = iv.cd_item;

#mostra tudo, com codigos e nomes
CREATE VIEW tudao_cds_nms AS
SELECT  iv.cd_personagem, p.nm_personagem,
        mt.cd_montaria, mt.nm_montaria, 
        i.cd_item, i.nm_item,
        pd.cd_poder, pd.nm_poder,
        m.cd_missao,
        pr.cd_premio, pr.ds_premio FROM inventario iv
LEFT JOIN personagem p
ON p.cd_personagem = iv.cd_personagem
LEFT JOIN montaria mt
ON mt.cd_personagem = p.cd_personagem
LEFT JOIN missao m
ON p.cd_personagem = m.cd_personagem
LEFT JOIN premio pr
ON pr.cd_premio = m.cd_premio
LEFT JOIN poder pd
ON pd.cd_poder = iv.cd_poder
LEFT JOIN item i
ON i.cd_item = iv.cd_item;

#EXECUTANDO AS VIEWS
SELECT * FROM cd_pers_poder_item_premio_missao;
SELECT * FROM inventario_personagem_nome;
SELECT * FROM inventario_personagemcd;
SELECT * FROM missao_premio;
SELECT * FROM montaria_personagem;
SELECT * FROM personagem_item_poder_missao_premio;
SELECT * FROM personagem_missao_premio;
SELECT * FROM tudao_cds_nms;
SELECT * FROM tudao_cd;
SELECT * FROM tudao;

