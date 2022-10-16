-- Active: 1665409771698@@127.0.0.1@3306
CREATE DATABASE avaliacao;
USE avaliacao;

CREATE TABLE cor (
    cd_cor  INT AUTO_INCREMENT PRIMARY KEY,
    nm_cor  VARCHAR(20)
);

CREATE TABLE combustivel (
    cd_combustivel  INT AUTO_INCREMENT PRIMARY KEY,
    nm_combustivel  VARCHAR(30)
);

CREATE TABLE marca (
    cd_marca    INT AUTO_INCREMENT PRIMARY KEY,
    nm_marca    VARCHAR(30)
);

CREATE TABLE modelo (
    cd_modelo   INT AUTO_INCREMENT PRIMARY KEY,
    cd_marca    INT,
    ds_modelo   VARCHAR(50),
    FOREIGN KEY (cd_marca) REFERENCES marca (cd_marca)
);

CREATE TABLE endereco (
    cd_endereco INT PRIMARY KEY,
    nm_endereco VARCHAR(50)
);

CREATE TABLE proprietario (
    cd_proprietario INT AUTO_INCREMENT PRIMARY KEY,
    cd_localidade   INT,
    nm_proprietario VARCHAR(50),
    nr_telefone     VARCHAR(15),
    FOREIGN KEY (cd_localidade) REFERENCES endereco (cd_localidade)
);

CREATE TABLE acessorio (
    cd_acessorio    INT AUTO_INCREMENT PRIMARY KEY,
    ds_acessorio    VARCHAR(50)
);

CREATE TABLE veiculo (
    nr_placa        VARCHAR(7) PRIMARY KEY,
    cd_cor          INT,
    cd_proprietario INT,
    cd_modelo       INT,
    cd_combustivel  INT,
    cd_acessorio    INT,
    ano_fabricacao  VARCHAR(4),
    FOREIGN KEY (cd_cor) REFERENCES cor(cd_cor),
    FOREIGN KEY (cd_proprietario) REFERENCES proprietario(cd_proprietario),
    FOREIGN KEY (cd_modelo) REFERENCES modelo(cd_modelo),
    FOREIGN KEY (cd_combustivel) REFERENCES combustivel(cd_combustivel),
    FOREIGN KEY (cd_acessorio) REFERENCES acessorio(cd_acessorio)
);

INSERT INTO cor (ds_cor) VALUES
("Preto"),
("Branco"),
("Verde"),
("Vermelho"),
("Prata"),
("Azul"),
("Marrom"),
("Pérola"),
("Amarelo"),
("Rosa");

INSERT INTO combustivel (ds_combustivel) VALUES
("Gasolina Comum"),
("Gasolina Aditivada"),
("Etanol"),
("Álcool"),
("Eletricidade"),
("Água"),
("Uranio"),
("Plutônio"),
("Spin Power"),
("Propulsão Humana");

INSERT INTO marca (ds_marca) VALUES
("Volkswagen"),
("Chevrolet"),
("Toyota"),
("Renault"),
("Ford"),
("Subaru"),
("Mitsubishi"),
("Mercedes"),
("Jaguar"),
("Ferrari");

INSERT INTO  () VALUES
(),
(),
(),
(),
(),
(),
(),
(),
(),
();
