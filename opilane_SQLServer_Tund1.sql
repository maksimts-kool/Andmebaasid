--AB loomine
Create database TsikvasviliBaas;
use TsikvasviliBaas
Create Table opilane(
opilaneId int primary key identity(1,1),
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
synniaeg date,
stip bit,
aadress text,
keskhind decimal(2,1)
)
select * from opilane;
--Andmete lisamine tabelisse
Insert into opilane(
eesnimi,
perenimi,
synniaeg,
stip,
keskhind
)
Values(
'OpilaneD',
'4',
'2007-03-10',
1,
5
),
(
'OpilaneA',
'1',
'2009-09-09',
1,
3.5
),
(
'OpilaneB',
'2',
'2007-02-11',
0,
3.0
),
(
'OpilaneC',
'3',
'2009-11-06',
1,
3.0
),
(
'Maksim',
'Tsikvasvili',
'2008-06-15',
1,
4.5
)

--Tabeli kustutamine
drop table opilane;
--Rida kustutamine, kus on opilaneId = 5
delete from opilane where opilaneId=5;

--Andmete uuendamine
update opilane set aadress='Tartu'
where opilaneId=3

CREATE TABLE Language
(
ID int NOT NULL PRIMARY KEY,
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bit,
Percentage smallint
); 
select * from Language;

insert into Language(ID,Code,Language)
values (4,'DEU','saksa')

create table keeleValik(
keeleValikud int primary key identity(1,1),
valikuNimetus varchar(10) not null,
opilaneId int,
foreign key (opilaneId) references opilane(opilaneId),
Language int,
foreign key (Language) references Language(ID)
)
select * from keeleValik;
select * from Language;
select * from opilane;
insert into keeleValik(valikuNimetus,opilaneId,Language)
values ('Valik B',2,3)

-------------------- PROCEDURES ------------------
CREATE PROCEDURE lisaOpilane
@eesnimi varchar(25),
@perenimi varchar(25),
@synniaeg date,
@stip bit,
@aadress text,
@keskhind decimal(2,1)
AS
BEGIN
INSERT INTO opilane(eesnimi,perenimi,synniaeg,stip,aadress,keskhind)
VALUES (@eesnimi,@perenimi,@synniaeg,@stip,@aadress,@keskhind)
SELECT * FROM opilane;
END;

EXEC lisaOpilane 'Some','Thing','2004-07-21',1,'Tallinn',2.3;
EXEC lisaOpilane 'Come','Thin','2001-08-11',1,'Tallinn',4.5;

CREATE PROCEDURE kustutaOpilane
@deleteId int
AS
BEGIN
DELETE FROM opilane WHERE opilaneId=@deleteId;
SELECT * FROM opilane;
END;

EXEC kustutaOpilane 1;

CREATE PROCEDURE otsiOpilane
@taht CHAR(1)
AS
BEGIN
SELECT * FROM opilane
WHERE eesnimi LIKE @taht + '%';
END;

EXEC otsiOpilane 'C';

CREATE PROCEDURE OpilaneStipMuuda
@id INT,
@uusstip BIT
AS
BEGIN
SELECT * FROM opilane;
UPDATE opilane SET stip=@uusstip
WHERE opilaneId=@id;
SELECT * FROM opilane;
END;

EXEC OpilaneStipMuuda 2,0;
