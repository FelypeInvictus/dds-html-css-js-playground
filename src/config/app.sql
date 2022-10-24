CREATE DATABASE dds311;

USE dds311;

CREATE TABLE `contatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `assunto` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  PRIMARY KEY (`id`)
)

INSERT INTO `contatos` VALUES (1,'Felype Rangel','felype.invictus@gmail.com','Elogios','Nada aqui'),(2,'Mr.Nobody','mr.nobody@gmail.com','critica','Isso aqui ? um teste... Bem-vindo ao meu mundo, meu caro amigo!'),(3,'Jos?','jos?@gmail.com','critica','Por gentileza, voc? poderia adicionar mais coisas no site?'),(4,'Karine','karine@gmail.com','Elogio','Adorei o site, excelentes conte?dos ;)'),(5,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(6,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(7,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(8,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(9,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(10,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(11,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(12,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(13,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(14,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(15,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(16,'Sr.Teste','teste@gmail.com','Critica','Não use o Windows!'),(17,'Sr.Mister two','teste@gmail.com','Critica','Sou um personagem');

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `preco` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
)

CREATE TABLE IF NOT EXISTS `usuarios` (   
    `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,    
    `nome` varchar(50) DEFAULT NULL,   
    `email` varchar(50) NOT NULL,   
    `perfil` enum('admin','professor','aluno') 
    NOT NULL DEFAULT 'aluno',   
    `senha` varchar(255) NOT NULL,   
    `ativo` tinyint(1) DEFAULT '1'   
    ) ;

INSERT INTO usuarios (nome, email, perfil, senha, ativo ) VALUES ("Felype Rangel","felype@gmail.com","admin","33", 1);

ALTER TABLE usuarios
ADD COLUMN perfil_id INT NOT NULL AFTER email;
-- CONSTRAINT fk_usuario_perfil_id
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

-- ALTER TABLE `perfis`
-- 	DROP FOREIGN KEY `sql-2e98_c_ibfk_1`;

-- INSERT INTO perfis (nomes) VALUES ("admin","professor","aluno");

-- UPDATE usuarios SET perfil_id = 1 WHERE id =1;

-- SELECT u.id , u.nome, p.nome FROM usuarios u
-- INNER JOIN perfis p
-- ON u.perfil_id = p.id;

-- ALTER TABLE usuarios
-- DROP COLUMN perfis;
