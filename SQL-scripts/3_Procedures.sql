-- Adopt request
CREATE PROCEDURE sp_CreateAdoptionRequest
    @UserID INT,
    @PetID INT
AS
BEGIN
    SET NOCOUNT ON;

    IF (dbo.fn_IsPetAvailable(@PetID) = 0)
    BEGIN
        RAISERROR('This pet is already adopted.', 16, 1);
        RETURN;
    END

    INSERT INTO AdoptionRequests (UserID, PetID, Status)
    VALUES (@UserID, @PetID, 'Pending');
END;

exec sp_CreateAdoptionRequest 3, 12;

SELECT * FROM AdoptionRequests ORDER BY RequestID DESC;

-- Adopt approve
CREATE PROCEDURE sp_ApproveAdoptionRequest
    @RequestID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PetID INT;

    SELECT @PetID = PetID
    FROM AdoptionRequests
    WHERE RequestID = @RequestID;

    UPDATE AdoptionRequests
    SET Status = 'Approved'
    WHERE RequestID = @RequestID;

    UPDATE Pets
    SET IsAdopted = 1
    WHERE PetID = @PetID;
END;

exec sp_ApproveAdoptionRequest 5;

select * from AdoptionRequests where RequestID = 5;

-- Addopt reject
CREATE PROCEDURE sp_RejectAdoptionRequest
    @RequestID INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE AdoptionRequests
    SET Status = 'Rejected'
    WHERE RequestID = @RequestID;
END;

exec sp_RejectAdoptionRequest 7;

SELECT * FROM AdoptionRequests WHERE RequestID = 7;
