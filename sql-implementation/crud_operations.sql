-- SQL script with examples of Create, Read, Update, Delete operations

-- CREATE OPERATIONS
-- Insert a new Housing Project into the HousingProjects table
INSERT INTO HousingProjects (ProjectID, ProjectName, Location, BuildingType, TotalUnits, ConstructionYear, ProjectStatus, FundingSource)
VALUES (113, 'Sunset Hills', 'City Center', 'Apartment', 100, 2023, 'Active', 'Government');

-- Insert a new Applicant into the Applicants table
INSERT INTO Applicants (ApplicantID, FirstName, LastName, DateOfBirth, ContactNumber, Email, HouseholdSize, AnnualIncome, ApplicationStatus)
VALUES (101, 'John', 'Doe', '1985-08-15', '555-1234', 'johndoe@example.com', 3, 55000.00, 'Pending');

-- Insert a new Unit into the Units table
INSERT INTO Units (UnitID, ProjectID, UnitNumber, UnitType, Status)
VALUES (142, 113, 'A101', '2BHK', 'Available');

-- Insert a new Tenant into the Tenants table
INSERT INTO Tenants (TenantID, ApplicantID, UnitID, LeaseStartDate, LeaseEndDate, MonthlyRent, SubsidyAmount)
VALUES (123, 101, 142, '2025-04-01', NULL, 1200.00, 200.00);

-- Insert a new Payment record into the Payments table
INSERT INTO Payments (PaymentID, TenantID, PaymentDate, PaymentAmount, PaymentStatus)
VALUES (12, 123, '2025-04-01', 1200.00, 'On Time');

-- Insert a Maintenance Request into the MaintenanceRequests table
INSERT INTO MaintenanceRequests (MaintenanceID, UnitID, RequestDate, IssueDescription, RepairStatus, CompletionDate)
VALUES (15, 142, '2025-04-05', 'Leaking faucet', 'In Progress', NULL);

-- Insert a new Community Impact record into the CommunityImpact table
INSERT INTO CommunityImpact (ImpactID, ProjectID, EmploymentRate, EducationEnrollmentRate, HealthServiceAccess, CommunityEvents, SatisfactionScore)
VALUES (11, 113, 65.5, 85.0, 90.0, 12, 85.0);

-- READ OPERATIONS
-- Select all applicants and their details
SELECT * FROM Applicants;

-- Select all units that are currently available for rent
SELECT UnitID, UnitNumber, UnitType, Status 
FROM Units
WHERE Status = 'Available';

-- Select tenants who are paying rent on time
SELECT t.TenantID, a.FirstName, a.LastName, t.MonthlyRent, p.PaymentAmount, p.PaymentStatus
FROM Tenants t
JOIN Applicants a ON t.ApplicantID = a.ApplicantID
JOIN Payments p ON t.TenantID = p.TenantID
WHERE p.PaymentStatus = 'On Time';

-- Select all maintenance requests for a specific unit
SELECT * 
FROM MaintenanceRequests
WHERE UnitID = 1;

-- Select all community impacts related to a specific housing project
SELECT * 
FROM CommunityImpact
WHERE ProjectID = 1;

-- UPDATE OPERATIONS
-- Update the status of a Housing Project
UPDATE HousingProjects
SET ProjectStatus = 'Completed'
WHERE ProjectID = 113;

-- Update the monthly rent for a tenant
UPDATE Tenants
SET MonthlyRent = 1300.00
WHERE TenantID = 123;

-- Update the contact information of an applicant
UPDATE Applicants
SET ContactNumber = '555-6789', Email = 'john.doe.updated@example.com'
WHERE ApplicantID = 101;

-- Update the repair status of a maintenance request
UPDATE MaintenanceRequests
SET RepairStatus = 'Completed', CompletionDate = '2025-04-06'
WHERE MaintenanceID = 1;

-- DELETE OPERATIONS 
-- Delete a Housing Project 
DELETE FROM HousingProjects
WHERE ProjectID = 113;

-- Delete an applicant from the Applicants table 
DELETE FROM Applicants
WHERE ApplicantID = 101;

-- Delete a Tenant 
DELETE FROM Tenants
WHERE TenantID = 123;

-- Delete a specific maintenance request
DELETE FROM MaintenanceRequests
WHERE MaintenanceID = 1;


