CREATE DATABASE epoodTsikvasvili;
use epoodTsikvasvili;

CREATE TABLE Category (
idCategory int Primary key identity(1,1), 
CategoryName varchar(25) UNIQUE
);
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
Price decimal(5,2),
FOREIGN KEY (idCategory) REFERENCES Category(idCategory)
);

INSERT INTO Product (ProductName, idCategory, Price)
VALUES ('Coca-Cola', 1, 1.50), ('Pizza', 2, 8.21), ('Juustuburger', 2, 4.29), ('Jäätis', 2, 1.76), ('Tee', 1, 0.60);

CREATE TABLE Sale (
	idSale INT PRIMARY KEY IDENTITY(1,1), 
	idProduct INT, 
	FOREIGN KEY (idProduct) REFERENCES Product(idProduct),
	idCustomer INT, 
	Count_ INT, 
	DateOfSale DATE,
);

--Kustuta kõik kirjad
DELETE FROM Sale;

CREATE TABLE Customer (
    idCustomer INT PRIMARY KEY IDENTITY(1,1),
    Name_ VARCHAR(30),
    Contact TEXT,
);

--Tabeli struktuuri muutmine --> FK lisamine
ALTER TABLE Sale ADD FOREIGN KEY (idCustomer) REFERENCES Customer(idCustomer);

SELECT * FROM Product;
SELECT * FROM Category;
SELECT * FROM Sale;
SELECT * FROM Customer;
