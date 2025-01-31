CREATE TABLE opilane(
    opilaneId INT PRIMARY KEY AUTO_INCREMENT,
    eesnimi VARCHAR(25) NOT NULL,
    perenimi VARCHAR(25) NOT NULL,
    synniaeg DATE,
    stip BIT,
    aadress TEXT,
    keskhind DECIMAL(2, 1)
);

INSERT INTO opilane(
    eesnimi,
    perenimi,
    synniaeg,
    stip,
    keskhind
)
VALUES('OpilaneA', '1', '2007-03-10', 1, 5),
('OpilaneB', '2', '2010-09-09', 1, 3.5),
('OpilaneC', '3', '2005-02-02', 0, 4),
('OpilaneD', '4', '2009-06-31', 1, 4.5),
('OpilaneE', '5', '2008-12-13', 0, 2.5);

--Tabeli kustutamine
drop table opilane;
--Rida kustutamine, kus on opilaneId = 5
delete from opilane where opilaneId=5;
--Andmete uuendamine
update opilane set aadress='Tartu'
where opilaneId=3

CREATE TABLE LANGUAGE(
    ID INT NOT NULL PRIMARY KEY,
    CODE CHAR(3) NOT NULL,
    LANGUAGE VARCHAR(50) NOT NULL,
    IsOfficial BIT,
    Percentage SMALLINT
); 

INSERT INTO LANGUAGE(ID, CODE, LANGUAGE)
VALUES(1, 'EST', 'eesti'),(2, 'RUS', 'vene'),(3, 'ENG', 'inglise'),(4, 'DEU', 'saksa')

CREATE TABLE keeleValik(
    keeleValikud INT PRIMARY KEY AUTO_INCREMENT,
    valikuNimetus VARCHAR(10) NOT NULL,
    opilaneId INT,
    FOREIGN KEY(opilaneId) REFERENCES opilane(opilaneId),
    LANGUAGE INT,
    FOREIGN KEY(LANGUAGE) REFERENCES LANGUAGE(ID)
);

INSERT INTO keeleValik(valikuNimetus, opilaneId,LANGUAGE)
VALUES('Valik A', 1, 1),('Valik B', 3, 2),('Valik C', 2, 3),('Valik D', 4, 4);


