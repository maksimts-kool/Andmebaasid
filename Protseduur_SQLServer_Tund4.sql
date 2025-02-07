CREATE DATABASE proteduurTsikvasvili;

USE proteduurTsikvasvili;

CREATE TABLE linn(
linnId int Primary Key identity(1,1),
linnNimi varchar(30),
rahvaArv int
);

SELECT * FROM linn;

INSERT INTO linn(linnNimi,rahvaArv)
VALUES ('Tallinn',60000),('Tartu',34500),('Narva',29000),('Pärnu',33000);

ALTER TABLE linn ADD test int;

ALTER TABLE linn DROP COLUMN test;

CREATE PROCEDURE veeruLisaKustuta
@valik varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20)=null
AS
BEGIN
DECLARE @sqltegevus as varchar(max)
SET @sqltegevus=case
WHEN @valik='add' THEN CONCAT('ALTER TABLE linn ADD ', @veerunimi, ' ', @tyyp)
WHEN @valik='drop' THEN CONCAT('ALTER TABLE linn DROP COLUMN ', @veerunimi)
END;

PRINT @sqltegevus;
BEGIN
EXEC (@sqltegevus);
END
END;

--KUTSE
EXEC veeruLisaKustuta @valik='add',@veerunimi='test3',@tyyp='int';

EXEC veeruLisaKustuta @valik='drop',@veerunimi='test3';

CREATE PROCEDURE veeruLisaKustutaTabelis
@valik varchar(20),
@tabelinimi varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20)=null
AS
BEGIN
DECLARE @sqltegevus as varchar(max)
SET @sqltegevus=case
WHEN @valik='add' THEN CONCAT('ALTER TABLE ',@tabelinimi,' ADD ', @veerunimi, ' ', @tyyp)
WHEN @valik='drop' THEN CONCAT('ALTER TABLE ',@tabelinimi,' DROP COLUMN ', @veerunimi)
END;
PRINT @sqltegevus;
BEGIN
EXEC (@sqltegevus);
END
END;

EXEC veeruLisaKustutaTabelis @tabelinimi='linn',@valik='add',@veerunimi='test3',@tyyp='int';

EXEC veeruLisaKustutaTabelis @tabelinimi='linn',@valik='drop',@veerunimi='test3';

--protseduur tingimusega
CREATE PROCEDURE rahvaHinnang
@piir int
AS
BEGIN
SELECT linnNimi, rahvaArv, IIF(rahvaArv<@piir,'Väike linn','Suur linn') AS Hinnang
FROM linn;
END;

DROP PROCEDURE rahvaHinnang;
EXEC rahvaHinnang 30000;

--Agregaat funktsioonid: SUM(), AVG(), MIN(), MAX(), COUNT()
CREATE PROCEDURE kokkuRahvaArv
AS
BEGIN
SELECT SUM(rahvaArv) AS 'kokku rahvaArv', AVG(rahvaArv) AS 'keskmine rahvaArv', COUNT(*) AS 'linnade Arv'
FROM linn;
END;

DROP PROCEDURE kokkuRahvaArv;
EXEC kokkuRahvaArv;
