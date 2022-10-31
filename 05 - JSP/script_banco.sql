CREATE DATABASE jsp2;

USE jsp2;

CREATE TABLE postagens(
	cd_postagem INT PRIMARY KEY AUTO_INCREMENT,
    titulo		VARCHAR(60),
    autor		VARCHAR(40),
    descricao 	VARCHAR(5000)
    );
    
CREATE TABLE comentarios(
	cd_comentario 	INT PRIMARY KEY AUTO_INCREMENT,
    nome 			VARCHAR(40),
    comentario 		VARCHAR(500),
    cd_postagem		INT,
    FOREIGN KEY (cd_postagem) REFERENCES postagens(cd_postagem)
    );
    
	#DROP TABLE postagens;
    #DROP TABLE comentarios;
    
    select * from postagens;
    select * from comentarios;
    
    select * from postagens order by cd_postagem desc limit 10;
    
    insert into postagens(titulo, autor, descricao) values 
    ("a", "a", "a"),
    ("s", "s", "s"),
    ("d", "d", "d"),
    ("f", "f", "f"),
    ("1", "", ""),
    ("2", "", ""),
    ("3", "", ""),
    ("4", "", ""),
    ("5", "", ""),
    ("6", "", ""),
    ("7", "", ""),
    ("8", "", ""),
    ("9", "", ""),
    ("10", "", ""),
    ("11", "", "");
    
    
    
    
    
    
    