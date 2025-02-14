CREATE DATABASE RetseptiRaamatTsikvasvili;

USE RetseptiRaamatTsikvasvili;

CREATE TABLE kasutaja(
kasutaja_id int Primary Key identity(1,1),
eesNimi varchar(50),
pereNimi varchar(50) not null,
email varchar(150)
);
INSERT INTO kasutaja
VALUES 
('Maksim', 'Ts', 'maksimtsitkool@gmail.com'),
('Maksim2', 'Ts2', 'maksimtsitkool2@gmail.com'),
('Maksim3', 'Ts3', 'maksimtsitkool3@gmail.com'),
('Maksim4', 'Ts4', 'maksimtsitkool4@gmail.com');

select * from kasutaja;

CREATE TABLE kategooria(
kategooria_id int Primary Key identity(1,1),
kategooria_nimi varchar(50)
);
INSERT INTO kategooria
VALUES 
('Lihatooted'), ('Toiduained'), ('Joogid'), ('Piimatooded');

select * from kategooria

CREATE TABLE toiduaine(
toiduaine_id int Primary Key identity(1,1),
toiduaine_nimi varchar(100)
);
INSERT INTO toiduaine
VALUES 
('munad'), ('juust'), ('õlu'), ('vorst'), ('vesi');

CREATE TABLE yhik(
yhik_id int Primary Key identity(1,1),
yhik_nimi varchar(100)
);
INSERT INTO yhik
VALUES 
('ml'), ('tl'), ('sl'), ('l'), ('g'), ('kg');

CREATE TABLE retsept(
retsept_id int Primary Key identity(1,1),
retsepti_nimi varchar(100),
kirjeldus varchar(200),
juhend varchar(500),
sisestatud_kp date,
kasutaja_id int,
foreign key (kasutaja_id) references kasutaja(kasutaja_id),
kategooria_id int,
foreign key (kategooria_id) references kategooria(kategooria_id),
);
INSERT INTO retsept
VALUES 
('Pasta', 'Väga magus', 'Kasuta elektripliit', '2025-02-14', 1, 2),
('Pannkook', 'Pehme', 'Kasuta pannil küpsetamiseks', '2025-02-14', 2, 4),
('Smuuti', 'Värskendav', 'Sega kõik koostisosad mikseris', '2025-02-14', 3, 3),
('Praetud kana', 'Krõbe kana', 'Prae kana pannil', '2025-02-14', 4, 1),
('Salat', 'Tervislik', 'Sega puuviljad', '2025-02-14', 2, 2)

select * from retsept

CREATE TABLE koostis(
koostis_id int Primary Key identity(1,1),
kogus int,
retsept_retsept_id int,
foreign key (retsept_retsept_id) references retsept(retsept_id),
toiduaine_id int,
foreign key (toiduaine_id) references toiduaine(toiduaine_id),
yhik_id int,
foreign key (yhik_id) references yhik(yhik_id)
);
INSERT INTO koostis
VALUES
(120, 1, 2, 5), (300, 2, 1, 5), (200, 3, 3, 1), (1, 4, 4, 6), (100, 5, 5, 3);

CREATE TABLE tehtud(
tehtud_id int Primary Key identity(1,1),
tehtud_kp date,
retsept_id int,
foreign key (retsept_id) references retsept(retsept_id)
);
INSERT INTO tehtud
VALUES 
('2025-02-14', 1), ('2025-01-01', 2), ('2024-05-06', 3), ('2024-09-24', 4), ('2024-12-31', 5)

--Procedures--

CREATE PROCEDURE retseptlisa
@nimi varchar(100),
@kirj varchar(200),
@juh varchar(500),
@kasutaja int,
@kategooria int
AS
BEGIN
INSERT INTO retsept
VALUES 
(@nimi, @kirj, @juh, GETDATE(), @kasutaja, @kategooria);
SELECT * FROM retsept;
END;
EXEC retseptlisa 'Piim','Valge','Looma lehma',1,4;

CREATE PROCEDURE koostislisa
@kogus int,
@retsept_id int,
@toiduaine_id int,
@yhik_id int
AS
BEGIN
INSERT INTO koostis
VALUES 
(@kogus, @retsept_id, @toiduaine_id, @yhik_id);
SELECT * FROM koostis;
END;
EXEC koostislisa 5,1,3,6;

CREATE PROCEDURE tehtudlisa
@tehtud_kp date,
@retsept_id int
AS
BEGIN
INSERT INTO tehtud
VALUES 
(@tehtud_kp, @retsept_id);
SELECT * FROM tehtud;
END;
EXEC tehtudlisa '2025-02-02',1;

CREATE PROCEDURE veeruLisaKustutaTabelis
@valik varchar(20),
@tabelinimi varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20)=null
AS
BEGIN
DECLARE @sqltegevus as varchar(max)
DECLARE @sqlSelect AS varchar(max)
SET @sqlSelect = CONCAT('SELECT * FROM ', @tabelinimi)
SET @sqltegevus=case
WHEN @valik='add' THEN CONCAT('ALTER TABLE ',@tabelinimi,' ADD ', @veerunimi, ' ', @tyyp)
WHEN @valik='drop' THEN CONCAT('ALTER TABLE ',@tabelinimi,' DROP COLUMN ', @veerunimi)
END;
BEGIN
EXEC (@sqltegevus);
EXEC (@sqlSelect);
END
END;
EXEC veeruLisaKustutaTabelis 'add', 'retsept', 'test', 'int';
EXEC veeruLisaKustutaTabelis 'drop', 'retsept', 'test';

--Minu table--

CREATE TABLE pood(
pood_id int Primary Key identity(1,1),
poodNimi varchar(50),
aadress varchar(max),
toiduaine_id int,
foreign key (toiduaine_id) references toiduaine(toiduaine_id)
);
INSERT INTO pood
VALUES 
('Rimi','Sõpruse pst 20',1), 
('Maxima','E.Vilde tee 60',2), 
('Maxima','Õismäe tee 10',3), 
('Prisma','Endla 45',4), 
('Selver','Kopli tn 1',5);

select * from pood

CREATE PROCEDURE poodlisa
@poodnimi varchar(100),
@aadress varchar(300),
@toidu_id int
AS
BEGIN
INSERT INTO pood
VALUES 
(@poodnimi, @aadress, @toidu_id);
SELECT * FROM pood;
END;
EXEC poodlisa 'Prisma','Viru tn 2', 5;

CREATE PROCEDURE poodkustuta
@poodnimi varchar(100),
@aadress varchar(max),
@toidu_id int
AS
BEGIN
DELETE FROM pood 
WHERE poodNimi=@poodnimi 
and aadress=@aadress 
and toiduaine_id=@toidu_id;
SELECT * FROM pood;
END;
EXEC poodkustuta 'Prisma','Viru tn 2', 5;
