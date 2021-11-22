SHOW DATABASES;
USE BIBLIOTECA;
SHOW TABLES;
CREATE TABLE AUTOR (
    CodAutor INTEGER NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(50),
    PRIMARY KEY PK_AUTOR (CodAutor)
);
SHOW TABLES;

CREATE TABLE EDITORA (
	CodEditora INTEGER NOT NULL AUTO_INCREMENT,
	Nome VARCHAR(50),
	PRIMARY KEY PK_EDITORA(CodEditora)
);
SHOW TABLES;

CREATE TABLE ACERVO (
	CodAcervo INTEGER NOT NULL AUTO_INCREMENT,
	CodISBN INTEGER,
	Titulo VARCHAR(100),
	PrazoEntrega SMALLINT,
	QtdeEmprestimo SMALLINT,
	VlrMulta NUMERIC(8,2),
	LocalEdicao VARCHAR(50),
	DtEdicao DATE,
	CodEditora INTEGER,
	PRIMARY KEY PK_ACERVO(CodAcervo),
	FOREIGN KEY FK_EDITORA(CodEditora) REFERENCES Editora(CodEditora) ON DELETE RESTRICT
);
SHOW TABLES;

CREATE TABLE AUTORIA (
	CodAcervo INTEGER NOT NULL,
	CodAutor INTEGER NOT NULL,
	PRIMARY KEY PK_AUTORIA(CodAcervo, CodAutor),
	FOREIGN KEY FK_ACERVO(CodAcervo) REFERENCES Acervo(CodAcervo) ON DELETE CASCADE,
	FOREIGN KEY FK_AUTOR(CodAutor) REFERENCES Autor(CodAutor) ON DELETE CASCADE
);
DESCRIBE ACERVO;

DROP TABLE AUTORIA;
SHOW TABLES;

ALTER TABLE AUTOR ADD EMAIL VARCHAR(100);
ALTER TABLE AUTOR DROP EMAIL;
DESCRIBE AUTOR;

CREATE TABLE AUTORIA (
	CodAcervo INTEGER NOT NULL,
	CodAutor INTEGER NOT NULL
);
ALTER TABLE AUTORIA ADD PRIMARY KEY PK_AUTORIA(CodAcervo, CodAutor);
ALTER TABLE AUTORIA ADD FOREIGN KEY FK_ACERVO(CodAcervo) REFERENCES ACERVO(CodAcervo) ON DELETE CASCADE;