CREATE DATABASE atv_lab02

USE atv_lab02

CREATE TABLE TB_FUNCIONARIO(
	MATRICULA			INT				NOT NULL		PRIMARY KEY,
	NM_FUNCIONARIO		VARCHAR(50)		NOT NULL,
	CPF					VARCHAR(20)		NOT NULL,
	DT_ADMISSAO			DATETIME		NOT NULL,
)

--------------------------------------------------------

CREATE TABLE TB_PRODUTO(
	CD_PRODUTO			INT				NOT NULL		PRIMARY KEY,
	DS_PRODUTO			VARCHAR(50)		NOT NULL,
	CATEGORIA			VARCHAR(20)		NOT NULL		CHECK(CATEGORIA IN ('Alimento', 'Perfumaria', 'Brinquedos')),
	VALOR_ATUAL			FLOAT			NOT NULL,
)

--------------------------------------------------------

CREATE TABLE TB_VENDAS(
	CD_VENDA			INT				NOT NULL,
	MATRICULA			INT				NOT NULL		REFERENCES TB_FUNCIONARIO,
	CD_PRODUTO			INT				NOT NULL		REFERENCES TB_PRODUTO,
	QUANTIDADE			INT				NOT NULL,
	VALOR_UNITARIO		FLOAT			NOT NULL,
	DT_VENDA			DATETIME		NOT NULL,
	PRIMARY KEY(CD_VENDA, MATRICULA, CD_PRODUTO)
)

--------------------------------------------------------

INSERT INTO TB_FUNCIONARIO
VALUES(1, 'JOSÉ', '011.222.333-44', '20230323'),
	  (2, 'CAIO', '022.333.444-55', '20230323'),
	  (3, 'BRAD', '033.444.555-66', '20230323')

SELECT * FROM TB_FUNCIONARIO

--------------------------------------------------------

INSERT INTO TB_PRODUTO
VALUES(1, 'BONO', 'Alimento', 6.00),
	  (2, 'AVON', 'Perfume', 30.00),
	  (3, 'MAX STEEL', 'Brinquedo', 140.00),
	  (4, 'CHOCOLATE', 'Alimento', 6.00)

SELECT * FROM TB_PRODUTO

--------------------------------------------------------

