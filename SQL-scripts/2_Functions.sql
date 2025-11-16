-- Pet is available?
CREATE FUNCTION fn_IsPetAvailable (@PetID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsAdopted BIT;

    SELECT @IsAdopted = IsAdopted
    FROM Pets
    WHERE PetID = @PetID;

    RETURN CASE WHEN @IsAdopted = 0 THEN 1 ELSE 0 END;
END;

SELECT dbo.fn_IsPetAvailable(3) AS IsAvailable;
SELECT 
    p.PetID,
    p.Name,
    p.IsAdopted,
    dbo.fn_IsPetAvailable(p.PetID) AS IsAvailable
FROM Pets p;

SELECT *
FROM Pets
WHERE dbo.fn_IsPetAvailable(PetID) = 1;



-- Total donation
CREATE FUNCTION fn_TotalDonations (@ShelterID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);

    SELECT @Total = SUM(Amount)
    FROM Donations
    WHERE ShelterID = @ShelterID;

    RETURN ISNULL(@Total, 0);
END;

SELECT dbo.fn_TotalDonations(2) AS TotalDonations;

SELECT
    s.ShelterID,
    s.ShelterName,
    dbo.fn_TotalDonations(s.ShelterID) AS TotalDonations
FROM Shelters s
ORDER BY TotalDonations DESC;

SELECT
    ShelterID,
    ShelterName
FROM Shelters
WHERE dbo.fn_TotalDonations(ShelterID) > 200;



-- Pet in shelters
CREATE FUNCTION fn_PetCount (@ShelterID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;

    SELECT @Count = COUNT(*)
    FROM Pets
    WHERE ShelterID = @ShelterID;

    RETURN @Count;
END;

SELECT dbo.fn_PetCount(1) AS PetCount;

SELECT
    s.ShelterID,
    s.ShelterName,
    dbo.fn_PetCount(s.ShelterID) AS PetCount
FROM Shelters s
ORDER BY PetCount DESC;

SELECT
    ShelterID,
    ShelterName
FROM Shelters
WHERE dbo.fn_PetCount(ShelterID) >= 5;


