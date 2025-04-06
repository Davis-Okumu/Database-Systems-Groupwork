-- SQL script with advanced queries like joins and aggregate functions

-- Query to find applicants living in subsidized apartments or involved in projects with employment rate over 60%
SELECT a.FirstName, a.LastName, t.MonthlyRent, t.SubsidyAmount 
FROM Applicants a
JOIN Tenants t ON a.ApplicantID = t.ApplicantID
WHERE t.SubsidyAmount > 0

UNION

SELECT a.FirstName, a.LastName, NULL AS MonthlyRent, NULL AS SubsidyAmount
FROM Applicants a
JOIN HousingProjects h ON a.ApplicantID = h.ProjectID
JOIN CommunityImpact c ON h.ProjectID = c.ProjectID
WHERE c.EmploymentRate > 60;

-- Query to find all possible combinations of applicants and available units (to analyze unit demand)
SELECT a.FirstName, a.LastName, u.UnitNumber, u.UnitType
FROM Applicants a
CROSS JOIN Units u
WHERE u.Status = 'Available';


-- Query to find tenants who are paying their rent on time and live in high satisfaction projects
SELECT t.TenantID, t.MonthlyRent, t.SubsidyAmount
FROM Tenants t
JOIN Payments p ON t.TenantID = p.TenantID
WHERE p.PaymentStatus = 'On Time'

INTERSECT

SELECT t.TenantID, t.MonthlyRent, t.SubsidyAmount
FROM Tenants t
JOIN Units u ON t.UnitID = u.UnitID
JOIN HousingProjects h ON u.ProjectID = h.ProjectID
JOIN CommunityImpact c ON h.ProjectID = c.ProjectID
WHERE c.SatisfactionScore > 80;



-- Query to find tenants who have not made any payments yet but are living in active housing projects
SELECT t.TenantID, t.MonthlyRent
FROM Tenants t
JOIN Units u ON t.UnitID = u.UnitID
JOIN HousingProjects h ON u.ProjectID = h.ProjectID
WHERE h.ProjectStatus = 'Active'

EXCEPT

SELECT t.TenantID, t.MonthlyRent
FROM Tenants t
JOIN Payments p ON t.TenantID = p.TenantID;




