/* MODELAGEM ALUNO-CURSO */

CREATE DATABASE CURSOIDIOMAS;

USE CURSOIDIOMAS;

CREATE TABLE ALUNO (
ID_ALUNO INT PRIMARY KEY AUTO_INCREMENT,
NOME_ALUNO VARCHAR(45),
BAIRRO_ALUNO VARCHAR(45));

CREATE TABLE CURSO (
ID_CURSO INT PRIMARY KEY AUTO_INCREMENT,
NOME_CURSO VARCHAR(45),
NOME_COORDENADOR VARCHAR(45));

CREATE TABLE ALUNO_E_CURSO (
ID_ALUNO_E_CURSO INT PRIMARY KEY AUTO_INCREMENT,
FK_ALUNO INT,
FK_CURSO INT,
MEDIA_CURSO DECIMAL(2.1),
NOTA_ALUNO DECIMAL(2.1),
DATA_INSCRIÇÃO DATE,
FOREIGN KEY(FK_ALUNO) REFERENCES ALUNO(ID_ALUNO),
FOREIGN KEY(FK_CURSO) REFERENCES CURSO(ID_CURSO));

INSERT INTO ALUNO (NOME_ALUNO, BAIRRO_ALUNO)
VALUES
("HANNA","LARANJEIRAS"),
("DON","BELA VISTA"),
("EUSTÁQUIO","CURICICA"),
("MARCELA","VILA MARIANA"),
("BRANDO","ALPHAVILLE");

INSERT INTO CURSO (NOME_CURSO, NOME_COORDENADOR)
VALUES
("INGLÊS","THOMAS"),
("FRANCÊS","PIERRE"),
("VALIRIANO","VARYS"),
("ALEMÃO","FRITZ"),
("RUSSO","KRON"),
("JAPONÊS","CINDY");

INSERT INTO ALUNO_E_CURSO (FK_ALUNO, FK_CURSO, MEDIA_CURSO, NOTA_ALUNO, DATA_INSCRIÇÃO)
VALUES
(1,5,7.0,9.0,'2018-10-11'),
(2,3,6.0,5.0,'2019-01-10'),
(3,2,9.0,10.0,'2015-05-20'),
(4,1,7.5,8.0,'2020-08-29'),
(5,2,9.0,0.0,'2012-12-21');

SELECT * FROM ALUNO;
SELECT * FROM CURSO;
SELECT * FROM ALUNO_E_CURSO;

SELECT * FROM ALUNO_E_CURSO
JOIN CURSO ON (FK_CURSO = ID_CURSO)
JOIN ALUNO ON (FK_ALUNO = ID_ALUNO);

SELECT ALUNO.NOME_ALUNO, CURSO.NOME_CURSO FROM ALUNO_E_CURSO
JOIN CURSO ON (FK_CURSO = ID_CURSO)
JOIN ALUNO ON (FK_ALUNO = ID_ALUNO);

SELECT ALUNO.*, CURSO.* FROM ALUNO_E_CURSO
JOIN CURSO ON (FK_CURSO = ID_CURSO)
JOIN ALUNO ON (FK_ALUNO = ID_ALUNO)
WHERE NOME_CURSO = 'INGLÊS';

SELECT ALUNO.*, CURSO.* FROM ALUNO_E_CURSO
JOIN CURSO ON (FK_CURSO = ID_CURSO)
JOIN ALUNO ON (FK_ALUNO = ID_ALUNO)
WHERE NOME_ALUNO = 'DON';

SELECT SUM(MEDIA_CURSO) FROM ALUNO_E_CURSO;
SELECT AVG(MEDIA_CURSO) FROM ALUNO_E_CURSO;

SELECT MAX(MEDIA_CURSO), MIN(MEDIA_CURSO) FROM ALUNO_E_CURSO
JOIN CURSO ON (FK_CURSO = ID_CURSO)
JOIN ALUNO ON (FK_ALUNO = ID_ALUNO);

SELECT NOME_CURSO, MAX(MEDIA_CURSO), MIN(MEDIA_CURSO) FROM ALUNO_E_CURSO
JOIN CURSO ON (FK_CURSO = ID_CURSO)
JOIN ALUNO ON (FK_ALUNO = ID_ALUNO)
GROUP BY NOME_CURSO;

SELECT NOME_ALUNO, MAX(MEDIA_CURSO), MIN(MEDIA_CURSO) FROM ALUNO_E_CURSO
JOIN CURSO ON (FK_CURSO = ID_CURSO)
JOIN ALUNO ON (FK_ALUNO = ID_ALUNO)
GROUP BY NOME_ALUNO;

SELECT distinct(AVG(MEDIA_CURSO)) FROM ALUNO_E_CURSO;

SELECT COUNT(MEDIA_CURSO) FROM ALUNO_E_CURSO;

SELECT DISTINCT(COUNT(MEDIA_CURSO)) FROM ALUNO_E_CURSO;









