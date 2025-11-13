USE hr_analytics;

-- Employees Table
CREATE TABLE employees AS
SELECT 
    EmpID,
    Employee_Name,
    Sex,
    Department,
    Position,
    State,
    Salary,
    DateOfHire,
    DateOfTermination,
    Status,
    ManagerName,
    ManagerID,
    RecruitmentSource
FROM hr_cleaned_data;

-- Performance Table

CREATE TABLE performance AS
SELECT 
    EmpID,
    PerformanceScore,
    EmpSatisfaction,
    EngagementSurvey,
    SpecialProjectsCount,
    LastPerformanceReview_Date
FROM hr_cleaned_data;

-- Attendance Table 
CREATE TABLE attendance AS
SELECT 
    EmpID,
    DaysLateLast30,
    Absences,
    Tenure_Years
FROM hr_cleaned_data;

SHOW TABLES;

SELECT * FROM employees LIMIT 5;
SELECT * FROM performance LIMIT 5;
SELECT * FROM attendance LIMIT 5;



