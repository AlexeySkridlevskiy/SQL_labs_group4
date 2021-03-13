USE abiturient;

CREATE TABLE Abiturient(
  ID int NOT NULL,
  Surname nvarchar(50) NOT NULL,
  Name nvarchar(50) NOT NULL,
  Patronymic nvarchar(50) NOT NULL,
  Gender nvarchar(10) NOT NULL,
  Nationality nvarchar(50) NOT NULL,
  Birthday date NOT NULL,
  Postcode nchar(8) NOT NULL,
  Country nvarchar(56) NOT NULL,
  Region nvarchar(50) NOT NULL,
  Area nvarchar(50) NOT NULL,
  City nvarchar(10) NOT NULL,
  Street nvarchar(50) NOT NULL,
  House nchar(7) NOT NULL,
  Apartment nchar(6) NULL,
  Marks int NOT NULL,
  PassingScore int NOT NULL
);

ALTER TABLE Abiturient
ADD UniversityID int NOT NULL;

ALTER TABLE Abiturient
ADD PRIMARY KEY (UniversityID);

INSERT INTO Abiturient (ID,Surname,Name,Patronymic,Gender,Nationality,
Birthday,Postcode,Country,Region,Area,City,Street,House,Apartment,Marks,PassingScore, UniversityID)
VALUES
(1,'Яхимович','Егор','Александрович','Мужской','беларус','2002-06-10','222417','Беларусь',
'Минская','Вилейский','Вилейка','Незалежности',2,7,309,281,1),
(2,'Скридлевский','Алексей','Александрович','Мужской','беларус','2002-06-08','223610','Беларусь',
'Минская','Слуцкий','Слуцк','Советская',90,NULL,283, 210,3);

SELECT Surname,Name,Patronymic,PassingScore FROM Abiturient WHERE PassingScore > 225;

CREATE TABLE University(
  ID INT PRIMARY KEY,
  Name nvarchar(100) NOT NULL,
  Description nvarchar(200)
);

INSERT INTO University(ID, Name, Description)
VALUES
(1, 'БГУ', 'Белорусский государственный университет'),
(2, 'БГУИР','Белорусский государственный университет информатики и радиоэлектроники'),
(3, 'БНТУ', 'Белорусский национальный технический университет'),
(4, 'БГЭУ', 'Белорусский государственный экономический университет');

SELECT all* from Abiturient;
SELECT Abiturient.ID,Abiturient.Surname,Abiturient.Name,Abiturient.Patronymic,Abiturient.Birthday,University.Name
FROM Abiturient INNER JOIN University
ON Abiturient.UniversityID = University.ID;
SELECT count(*) Abiturient_count FROM Abiturient WHERE PassingScore > 250;

SELECT SUM(Marks) SUM_Marks
FROM Abiturient;

SELECT MIN(Marks) Minimum FROM Abiturient WHERE Gender = 'Мужской';
SELECT MAX(Marks) Maximum FROM Abiturient WHERE Gender = 'Мужской';

SELECT Abiturient.ID, Abiturient.Surname, Abiturient.Name  
FROM Abiturient INNER JOIN University
ON Abiturient.UniversityID = University.ID where Abiturient.UniversityID = 3;