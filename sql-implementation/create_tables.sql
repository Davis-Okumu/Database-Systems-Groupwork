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