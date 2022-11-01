CREATE DATABASE jsp2;

USE jsp2;

CREATE TABLE postagens(
	cd_postagem INT PRIMARY KEY AUTO_INCREMENT,
    titulo		VARCHAR(60),
    autor		VARCHAR(40),
    descricao 	VARCHAR(5000)
    );
    
    CREATE TABLE usuarios(
	nome	VARCHAR(50) PRIMARY KEY,
	senha	VARCHAR(20),
    banido	bool,
    admin 	bool
);
# 0 = false, 1 = true
INSERT INTO usuarios values ("admin", "admin", 0, 1);
    
CREATE TABLE comentarios(
	cd_comentario 	INT PRIMARY KEY AUTO_INCREMENT,
    nome 			VARCHAR(40),
    comentario 		VARCHAR(500),
    cd_postagem		INT,
    nm_user			VARCHAR(50),
    FOREIGN KEY (nm_user) references usuarios(nome),
    FOREIGN KEY (cd_postagem) REFERENCES postagens(cd_postagem)
    );
    
    select * from postagens;
    select * from comentarios;
	select * from usuarios;
    
    
	#drop table comentarios;
    #drop table postagens;
    #drop table usuarios;
DROP DATABASE jsp2;



    
    
    
    
    