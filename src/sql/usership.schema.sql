DROP SCHEMA IF EXISTS Usership CASCADE;

CREATE SCHEMA IF NOT EXISTS Usership;

-- user table
CREATE TABLE Usership.Users(
    userID SERIAL,
    studentID CHAR(5) NOT NULL,
    studentYear CHAR(2) NOT NULL,
    -- php return pwd hash in length of 60
    pwd CHAR(60) NOT NULL,
    -- triple size for ja, 4 char
    jaFName VARCHAR(12) NOT NULL,
    -- triple size for ja, 12 char
    jaLName VARCHAR(36) NOT NULL,
    -- triple size for ja, 30 char
    jaFKana VARCHAR(45) NOT NULL,
    jaLKana VARCHAR(45) NOT NULL,
    enFName VARCHAR(30),
    enLName VARCHAR(30),
    birthDay DATE,
    -- true for male, false for female
    gender BIT(1),
    -- triple size for ja, 100 char
    addr VARCHAR(300),
    -- 4 kinds enum
    kind BIT(2),
    -- graduate year and month, for graduates
    gradMonth DATE,
    phone CHAR(10),
    suica CHAR(20),
    CONSTRAINT PK_User PRIMARY KEY (userID),
    CONSTRAINT UQ_Suica UNIQUE (suica)
    CONSTRAINT UN_Student UNIQUE (studentID, studentYear)
);

-- access control, logging
CREATE TABLE Usership.AccessLog(
    userID INT NOT NULL,
    moment TIMESTAMP NOT NULL,
    CONSTRAINT FK_Access_User FOREIGN KEY (userID) REFERENCES Usership.Users (userID)
);