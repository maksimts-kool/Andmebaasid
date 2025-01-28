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
