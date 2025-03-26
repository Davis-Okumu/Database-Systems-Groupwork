-- SQL file to insert sample data into the database for testing
-- Insert data into HousingProjects
INSERT INTO HousingProjects (ProjectID, ProjectName, Location, BuildingType, TotalUnits, ConstructionYear, ProjectStatus, FundingSource) VALUES
(1, 'Starehe Affordable Housing', 'Nairobi', 'Apartment', 500, 2020, 'Completed', 'Government'),
(2, 'Kapsoya Estate', 'Eldoret', 'Bungalow', 200, 2021, 'Ongoing', 'Private Developer'),
(3, 'Mombasa Palm Residences', 'Mombasa', 'Apartment', 300, 2019, 'Completed', 'World Bank'),
(4, 'Kisumu Lakeview', 'Kisumu', 'Townhouse', 150, 2022, 'Ongoing', 'County Government'),
(5, 'Thika Greens', 'Thika', 'Apartment', 400, 2021, 'Completed', 'Private Investor'),
(6, 'Nakuru Heights', 'Nakuru', 'Bungalow', 250, 2023, 'Planning', 'Government'),
(7, 'Kitui Mashinani Homes', 'Kitui', 'Studio', 100, 2020, 'Completed', 'NGO'),
(8, 'Machakos Meadows', 'Machakos', 'Apartment', 350, 2022, 'Ongoing', 'PPP'),
(9, 'Ruiru Modern Flats', 'Ruiru', 'Apartment', 600, 2021, 'Completed', 'Private Developer'),
(10, 'Kibera Upgrade Project', 'Nairobi', 'Studio', 800, 2023, 'Ongoing', 'Government-NGO Partnership');

-- Insert data into Applicants
INSERT INTO Applicants (ApplicantID, FirstName, LastName, DateOfBirth, ContactNumber, Email, HouseholdSize, AnnualIncome, ApplicationStatus) VALUES
(1, 'John', 'Kamau', '1985-03-15', '254712345678', 'john.kamau@gmail.com', 4, 600000.00, 'Approved'),
(2, 'Mary', 'Wambui', '1990-07-22', '254723456789', 'mary.wambui@yahoo.com', 3, 450000.00, 'Pending'),
(3, 'James', 'Omondi', '1978-11-30', '254734567890', 'j.omondi@hotmail.com', 5, 750000.00, 'Approved'),
(4, 'Grace', 'Achieng', '1982-05-18', '254745678901', 'g.achieng@gmail.com', 2, 350000.00, 'Rejected'),
(5, 'Peter', 'Mwangi', '1992-09-10', '254756789012', 'p.mwangi@yahoo.com', 6, 550000.00, 'Approved'),
(6, 'Sarah', 'Njeri', '1988-12-05', '254767890123', 's.njeri@gmail.com', 3, 480000.00, 'Pending'),
(7, 'David', 'Odhiambo', '1975-04-25', '254778901234', 'd.odhiambo@hotmail.com', 4, 680000.00, 'Approved'),
(8, 'Esther', 'Atieno', '1995-08-15', '254789012345', 'e.atieno@gmail.com', 1, 300000.00, 'Approved'),
(9, 'Paul', 'Kipchoge', '1980-01-20', '254790123456', 'p.kipchoge@yahoo.com', 5, 720000.00, 'Pending'),
(10, 'Lydia', 'Wanjiru', '1987-06-12', '254701234567', 'l.wanjiru@gmail.com', 2, 400000.00, 'Approved');

-- Insert data into Units
INSERT INTO Units (UnitID, ProjectID, UnitNumber, UnitType, Status) VALUES
(1, 1, 'A101', '2-Bedroom', 'Occupied'),
(2, 1, 'A102', '1-Bedroom', 'Available'),
(3, 2, 'B201', '3-Bedroom', 'Occupied'),
(4, 2, 'B202', '2-Bedroom', 'Under Maintenance'),
(5, 3, 'C301', '1-Bedroom', 'Occupied'),
(6, 3, 'C302', 'Studio', 'Available'),
(7, 4, 'D401', '2-Bedroom', 'Occupied'),
(8, 5, 'E501', '3-Bedroom', 'Occupied'),
(9, 6, 'F601', '1-Bedroom', 'Available'),
(10, 7, 'G701', 'Studio', 'Occupied');

-- Insert data into Tenants
INSERT INTO Tenants (TenantID, ApplicantID, UnitID, LeaseStartDate, LeaseEndDate, MonthlyRent, SubsidyAmount) VALUES
(1, 1, 1, '2021-01-01', '2023-12-31', 15000.00, 5000.00),
(2, 3, 3, '2022-03-15', '2024-03-14', 20000.00, 7000.00),
(3, 5, 5, '2021-06-01', '2023-05-31', 12000.00, 4000.00),
(4, 7, 7, '2022-09-10', '2024-09-09', 18000.00, 6000.00),
(5, 8, 8, '2021-11-20', '2023-11-19', 22000.00, 8000.00),
(6, 10, 10, '2022-02-05', '2024-02-04', 10000.00, 3000.00),
(7, 2, 2, '2023-01-15', '2025-01-14', 13000.00, 4500.00),
(8, 4, 4, '2023-04-01', '2025-03-31', 17000.00, 5500.00),
(9, 6, 6, '2023-07-10', '2025-07-09', 11000.00, 3500.00),
(10, 9, 9, '2023-10-20', '2025-10-19', 14000.00, 5000.00);

-- Insert data into Payments
INSERT INTO Payments (PaymentID, TenantID, PaymentDate, PaymentAmount, PaymentStatus) VALUES
(1, 1, '2023-01-05', 15000.00, 'Paid'),
(2, 2, '2023-01-10', 20000.00, 'Paid'),
(3, 3, '2023-01-15', 12000.00, 'Paid'),
(4, 4, '2023-01-20', 18000.00, 'Paid'),
(5, 5, '2023-01-25', 22000.00, 'Paid'),
(6, 6, '2023-02-05', 10000.00, 'Paid'),
(7, 7, '2023-02-10', 13000.00, 'Paid'),
(8, 8, '2023-02-15', 17000.00, 'Pending'),
(9, 9, '2023-02-20', 11000.00, 'Paid'),
(10, 10, '2023-02-25', 14000.00, 'Pending');

-- Insert data into MaintenanceRequests
INSERT INTO MaintenanceRequests (MaintenanceID, UnitID, RequestDate, IssueDescription, RepairStatus, CompletionDate) VALUES
(1, 1, '2023-01-10', 'Leaking kitchen pipe', 'Completed', '2023-01-12'),
(2, 3, '2023-01-15', 'Broken window', 'Completed', '2023-01-17'),
(3, 4, '2023-02-01', 'Electrical fault', 'In Progress', NULL),
(4, 5, '2023-02-05', 'Faulty door lock', 'Completed', '2023-02-07'),
(5, 7, '2023-02-10', 'Water heater not working', 'Pending', NULL),
(6, 8, '2023-02-15', 'Paint peeling off walls', 'Completed', '2023-02-18'),
(7, 10, '2023-02-20', 'Blocked drainage', 'In Progress', NULL),
(8, 2, '2023-03-01', 'Broken toilet seat', 'Completed', '2023-03-03'),
(9, 6, '2023-03-05', 'Faulty light switches', 'Pending', NULL),
(10, 9, '2023-03-10', 'Cracked bathroom tile', 'Completed', '2023-03-12');

-- Insert data into CommunityImpact
INSERT INTO CommunityImpact (ImpactID, ProjectID, EmploymentRate, EducationEnrollmentRate, HealthServiceAccess, CommunityEvents, SatisfactionScore) VALUES
(1, 1, 75.00, 90.00, 85.00, 12, 4.50),
(2, 2, 65.00, 85.00, 80.00, 4, 4.20),
(3, 3, 80.00, 92.00, 88.00, 1, 4.70),
(4, 4, 70.00, 87.00, 82.00, 12, 4.30),
(5, 5, 78.00, 91.00, 86.00, 4, 4.60),
(6, 6, 60.00, 80.00, 75.00, 1, 4.00),
(7, 7, 72.00, 88.00, 83.00, 12, 4.40),
(8, 8, 68.00, 86.00, 81.00, 4, 4.10),
(9, 9, 82.00, 93.00, 89.00, 1, 4.80),
(10, 10, 85.00, 95.00, 90.00, 12, 4.90);