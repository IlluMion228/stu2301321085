-- Logs
CREATE TABLE DonationLog (
    LogID INT IDENTITY PRIMARY KEY,
    DonationID INT NOT NULL,
    LogMessage NVARCHAR(255),
    LogDate DATETIME DEFAULT GETDATE()
);


CREATE TRIGGER trg_LogDonation
ON Donations
AFTER INSERT
AS
BEGIN
    INSERT INTO DonationLog (DonationID, LogMessage)
    SELECT DonationID, 'New donation received: ' + CAST(Amount AS NVARCHAR)
    FROM inserted;
END;


SELECT * FROM DonationLog ORDER BY LogID DESC;

--------------------------------------

-- Age check
CREATE TRIGGER trg_CheckPetAge
ON Pets
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Age < 0)
    BEGIN
        RAISERROR('Age cannot be negative.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;


INSERT INTO Pets (Name, Age, Breed, Gender, Description, CategoryID, ShelterID)
VALUES ('BadPet', -2, 'Unknown', 'Female', 'Invalid age', 1, 1);

INSERT INTO Pets (Name, Age, Breed, Gender, Description, CategoryID, ShelterID)
VALUES ('TestPet', 3, 'TestBreed', 'Male', 'Healthy pet', 1, 1);

SELECT * FROM Pets WHERE Name = 'TestPet';

---------------------------------------