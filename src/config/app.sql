
CREATE TABLE IF NOT EXISTS `usuarios` (   
    `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,    
    `nome` varchar(50) DEFAULT NULL,   
    `email` varchar(50) NOT NULL,   
    `perfil` enum('admin','professor','aluno') 
    NOT NULL DEFAULT 'aluno',   
    `senha` varchar(255) NOT NULL,   
    `ativo` tinyint(1) DEFAULT '1'   
    ) ;

ALTER TABLE usuarios
ADD COLUMN perfil_id INT NOT NULL AFTER email;

ALTER TABLE usuarios
ADD CONSTRAINT fk_usuario_perfil_id FOREIGN KEY (perfil_id) REFERENCES perfis (id);

CREATE TABLE IF NOT EXISTS modulos (  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    descricao varchar(50) not null
) COMMENT 'módulos';

CREATE TABLE IF NOT EXISTS telas (  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    descricao varchar(50) not null,
    url varchar(50), 
    modulo_id int not null
) COMMENT 'gestão de telas do sistema';

-- especificando a chave primaria
ALTER TABLE telas 
ADD CONSTRAINT `fk_tela_modulos` 
FOREIGN KEY(modulo_id) 
REFERENCES modulos(id);

CREATE TABLE IF NOT EXISTS modulos_telas (  
    modulo_id int not null, 
    tela_id int not null,
    primary key(modulo_id, tela_id)
) COMMENT 'módulos';

-- não especificando a chave primaria
ALTER TABLE modulos_telas
ADD FOREIGN KEY(modulo_id) REFERENCES modulos(id),
ADD FOREIGN KEY(tela_id) REFERENCES telas(id);


CREATE TABLE IF NOT EXISTS perfis (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) not null
);

CREATE TABLE IF NOT EXISTS perfis_modulos (
    perfil_id INT NOT NULL,
    modulo_id INT NOT NULL,
    PRIMARY KEY (perfil_id, modulo_id)
);

ALTER TABLE perfis_modulos
ADD constraint fk_perfis_modulos_perfil_id Foreign Key (perfil_id) REFERENCES perfis (id),
ADD constraint fk_perfis_modulos_modulo_id Foreign Key (modulo_id) REFERENCES  modulos (id);



INSERT INTO perfis (nomes) VALUES ("admin","professor","aluno");
