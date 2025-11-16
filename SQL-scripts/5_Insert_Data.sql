USE PetMatchDB;
GO


INSERT INTO Users (FullName, Email, PasswordHash, Phone, Role)
VALUES
('Ivan Petrov', 'ivan@example.com', 'H1', '0888123456', 'Adopter'),
('Maria Georgieva', 'maria@example.com', 'H2', '0899234567', 'Adopter'),
('Petar Dimitrov', 'petar@example.com', 'H3', '0888567890', 'Adopter'),
('Elena Kostova', 'elena@example.com', 'H4', '0877123456', 'Adopter'),
('Nikolay Terziev', 'nikolay@example.com', 'H5', '0889456123', 'Adopter'),
('Kristina Ivanova', 'kristina@example.com', 'H6', '0889011223', 'Adopter'),
('Georgi Hristov', 'georgi@example.com', 'H7', '0887654321', 'Adopter'),
('Radostina Koleva', 'rado@example.com', 'H8', '0897123456', 'Adopter'),

('Shelter Manager 1', 'shelter1@example.com', 'H9', '0888000111', 'Shelter'),
('Shelter Manager 2', 'shelter2@example.com', 'H10', '0888000222', 'Shelter'),
('Shelter Manager 3', 'shelter3@example.com', 'H11', '0888000333', 'Shelter'),
('Shelter Manager 4', 'shelter4@example.com', 'H12', '0888000444', 'Shelter'),
('Shelter Manager 5', 'shelter5@example.com', 'H13', '0888000555', 'Shelter'),

('PetMatch Admin', 'admin@example.com', 'H14', '0888000666', 'Admin'),
('Support Admin 1', 'support1@example.com', 'H15', '0888000777', 'Admin'),
('Support Admin 2', 'support2@example.com', 'H16', '0888000888', 'Admin'),
('Data Analyst', 'analyst@example.com', 'H17', '0888000999', 'Admin'),
('Moderator 1', 'mod1@example.com', 'H18', '0888000112', 'Admin'),
('Moderator 2', 'mod2@example.com', 'H19', '0888000223', 'Admin'),
('Moderator 3', 'mod3@example.com', 'H20', '0888000334', 'Admin');




INSERT INTO Shelters (ShelterName, Address, Phone, Email, UserID)
VALUES
('HappyPaws Shelter', 'Sofia, Mladost 2', '0888123456', 'contact@happypaws.bg', 9),
('Second Chance', 'Plovdiv, Center 14', '0899332211', 'info@secondchance.bg', 10),
('Green Valley', 'Varna, Sea Garden 33', '0899001122', 'office@greenvalley.bg', 11),
('AnimalHope', 'Burgas, Slaveikov 5', '0888997744', 'contact@animalhope.bg', 12),
('Life for Paws', 'Ruse, Center 22', '0888345678', 'life4paws@pets.bg', 13);



INSERT INTO PetCategories (CategoryName)
VALUES
('Dog'), ('Cat'), ('Rabbit'), ('Bird'),
('Hamster'), ('Turtle'), ('Horse'), ('Ferret'),
('Snake'), ('Guinea Pig');



INSERT INTO Pets (Name, Age, Breed, Gender, Description, IsAdopted, CategoryID, ShelterID)
VALUES
-- Dogs
('Buddy', 3, 'Golden Retriever', 'Male', 'Friendly and playful.', 0, 1, 1),
('Rex', 5, 'German Shepherd', 'Male', 'Loyal and trained.', 0, 1, 2),
('Lucky', 2, 'Beagle', 'Male', 'Energetic and curious.', 0, 1, 3),
('Bella', 4, 'Husky', 'Female', 'Beautiful blue eyes.', 0, 1, 4),
('Max', 1, 'Labrador', 'Male', 'Loves children.', 0, 1, 5),

-- Cats
('Luna', 2, 'Siamese', 'Female', 'Calm and affectionate.', 0, 2, 1),
('Shadow', 3, 'Black Cat', 'Male', 'Quiet and gentle.', 0, 2, 2),
('Mimi', 1, 'Shorthair', 'Female', 'Very playful.', 0, 2, 3),
('Oscar', 6, 'Persian', 'Male', 'Lazy and fluffy.', 1, 2, 4),
('Kitty', 4, 'Domestic', 'Female', 'Loves attention.', 0, 2, 5),

-- Rabbits
('Snow', 1, 'White Rabbit', 'Female', 'Gentle.', 1, 3, 1),
('Brownie', 2, 'Brown Rabbit', 'Male', 'Calm.', 0, 3, 2),

-- Birds
('Sky', 1, 'Parrot', 'Male', 'Talkative.', 0, 4, 3),
('Sunny', 2, 'Canary', 'Female', 'Sings beautifully.', 0, 4, 4),

-- Hamsters
('Nibbles', 1, 'Dwarf Hamster', 'Male', 'Small and active.', 0, 5, 1),
('Peanut', 1, 'Golden Hamster', 'Female', 'Sleeps a lot.', 0, 5, 2),

-- Turtles
('Shelly', 10, 'Greek Tortoise', 'Female', 'Very calm.', 0, 6, 5),

-- Horses
('Storm', 7, 'Arabian', 'Male', 'Strong and elegant.', 0, 7, 3),
('Hope', 5, 'Mustang', 'Female', 'Powerful spirit.', 0, 7, 4),

-- Ferrets
('Flash', 3, 'Ferret', 'Male', 'Fast and curious.', 0, 8, 2),
('Lily', 2, 'Ferret', 'Female', 'Loves attention.', 0, 8, 1),

-- Snakes
('Viper', 4, 'Python', 'Male', 'Calm snake.', 0, 9, 5),
('Emerald', 3, 'Green Snake', 'Female', 'Very rare.', 0, 9, 4),

-- Guinea pigs
('Coco', 2, 'Guinea Pig', 'Male', 'Chubby and cute.', 0, 10, 3),
('Lola', 1, 'Guinea Pig', 'Female', 'Very social.', 0, 10, 2),

-- More dogs
('Spike', 4, 'Rottweiler', 'Male', 'Protective.', 0, 1, 1),
('Zara', 2, 'Doberman', 'Female', 'Smart.', 0, 1, 2),

-- More cats
('Whiskers', 5, 'Sphynx', 'Male', 'Unique look.', 0, 2, 3),
('BellaCat', 2, 'British Shorthair', 'Female', 'Calm.', 0, 2, 4),

-- More rabbits
('Fluffy', 1, 'Angora Rabbit', 'Female', 'Soft.', 0, 3, 5),

-- Birds
('Blue', 3, 'Macaw', 'Male', 'Large parrot.', 0, 4, 1),
('Tweet', 2, 'Sparrow', 'Female', 'Tiny and sweet.', 0, 4, 2);



INSERT INTO AdoptionRequests (UserID, PetID, Status)
VALUES
(1,1,'Pending'), (2,2,'Pending'), (3,3,'Approved'), (4,4,'Rejected'),
(1,5,'Pending'), (2,6,'Approved'), (3,7,'Rejected'),
(5,8,'Pending'), (6,9,'Pending'), (7,10,'Approved'),
(1,11,'Approved'), (2,12,'Pending'), (3,13,'Rejected'),
(4,14,'Pending'), (5,15,'Approved'), (6,16,'Rejected'),
(7,17,'Pending'), (8,18,'Pending'), (1,19,'Rejected'),
(2,20,'Approved'), (3,21,'Pending'), (5,22,'Pending'),
(7,23,'Approved'), (8,24,'Pending'), (1,25,'Pending'),
(6,26,'Rejected'), (7,27,'Pending'), (2,28,'Pending'),
(3,29,'Approved');



INSERT INTO Donations (UserID, ShelterID, Amount)
VALUES
(1,1,50), (2,1,20), (3,1,30), (4,1,15), (5,1,10),
(6,2,40), (7,2,10), (8,2,60), (1,2,25), (2,2,100),
(3,3,35), (4,3,15), (6,3,120), (8,3,45), (7,3,20),
(1,4,90), (2,4,25), (3,4,60), (5,4,10), (6,4,5),
(1,5,150), (3,5,40), (6,5,25), (8,5,50), (7,5,18),
(14,1,200), (15,1,300), (16,2,140), (17,3,50),
(18,4,60), (19,5,75), (20,5,33), (14,4,190),
(15,3,80), (16,2,60), (17,1,110), (18,5,44);



INSERT INTO Volunteers (UserID, ShelterID)
VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),
(6,2),(7,2),(8,2),(1,2),(2,2),
(3,3),(4,3),(6,3),(8,3),(7,3),
(1,4),(2,4),(5,4),(6,5),(7,5);





