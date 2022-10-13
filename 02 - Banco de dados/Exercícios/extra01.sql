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
    velocidade_montaria INT
    #fk dono(personagem)
);

CREATE TABLE item (
    ds_item     VARCHAR(200),
    uso_item    VARCHAR(20),
    dano_item   INT,
);

CREATE TABLE poder (
    ds_poder        VARCHAR(200),
    buff_poder      VARCHAR(50),
    debuff_poder    VARCHAR(50),
    dano_poder      INT,
)

#missao fk personagem
#inventario fk personagem, item, poder
#criar setima tabela