

/* ------------------------------------------------------------
   All pets
   ------------------------------------------------------------ */
SELECT 
    p.PetID,
    p.Name AS PetName,
    p.Age,
    p.Gender,
    pc.CategoryName AS PetCategory,
    s.ShelterName
FROM Pets p
    JOIN PetCategories pc ON p.CategoryID = pc.CategoryID
    JOIN Shelters s ON p.ShelterID = s.ShelterID
ORDER BY p.PetID;

/* ------------------------------------------------------------
   Aoption request review
   ------------------------------------------------------------ */
SELECT 
    u.UserID,
    u.FullName,
    u.Email,
    COUNT(ar.RequestID) AS AdoptionRequests
FROM Users u
    LEFT JOIN AdoptionRequests ar ON u.UserID = ar.UserID
GROUP BY u.UserID, u.FullName, u.Email
ORDER BY AdoptionRequests DESC;

/* ------------------------------------------------------------
   List with adoption requests
   ------------------------------------------------------------ */
SELECT 
    ar.RequestID,
    u.FullName AS UserName,
    p.Name AS PetName,
    ar.Status,
    ar.RequestDate
FROM AdoptionRequests ar
    JOIN Users u ON ar.UserID = u.UserID
    JOIN Pets p ON ar.PetID = p.PetID
ORDER BY ar.RequestDate DESC;

/* ------------------------------------------------------------
   Donation sum (top)
   ------------------------------------------------------------ */
SELECT 
    s.ShelterName,
    SUM(d.Amount) AS TotalDonations
FROM Shelters s
    LEFT JOIN Donations d ON d.ShelterID = s.ShelterID
GROUP BY s.ShelterName
ORDER BY TotalDonations DESC;

/* ------------------------------------------------------------
   Volunteer show 
   ------------------------------------------------------------ */
SELECT 
    s.ShelterName,
    u.FullName AS Volunteer
FROM Volunteers v
    JOIN Users u ON v.UserID = u.UserID
    JOIN Shelters s ON v.ShelterID = s.ShelterID
ORDER BY s.ShelterName, u.FullName;

/* ------------------------------------------------------------
   Pet avalibale
   ------------------------------------------------------------ */
SELECT 
    p.PetID,
    p.Name,
    pc.CategoryName,
    s.ShelterName
FROM Pets p
    JOIN PetCategories pc ON p.CategoryID = pc.CategoryID
    JOIN Shelters s ON p.ShelterID = s.ShelterID
WHERE p.IsAdopted = 0;

/* ------------------------------------------------------------
   Top donation
   ------------------------------------------------------------ */
SELECT TOP 10
    d.DonationID,
    u.FullName AS Donor,
    s.ShelterName,
    d.Amount,
    d.DonationDate
FROM Donations d
    JOIN Users u ON d.UserID = u.UserID
    JOIN Shelters s ON d.ShelterID = s.ShelterID
ORDER BY d.Amount DESC;

/* ------------------------------------------------------------
   Adopted pets by users
   ------------------------------------------------------------ */
SELECT DISTINCT
    u.UserID,
    u.FullName
FROM Users u
    JOIN AdoptionRequests ar ON u.UserID = ar.UserID
WHERE ar.Status = 'Approved';

/* ------------------------------------------------------------
   Pet sum for category
   ------------------------------------------------------------ */
SELECT 
    pc.CategoryName,
    COUNT(p.PetID) AS PetsCount
FROM PetCategories pc
    LEFT JOIN Pets p ON p.CategoryID = pc.CategoryID
GROUP BY pc.CategoryName
ORDER BY PetsCount DESC;

/* ------------------------------------------------------------
    Donat per month
   ------------------------------------------------------------ */
SELECT 
    FORMAT(DonationDate, 'yyyy-MM-01') AS MonthStart,
    SUM(Amount) AS Total
FROM Donations
GROUP BY FORMAT(DonationDate, 'yyyy-MM-01')
ORDER BY MonthStart;

/* ------------------------------------------------------------
   Popular pets for adopt
   ------------------------------------------------------------ */
SELECT 
    p.PetID,
    p.Name,
    pc.CategoryName,
    COUNT(ar.RequestID) AS RequestsCount
FROM Pets p
    LEFT JOIN AdoptionRequests ar ON ar.PetID = p.PetID
    LEFT JOIN PetCategories pc ON pc.CategoryID = p.CategoryID
GROUP BY p.PetID, p.Name, pc.CategoryName
ORDER BY RequestsCount DESC;

/* ------------------------------------------------------------
   Avarage age of pet
   ------------------------------------------------------------ */
SELECT 
    s.ShelterName,
    AVG(p.Age) AS AverageAge
FROM Shelters s
    LEFT JOIN Pets p ON p.ShelterID = s.ShelterID
GROUP BY s.ShelterName
ORDER BY AverageAge;

/* ------------------------------------------------------------
   Top requests by users
   ------------------------------------------------------------ */
SELECT 
    u.UserID,
    u.FullName,
    COUNT(ar.RequestID) AS TotalRequests
FROM Users u
    LEFT JOIN AdoptionRequests ar ON ar.UserID = u.UserID
GROUP BY u.UserID, u.FullName
HAVING COUNT(ar.RequestID) > 0
ORDER BY TotalRequests DESC;

/* ------------------------------------------------------------
   Request approve
   ------------------------------------------------------------ */
SELECT 
    s.ShelterName,
    ROUND(
        100.0 * SUM(CASE WHEN ar.Status = 'Approved' THEN 1 ELSE 0 END) 
        / NULLIF(COUNT(ar.RequestID), 0), 
        2
    ) AS ApprovalRatePercent
FROM Shelters s
    LEFT JOIN Pets p ON p.ShelterID = s.ShelterID
    LEFT JOIN AdoptionRequests ar ON ar.PetID = p.PetID
GROUP BY s.ShelterName
ORDER BY ApprovalRatePercent DESC;

/* ------------------------------------------------------------
   Pet category addopt popularity
   ------------------------------------------------------------ */
SELECT 
    pc.CategoryName,
    COUNT(ar.RequestID) AS AdoptionAttempts
FROM PetCategories pc
    LEFT JOIN Pets p ON p.CategoryID = pc.CategoryID
    LEFT JOIN AdoptionRequests ar ON ar.PetID = p.PetID
GROUP BY pc.CategoryName
ORDER BY AdoptionAttempts DESC;

/* ------------------------------------------------------------
    Volunteer works in few shelters
------------------------------------------------------------ */
SELECT 
    u.FullName,
    COUNT(v.ShelterID) AS NumberOfShelters
FROM Volunteers v
    JOIN Users u ON u.UserID = v.UserID
GROUP BY u.FullName
HAVING COUNT(v.ShelterID) > 1;

/* ------------------------------------------------------------
   total pets in shelters
   ------------------------------------------------------------ */
SELECT
    s.ShelterName,
    COUNT(p.PetID) AS TotalPets
FROM Shelters s
    LEFT JOIN Pets p ON p.ShelterID = s.ShelterID
GROUP BY s.ShelterName
ORDER BY TotalPets DESC;

/* ------------------------------------------------------------
   User donation
   ------------------------------------------------------------ */
SELECT 
    u.FullName,
    SUM(d.Amount) AS DonatedTotal,
    COUNT(d.DonationID) AS DonationsCount
FROM Users u
    LEFT JOIN Donations d ON d.UserID = u.UserID
GROUP BY u.FullName
ORDER BY DonatedTotal DESC;

/* ------------------------------------------------------------
   forgotten pets
   ------------------------------------------------------------ */
SELECT 
    p.PetID,
    p.Name,
    p.IsAdopted,
    MAX(ar.RequestDate) AS LastRequestDate
FROM Pets p
    LEFT JOIN AdoptionRequests ar ON ar.PetID = p.PetID
WHERE p.IsAdopted = 0
GROUP BY p.PetID, p.Name, p.IsAdopted
HAVING 
       MAX(ar.RequestDate) < DATEADD(DAY, -60, GETDATE())
    OR MAX(ar.RequestDate) IS NULL
ORDER BY LastRequestDate;


/* ------------------------------------------------------------
   Avarage approve time
   ------------------------------------------------------------ */
SELECT 
    AVG(DATEDIFF(HOUR, ar.RequestDate, ar.ApprovedDate)) AS AvgApprovalDurationHours
FROM AdoptionRequests ar
WHERE ar.Status = 'Approved'
  AND ar.ApprovedDate IS NOT NULL;



