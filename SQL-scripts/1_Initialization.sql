CREATE DATABASE PetMatchDB;
GO
USE PetMatchDB;
GO

CREATE TABLE Users (
    UserID INT IDENTITY PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(20) NULL,
    Role NVARCHAR(50) NOT NULL CHECK (Role IN ('Adopter', 'Shelter', 'Admin'))
);

CREATE TABLE Shelters (
    ShelterID INT IDENTITY PRIMARY KEY,
    ShelterName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(200) NOT NULL,
    Phone NVARCHAR(20) NULL,
    Email NVARCHAR(100) NULL,
    UserID INT NOT NULL REFERENCES Users(UserID)
);

CREATE TABLE PetCategories (
    CategoryID INT IDENTITY PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL
);

CREATE TABLE Pets (
    PetID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Age INT NULL,
    Breed NVARCHAR(100) NULL,
    Gender NVARCHAR(10) NULL,
    Description NVARCHAR(500) NULL,
    IsAdopted BIT NOT NULL DEFAULT 0,
    CategoryID INT REFERENCES PetCategories(CategoryID),
    ShelterID INT REFERENCES Shelters(ShelterID)
);

CREATE TABLE AdoptionRequests (
    RequestID INT IDENTITY PRIMARY KEY,
    UserID INT REFERENCES Users(UserID),
    PetID INT REFERENCES Pets(PetID),
    RequestDate DATETIME NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(50) NOT NULL CHECK (Status IN ('Pending', 'Approved', 'Rejected'))
);

CREATE TABLE Donations (
    DonationID INT IDENTITY PRIMARY KEY,
    UserID INT REFERENCES Users(UserID),
    ShelterID INT REFERENCES Shelters(ShelterID),
    Amount DECIMAL(10,2) NOT NULL,
    DonationDate DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Volunteers (
    UserID INT REFERENCES Users(UserID),
    ShelterID INT REFERENCES Shelters(ShelterID),
    PRIMARY KEY (UserID, ShelterID)
);
