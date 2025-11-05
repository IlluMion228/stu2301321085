

PetMatch - Pet Adoption Platform
Project name: PetMatch
Short description: Platform to connect animal shelters with adopters and volunteers. Includes OLTP schema, Data Warehouse and Power BI reports.

Model Diagrams

CoDatabase Notation) – defines key entities and relationships of the PetMatch platform.
Entities: User, Shenceptual Model (Chen’s lter, Pet, AdoptionRequest, Donation, PetCategory, Volunteer.

Logical Model (Crow’s Foot Notation) – converts the conceptual model into relational database tables with defined primary and foreign keys.

Physical Model (UML Database Notation) – implements the database schema in MS SQL Server, specifying data types, constraints, indexes, and triggers.

Data Warehouse Model (UML Database Notation) – uses both Star and Snowflake Schemas to support analytical queries and visual reporting.

Database System: Microsoft SQL Server
Tool: SQL Server Management Studio (SSMS)
Users			Registered adopters, volunteers, and administrators
Shelters		Partner shelters participating in the platform
Pets			Animals available for or already adopted
PetCategories		Animal types (Dogs, Cats, Birds, etc.)
AdoptionRequests	Requests connecting users and pets
Donations		Records of financial support from users
Volunteers		Information about volunteer activities

Database Objects

Stored Procedure: CreateAdoptionRequest – creates a new adoption request record.

Function: fn_PetAgeYears(@PetID) – calculates the age of a pet in years.

Trigger: trg_AdoptionRequest_StatusUpdate – automatically updates the pet’s status when an adoption is approved.


Project Structure

PetMatch/
  	diagrams/
 		conceptual_model.drawio
  		logical_model.drawio
  		physical_model.drawio
  		dw_model.drawio
  	sql/
  		create_tables.sql
  		sample_data.sql
 		stored_procedures.sql
  		functions.sql
 		triggers.sql
	reports/
  		PetMatch_Analytics.pbix
 	README.md
