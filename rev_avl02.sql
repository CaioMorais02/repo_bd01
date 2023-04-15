CREATE DATABASE rev_avl02

USE rev_avl02

CREATE TABLE TB_PROJETO(
	CD_PROJETO		INT				NOT NULL		PRIMARY KEY,
	NOME			VARCHAR(50)		NOT NULL		UNIQUE,
	AREA			VARCHAR(20)		NOT NULL		CHECK	(AREA IN ('APOIO', 'LOGÍSTICA', 'VENDAS')),
	DESCR			VARCHAR(30)		NOT NULL
)

ALTER TABLE TB_PROJETO ADD CONSTRAINT CK_TB_PROJETO
CHECK (AREA in ('Apoio', 'Logística', 'Vendas'))

CREATE TABLE TB_FASE(
	CD_FASE			INT				NOT NULL		PRIMARY KEY,
	NOME			VARCHAR(50)		NOT NULL,
	DESCR			VARCHAR(30)		NOT NULL,
	CD_PROJETO		INT				NOT NULL		REFERENCES TB_PROJETO
)

CREATE TABLE TB_RECURSO(
	MATRICULA		INT				NOT NULL		PRIMARY KEY,
	NOME			VARCHAR(50)		NOT NULL,
	FUNCAO			VARCHAR(15)		NOT NULL		CHECK	(FUNCAO IN ('Programador', 'Analista', 'Gerente'))
)

CREATE TABLE TB_POSSUI(
	CD_FASE			INT				NOT NULL		REFERENCES TB_FASE,
	MATRICULA		INT				NOT NULL		REFERENCES TB_RECURSO,
	PRIMARY KEY(CD_FASE, MATRICULA)
)

--------------------------------------------------------------------------

INSERT TB_PROJETO
VALUES (1, 'AAA', 'Apoio', 'Salve')

INSERT TB_PROJETO
VALUES (2, 'BBB', 'Logística', 'Quebrada')

INSERT TB_PROJETO
VALUES (3, 'CCC', 'Vendas', 'Tamo junto')

--------------------------------------------------------------------------

INSERT TB_FASE
VALUES (1, 'Green', 'Shalashaska', 1)

INSERT TB_FASE
VALUES (2, 'Hill', 'Ocelot', 2)

INSERT TB_FASE
VALUES (3, 'Zone', 'Meow', 3)

--------------------------------------------------------------------------

INSERT TB_RECURSO
VALUES (1, 'R0', 'Programador')

INSERT TB_RECURSO
VALUES (2, 'R1', 'Analista')

INSERT TB_RECURSO
VALUES (3, 'R2', 'Gerente')

INSERT TB_RECURSO
VALUES (4, 'R3', 'Programador')

--------------------------------------------------------------------------

INSERT TB_POSSUI
VALUES (1, 1)

INSERT TB_POSSUI
VALUES (2, 2)

INSERT TB_POSSUI
VALUES (3, 3)

--------------------------------------------------------------------------

UPDATE TB_PROJETO
SET NOME = 'ZZZ',
	DESCR = 'Etiopia'
WHERE CD_PROJETO = 1

--------------------------------------------------------------------------

SELECT MATRICULA, NOME, FUNCAO
FROM TB_RECURSO
WHERE FUNCAO = 'Analista'

--------------------------------------------------------------------------

SELECT P.CD_PROJETO, P.NOME, F.CD_FASE, F.NOME
FROM TB_PROJETO P INNER JOIN TB_FASE F
	 ON (P.CD_PROJETO = F.CD_PROJETO)

--------------------------------------------------------------------------

SELECT R.MATRICULA, R.NOME
FROM TB_RECURSO R INNER JOIN TB_POSSUI AT
	 ON (R.MATRICULA = AT.MATRICULA)
	 INNER JOIN TB_FASE F
	 ON (AT.CD_FASE = F.CD_FASE)
	 INNER JOIN TB_PROJETO P
	 ON(F.CD_PROJETO = P.CD_PROJETO)
GROUP BY P.NOME, R.MATRICULA, R.NOME
HAVING (P.NOME = 'ZZZ')

--------------------------------------------------------------------------

SELECT R.MATRICULA, R.NOME, PJ.NOME, F.NOME
FROM TB_RECURSO R LEFT OUTER JOIN TB_POSSUI AT
	 ON (R.MATRICULA = AT.CD_FASE)
	 LEFT OUTER JOIN TB_FASE F
	 ON (AT.CD_FASE = F.CD_FASE)
	 LEFT OUTER JOIN TB_PROJETO PJ
	 ON (F.CD_PROJETO = PJ.CD_PROJETO)