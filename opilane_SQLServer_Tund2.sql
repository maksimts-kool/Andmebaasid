CREATE DATABASE epoodTsikvasvili;
use epoodTsikvasvili;

CREATE TABLE Category (
idCategory int Primary key identity(1,1), 
CategoryName varchar(25) UNIQUE
);
SELECT * FROM Category;
INSERT INTO Category (CategoryName)
VALUES ('Jook'), ('Söök');

--Tabeli struktuuri muutmine --> uue vergu lisamine
ALTER TABLE Category ADD test int;
--Tabeli struktuuri muutmine --> vergu kustutamine
ALTER TABLE Category DROP COLUMN test;

CREATE TABLE Product (
idProduct INT PRIMARY KEY IDENTITY(1,1), 
ProductName VARCHAR(25), 
idCategory int, 
Price decimal(3,1),
FOREIGN KEY (idCategory) REFERENCES Category(idCategory)
);

SELECT * FROM Product;
INSERT INTO Product (ProductName, idCategory, Price)
VALUES ('Coca-Cola', 1, 1.50), ('Pizza', 2, 8.00);
