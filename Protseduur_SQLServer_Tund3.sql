CREATE DATABASE proteduurTsikvasvili;

USE proteduurTsikvasvili;
CREATE TABLE linn(
linnId int Primary Key identity(1,1),
linnNimi varchar(30),
rahvaArv int
);

SELECT * FROM linn;

INSERT INTO linn(linnNimi,rahvaArv)
VALUES ('Tallinn',60000),('Tartu',34500),('Narva',29000);

--Protseduuri loomine
--protseduur, mis lisab uus linn ja kohe näitab tabelis
CREATE PROCEDURE lisaLinn
@lnimi varchar(30),
@rArv int
AS
BEGIN
INSERT INTO linn(linnNimi,rahvaArv)
VALUES (@lnimi,@rArv)
SELECT * FROM linn;
END;

--protseduuri kutse
EXEC lisaLinn 'Tartu', 1256

--protseduur, mis kustutab linnid järgi
CREATE PROCEDURE kustutaLinn
@deleteId int
AS
BEGIN
SELECT * FROM linn; --enne
DELETE FROM linn WHERE linnId=@deleteId
SELECT * FROM linn; --pärast
END;

EXEC kustutaLinn 4;

--protseduuri kustutamine
DROP PROCEDURE kustutaLinn;

--proseduur, mis otsib linn esimese tähte järgi
CREATE PROCEDURE linnaOtsing
@taht char(1)
AS
BEGIN
SELECT * FROM linn
WHERE linnNimi LIKE @taht + '%'
--% - kõik teised tähed
END;

EXEC linnaOtsing T;

--Tabeli uuendamine - kasvab 10% võrra
UPDATE linn SET rahvaArv*=1.1; 

UPDATE linn SET rahvaArv*=1.1
WHERE linnId=3;

CREATE PROCEDURE rahvaArvuUuendus
@linnId int,
@koef decimal(2,1)
AS
BEGIN
SELECT * FROM linn;
UPDATE linn SET rahvaArv*=@koef
WHERE linnId=@linnId;
SELECT * FROM linn;
END;

EXEC rahvaArvuUuendus 1, 2.3;
