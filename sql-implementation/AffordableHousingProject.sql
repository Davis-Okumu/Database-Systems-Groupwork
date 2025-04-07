CREATE DATABASE AffordableHousingAllocationSystem;
USE AffordableHousingAllocationSystem;

-- SQL script to create tables based on the schema
-- Housing Projects Table
CREATE TABLE HousingProjects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    BuildingType VARCHAR(50) NOT NULL,
    TotalUnits INT NOT NULL,
    ConstructionYear INT NOT NULL,
    ProjectStatus VARCHAR(50) NOT NULL,
    FundingSource VARCHAR(100)
);

-- Applicants Table
CREATE TABLE Applicants (
    ApplicantID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    HouseholdSize INT NOT NULL,
    AnnualIncome DECIMAL(15,2) NOT NULL,
    ApplicationStatus VARCHAR(50) NOT NULL
);

-- Units Table
CREATE TABLE Units (
    UnitID INT PRIMARY KEY,
    ProjectID INT,
    UnitNumber VARCHAR(20) NOT NULL,
    UnitType VARCHAR(20) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (ProjectID) REFERENCES HousingProjects(ProjectID)
);

-- Tenants Table
CREATE TABLE Tenants (
    TenantID INT PRIMARY KEY,
    ApplicantID INT,
    UnitID INT,
    LeaseStartDate DATE NOT NULL,
    LeaseEndDate DATE,
    MonthlyRent DECIMAL(10,2) NOT NULL,
    SubsidyAmount DECIMAL(10,2),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID),
    FOREIGN KEY (UnitID) REFERENCES Units(UnitID)
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    TenantID INT,
    PaymentDate DATE NOT NULL,
    PaymentAmount DECIMAL(10,2) NOT NULL,
    PaymentStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (TenantID) REFERENCES Tenants(TenantID)
);

-- Maintenance Requests Table
CREATE TABLE MaintenanceRequests (
    MaintenanceID INT PRIMARY KEY,
    UnitID INT,
    RequestDate DATE NOT NULL,
    IssueDescription VARCHAR(255) NOT NULL,
    RepairStatus VARCHAR(50) NOT NULL,
    CompletionDate DATE,
    FOREIGN KEY (UnitID) REFERENCES Units(UnitID)
);

-- Community Impact Table
CREATE TABLE CommunityImpact (
    ImpactID INT PRIMARY KEY,
    ProjectID INT,
    EmploymentRate DECIMAL(5,2) NOT NULL,
    EducationEnrollmentRate DECIMAL(5,2) NOT NULL,
    HealthServiceAccess DECIMAL(5,2) NOT NULL,
    CommunityEvents INT NOT NULL,
    SatisfactionScore DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (ProjectID) REFERENCES HousingProjects(ProjectID)
);


-- SQL file to insert sample data into the database for testing
-- Insert data into HousingProjects
INSERT INTO HousingProjects (ProjectID, ProjectName, Location, BuildingType, TotalUnits, ConstructionYear, ProjectStatus, FundingSource) VALUES
(113, 'Starehe Affordable Housing', 'Nairobi', 'Apartment', 500, 2020, 'Completed', 'Government'),
(213, 'Kapsoya Estate', 'Eldoret', 'Bungalow', 200, 2021, 'Ongoing', 'Private Developer'),
(313, 'Mombasa Palm Residences', 'Mombasa', 'Apartment', 300, 2019, 'Completed', 'World Bank'),
(413, 'Kisumu Lakeview', 'Kisumu', 'Townhouse', 150, 2022, 'Ongoing', 'County Government'),
(513, 'Thika Greens', 'Thika', 'Apartment', 400, 2021, 'Completed', 'Private Investor'),
(613, 'Nakuru Heights', 'Nakuru', 'Bungalow', 250, 2023, 'Planning', 'Government'),
(713, 'Kitui Mashinani Homes', 'Kitui', 'Studio', 100, 2020, 'Completed', 'NGO'),
(813, 'Machakos Meadows', 'Machakos', 'Apartment', 350, 2022, 'Ongoing', 'PPP'),
(913, 'Ruiru Modern Flats', 'Ruiru', 'Apartment', 600, 2021, 'Completed', 'Private Developer'),
(1013, 'Kibera Upgrade Project', 'Nairobi', 'Studio', 800, 2023, 'Ongoing', 'Government-NGO Partnership');

-- Insert data into Applicants
INSERT INTO Applicants (ApplicantID, FirstName, LastName, DateOfBirth, ContactNumber, Email, HouseholdSize, AnnualIncome, ApplicationStatus) VALUES
(101, 'John', 'Kamau', '1985-03-15', '254712345678', 'john.kamau@gmail.com', 4, 600000.00, 'Approved'),
(201, 'Mary', 'Wambui', '1990-07-22', '254723456789', 'mary.wambui@yahoo.com', 3, 450000.00, 'Pending'),
(301, 'James', 'Omondi', '1978-11-30', '254734567890', 'j.omondi@hotmail.com', 5, 750000.00, 'Approved'),
(401, 'Grace', 'Achieng', '1982-05-18', '254745678901', 'g.achieng@gmail.com', 2, 350000.00, 'Rejected'),
(501, 'Peter', 'Mwangi', '1992-09-10', '254756789012', 'p.mwangi@yahoo.com', 6, 550000.00, 'Approved'),
(601, 'Sarah', 'Njeri', '1988-12-05', '254767890123', 's.njeri@gmail.com', 3, 480000.00, 'Pending'),
(701, 'David', 'Odhiambo', '1975-04-25', '254778901234', 'd.odhiambo@hotmail.com', 4, 680000.00, 'Approved'),
(801, 'Esther', 'Atieno', '1995-08-15', '254789012345', 'e.atieno@gmail.com', 1, 300000.00, 'Approved'),
(901, 'Paul', 'Kipchoge', '1980-01-20', '254790123456', 'p.kipchoge@yahoo.com', 5, 720000.00, 'Pending'),
(1001, 'Lydia', 'Wanjiru', '1987-06-12', '254701234567', 'l.wanjiru@gmail.com', 2, 400000.00, 'Approved');

-- Insert data into Units
INSERT INTO Units (UnitID, ProjectID, UnitNumber, UnitType, Status) VALUES
(142, 113, 'A101', '2-Bedroom', 'Occupied'),
(242, 113, 'A102', '1-Bedroom', 'Available'),
(342, 213, 'B201', '3-Bedroom', 'Occupied'),
(442, 213, 'B202', '2-Bedroom', 'Under Maintenance'),
(542, 313, 'C301', '1-Bedroom', 'Occupied'),
(642, 313, 'C302', 'Studio', 'Available'),
(742, 413, 'D401', '2-Bedroom', 'Occupied'),
(842, 513, 'E501', '3-Bedroom', 'Occupied'),
(942, 613, 'F601', '1-Bedroom', 'Available'),
(1042, 713, 'G701', 'Studio', 'Occupied');

-- Insert data into Tenants
INSERT INTO Tenants (TenantID, ApplicantID, UnitID, LeaseStartDate, LeaseEndDate, MonthlyRent, SubsidyAmount) VALUES
(123, 101, 142, '2021-01-01', '2023-12-31', 15000.00, 5000.00),
(223, 301, 342, '2022-03-15', '2024-03-14', 20000.00, 7000.00),
(323, 501, 542, '2021-06-01', '2023-05-31', 12000.00, 4000.00),
(423, 701, 742, '2022-09-10', '2024-09-09', 18000.00, 6000.00),
(523, 801, 842, '2021-11-20', '2023-11-19', 22000.00, 8000.00),
(623, 1001, 1042, '2022-02-05', '2024-02-04', 10000.00, 3000.00),
(723, 201, 242, '2023-01-15', '2025-01-14', 13000.00, 4500.00),
(823, 401, 442, '2023-04-01', '2025-03-31', 17000.00, 5500.00),
(923, 601, 642, '2023-07-10', '2025-07-09', 11000.00, 3500.00),
(1023, 901, 942, '2023-10-20', '2025-10-19', 14000.00, 5000.00);

-- Insert data into Payments
INSERT INTO Payments (PaymentID, TenantID, PaymentDate, PaymentAmount, PaymentStatus) VALUES
(1, 123, '2023-01-05', 15000.00, 'Paid'),
(2, 223, '2023-01-10', 20000.00, 'Paid'),
(3, 323, '2023-01-15', 12000.00, 'Paid'),
(4, 423, '2023-01-20', 18000.00, 'Paid'),
(5, 523, '2023-01-25', 22000.00, 'Paid'),
(6, 623, '2023-02-05', 10000.00, 'Paid'),
(7, 723, '2023-02-10', 13000.00, 'Paid'),
(8, 823, '2023-02-15', 17000.00, 'Pending'),
(9, 923, '2023-02-20', 11000.00, 'Paid'),
(10, 1023, '2023-02-25', 14000.00, 'Pending');

-- Insert data into MaintenanceRequests
INSERT INTO MaintenanceRequests (MaintenanceID, UnitID, RequestDate, IssueDescription, RepairStatus, CompletionDate) VALUES
(1, 142, '2023-01-10', 'Leaking kitchen pipe', 'Completed', '2023-01-12'),
(2, 342, '2023-01-15', 'Broken window', 'Completed', '2023-01-17'),
(3, 442, '2023-02-01', 'Electrical fault', 'In Progress', NULL),
(4, 542, '2023-02-05', 'Faulty door lock', 'Completed', '2023-02-07'),
(5, 742, '2023-02-10', 'Water heater not working', 'Pending', NULL),
(6, 842, '2023-02-15', 'Paint peeling off walls', 'Completed', '2023-02-18'),
(7, 1042, '2023-02-20', 'Blocked drainage', 'In Progress', NULL),
(8, 242, '2023-03-01', 'Broken toilet seat', 'Completed', '2023-03-03'),
(9, 642, '2023-03-05', 'Faulty light switches', 'Pending', NULL),
(10, 942, '2023-03-10', 'Cracked bathroom tile', 'Completed', '2023-03-12');

-- Insert data into CommunityImpact
INSERT INTO CommunityImpact (ImpactID, ProjectID, EmploymentRate, EducationEnrollmentRate, HealthServiceAccess, CommunityEvents, SatisfactionScore) VALUES
(1, 113, 75.00, 90.00, 85.00, 12, 4.50),
(2, 213, 65.00, 85.00, 80.00, 4, 4.20),
(3, 313, 80.00, 92.00, 88.00, 1, 4.70),
(4, 413, 70.00, 87.00, 82.00, 12, 4.30),
(5, 513, 78.00, 91.00, 86.00, 4, 4.60),
(6, 613, 60.00, 80.00, 75.00, 1, 4.00),
(7, 713, 72.00, 88.00, 83.00, 12, 4.40),
(8, 813, 68.00, 86.00, 81.00, 4, 4.10),
(9, 913, 82.00, 93.00, 89.00, 1, 4.80),
(10, 1013, 85.00, 95.00, 90.00, 12, 4.90);

