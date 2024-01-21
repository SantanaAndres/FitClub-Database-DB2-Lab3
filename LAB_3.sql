CREATE DATABASE LAB_3_FITCLUB;

USE LAB_3_FITCLUB;

DROP DATABASE LAB_3_FITCLUB;

-- 1

CREATE TABLE SOCIOS 
(
	CEDULA CHAR(13) 
		CONSTRAINT PK_SOCIOS PRIMARY KEY
		CONSTRAINT CK_SOCIOS_CEDULA CHECK
			(
				CEDULA like '[0][1-9][-][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9][0-9]'
			or  
				CEDULA like '[1][0-3][-][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9][0-9]'
			),
	NUM_SOCIO INT IDENTITY NOT NULL
		CONSTRAINT UK_PHONE_SOCIO UNIQUE,
	NOMBRE VARCHAR(50),
	NOMBRE_DOMICILIO VARCHAR(200)
);

CREATE TABLE INSTRUCTOR 
(
	CEDULA CHAR(13)
		CONSTRAINT PK_INSTRUCTOR PRIMARY KEY
		CONSTRAINT CK_INSTRUCTOR_CEDULA CHECK
			(
				CEDULA like '[0][1-9][-][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9][0-9]'
			or  
				CEDULA like '[1][0-3][-][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9][0-9][0-9]'
			),
	NOMBRE VARCHAR(30),
	DOMICILIO VARCHAR(200)
);

CREATE TABLE CATEGORIA
(
	COD_CATEGORIA INT 
		CONSTRAINT PK_CATEGORIA PRIMARY KEY,
	NOMBRE VARCHAR(15)
		CONSTRAINT CK_NOMBRE_CATEGORIA CHECK
		(
			NOMBRE IN ('maquina', 'baile', 'speeding', 'pesas')
		),
	DIA_SEMANA VARCHAR(15)
		CONSTRAINT CK_DIA_SEMANA CHECK
		(
			DIA_SEMANA IN ('lunes', 'martes', 'mi�rcoles', 'jueves', 'viernes', 's�bado')
		)
			DEFAULT 's�bado',
	CEDULA CHAR(13)
		CONSTRAINT FK_CATEGORIA_CEDULA FOREIGN KEY
		REFERENCES INSTRUCTOR(CEDULA) ON DELETE SET NULL
		DEFAULT NULL
);

CREATE TABLE INSCRIPCION
(
	CEDULA_SOCIO CHAR(13)
		CONSTRAINT FK_INSCRIPCION_CEDULA FOREIGN KEY
		REFERENCES SOCIOS(CEDULA) ON DELETE CASCADE,
	COD_CATEGORIA INT
	CONSTRAINT FK_INSCRIPCION_CATEGORIA FOREIGN KEY
		REFERENCES CATEGORIA(COD_CATEGORIA) ON DELETE CASCADE,
	MATRICULA CHAR(1) DEFAULT 'n'
		CONSTRAINT CK_MATRICULA_INSCRIPCION CHECK
		(
			MATRICULA IN ('s','n')
		),
	MONTO_PAGAR FLOAT
		CONSTRAINT CK_MONTO_PAGAR CHECK
		(
			MONTO_PAGAR > 0
		)
	CONSTRAINT PK_INSCRIPCION PRIMARY KEY(CEDULA_SOCIO, COD_CATEGORIA)
);

-- 2
-- Insert 1
INSERT INTO SOCIOS (CEDULA, NOMBRE,NOMBRE_DOMICILIO) VALUES ('08-0987-09876', 'Andr�s Ara�z', 'Avenida 111');

-- Insert 2
-- No se insertar� debido a la violaci�n de la restricci�n CHECK
INSERT INTO SOCIOS (CEDULA, NOMBRE,NOMBRE_DOMICILIO) VALUES ('9-76-6554', 'Bertina Bustamante', 'Balboa 222');

-- Insert 3
INSERT INTO SOCIOS (CEDULA, NOMBRE,NOMBRE_DOMICILIO) VALUES ('07-0987-98769', 'Carlos Camarena', 'Colon 333');

-- Insert 4
INSERT INTO SOCIOS (CEDULA, NOMBRE,NOMBRE_DOMICILIO) VALUES ('08-1111-22222', 'Luis Cort�s', 'Vila Lucre');

-- Insert 5
INSERT INTO SOCIOS (CEDULA, NOMBRE,NOMBRE_DOMICILIO) VALUES ('09-7777-00023', 'Pedro Ja�n', 'Don Bosco');

-- Insert 6
INSERT INTO SOCIOS (CEDULA, NOMBRE, NOMBRE_DOMICILIO) VALUES ('08-9999-34343', 'Rosa Filos', 'La Castellana');


-- 3

-- Insert 1
INSERT INTO INSTRUCTOR (CEDULA, NOMBRE, DOMICILIO) VALUES ('08-0775-02222', 'Ana L�pez', 'Paical 2345');

-- Insert 2
INSERT INTO INSTRUCTOR (CEDULA, NOMBRE, DOMICILIO) VALUES ('04-9555-98989', 'Lorenzo Gonz�lez', 'San Miguelito 4');

-- Insert 3
INSERT INTO INSTRUCTOR (CEDULA, NOMBRE, DOMICILIO) VALUES ('07-3333-12345', 'Ernesto Arosemena', 'San Antonio');

SELECT * FROM INSTRUCTOR;


-- 4
-- Insert 1
INSERT INTO CATEGORIA (COD_CATEGORIA, NOMBRE, DIA_SEMANA, CEDULA) VALUES (1, 'maquina', 'lunes', '07-3333-12345');

-- Insert 2
INSERT INTO CATEGORIA (COD_CATEGORIA, NOMBRE, CEDULA) VALUES (2, 'Baile', '08-0775-02222');

-- Insert 3
INSERT INTO CATEGORIA (COD_CATEGORIA, NOMBRE, DIA_SEMANA, CEDULA) VALUES (3, 'speeding', 'mi�rcoles', '04-9555-98989');

-- Insert 4
INSERT INTO CATEGORIA (COD_CATEGORIA, NOMBRE, DIA_SEMANA, CEDULA) VALUES (4, 'pesas', 'viernes', '07-3333-12345');


-- 5

-- Insert 1
-- No se insertar� debido a la violaci�n de la restricci�n CHECK
--INSERT INTO INSCRIPCION  VALUES ('08-0987-09876', 1, 's', 0);

-- Insert 2
-- No se insertar� debido a la violaci�n de la restricci�n CHECK
-- INSERT INTO INSCRIPCION (CEDULA_SOCIO, COD_CATEGORIA, MATRICULA, MONTO_PAGAR) VALUES ('09-0076-06554', 1, 'n', -15);

-- Insert 3
-- No se insertar� debido a la violaci�n de la restricci�n CHECK
INSERT INTO INSCRIPCION (CEDULA_SOCIO, COD_CATEGORIA, MATRICULA, MONTO_PAGAR) VALUES ('07-0987-98769', 2, 'r', 100);

-- Insert 4
INSERT INTO INSCRIPCION (CEDULA_SOCIO, COD_CATEGORIA, MATRICULA, MONTO_PAGAR) VALUES ('08-1111-22222', 4, 's', 150);

-- Insert 5
INSERT INTO INSCRIPCION (CEDULA_SOCIO, COD_CATEGORIA, MATRICULA, MONTO_PAGAR) VALUES ('09-7777-00023', 3, 's', 75);

-- Insert 6
INSERT INTO INSCRIPCION (CEDULA_SOCIO, COD_CATEGORIA, MATRICULA, MONTO_PAGAR) VALUES ('07-0987-98769', 1, 'n', 35);

-- Insert 7
INSERT INTO INSCRIPCION (CEDULA_SOCIO, COD_CATEGORIA, MATRICULA, MONTO_PAGAR) VALUES ('08-0987-09876', 2, 's', 100);

-- Insert 8
-- No existe esa cedula
INSERT INTO INSCRIPCION (CEDULA_SOCIO, COD_CATEGORIA, MATRICULA, MONTO_PAGAR) VALUES ('03-0096-00344', 1, 's', 150);

-- Insert 9
-- No existe categoria 5
INSERT INTO INSCRIPCION (CEDULA_SOCIO, COD_CATEGORIA, MATRICULA, MONTO_PAGAR) VALUES ('07-0987-98769', 5, 's', 100);

-- Insert 10
INSERT INTO INSCRIPCION (CEDULA_SOCIO, COD_CATEGORIA, MATRICULA, MONTO_PAGAR) VALUES ('08-0987-09876', 1, 's', 145);


-- 6 
SELECT * FROM INSTRUCTOR;
SELECT * FROM CATEGORIA;

DELETE FROM INSTRUCTOR
	WHERE CEDULA = '04-9555-98989';


INSERT INTO INSTRUCTOR VALUES(
		'03-3333-33333',
		'Carlos G�mez',
		'Villa Ver�nica'
);

UPDATE CATEGORIA 
	SET CEDULA='03-3333-33333'
	WHERE COD_CATEGORIA=3

SELECT * FROM CATEGORIA;


-- 7
DELETE FROM SOCIOS
	WHERE CEDULA='08-0987-09876';

SELECT * FROM SOCIOS;

SELECT * FROM INSCRIPCION;
