CREATE DATABASE ExerciseDb
USE ExerciseDb


CREATE TABLE Publisher
(
    PID int primary key,
    PublisherName nvarchar(50) unique NOT NULL
);


insert into Publisher values (1, 'Gupta ji publication');
insert into Publisher values (2, 'Tayal ji publication');
insert into Publisher values (3, 'Aggrawal Publication');


CREATE TABLE Category
(
    CID INT PRIMARY KEY,
    CategoryName NVARCHAR(50) UNIQUE NOT NULL
);

insert into Category  Values  (1, 'Physics');
insert into  Category Values  (2, 'Maths');
insert into  Category Values  (3, 'Chemistry');


CREATE TABLE Author
(
    AID INT PRIMARY KEY,
    AuthorName NVARCHAR(50) UNIQUE NOT NULL
);

insert into Author Values (1, 'Mukesh Aggrawal');
insert into Author Values (2, 'Anchal Tripathi');
insert into Author Values (3, 'Virat Kholi');


CREATE TABLE Book (
    BID INT PRIMARY KEY,
    BName NVARCHAR(50) NOT NULL,
    BPrice DECIMAL(10, 2) NOT NULL,
    Author INT,
    Publisher INT,
    Category INT,
    FOREIGN KEY (Author) REFERENCES Author(AID),
    FOREIGN KEY (Publisher) REFERENCES Publisher(PID),
    FOREIGN KEY (Category) REFERENCES Category(CID)
);


insert into Book   Values(1, 'Nootan', 12.99, 1, 1, 1);
insert into Book   Values(2, 'RD Sharma', 19.99, 2, 2, 2);
insert into Book   Values (3, 'Pradeep Sharma', 15.99, 3, 3, 2);


SELECT B.BID, B.BName, B.BPrice, A.AuthorName, P.PublisherName, C.CategoryName
FROM Book AS B
JOIN Author AS A ON B.Author = A.AID
JOIN Publisher AS P ON B.Publisher = P.PID
JOIN Category AS C ON B.Category = C.CID;