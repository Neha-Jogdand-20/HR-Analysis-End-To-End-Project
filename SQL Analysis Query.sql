/* ===========================================================
   HR ANALYTICS PROJECT
   Author: Neha Jogdand
   Description: Employee Attrition, Salary, Tenure & HR Insights
   =========================================================== */

/* Create Data Base*/
CREATE DATABASE hr_analytics;

/*Use Data Base*/
USE hr_analytics;

/* ATTRITION ANALYSIS
===============================================================================================*/
-- how many %  of employees have left the company.
SELECT 
    COUNT(CASE WHEN Status = 'Terminated' THEN 1 END) * 100.0 / COUNT(*) AS attrition_rate
FROM hr_cleaned_data;
-- attrition rate is 18.64952

-- Sales & IT departments have the highest attrition rate. 
SELECT 
    Department,
    COUNT(CASE WHEN Status = 'Terminated' THEN 1 END) * 100.0 / COUNT(*) AS attrition_rate
FROM hr_cleaned_data
GROUP BY Department
ORDER BY attrition_rate DESC;

/* SALARY ANALYSIS
=================================================================================================*/
-- Average Salary by Department
SELECT 
    Department, ROUND(AVG(Salary), 2) AS avg_salary
FROM
    hr_cleaned_data
GROUP BY Department
ORDER BY avg_salary DESC;
-- Technical and Finance teams receive higher pay than HR, indicating possible pay gaps.


/* TENURE ANALYSIS
=================================================================================================*/
-- Average Tenure by Department
SELECT 
    Department,
    ROUND(AVG(Tenure_Years), 2) AS avg_tenure
FROM hr_cleaned_data
GROUP BY Department
ORDER BY avg_tenure DESC;

/* RECRUITMENT SOURCE EFFECTIVENESS
==========================================================================================*/
SELECT 
    RecruitmentSource,
    ROUND(AVG(Tenure_Years), 2) AS avg_tenure,
    COUNT(*) AS total_hired
FROM hr_cleaned_data
GROUP BY RecruitmentSource
ORDER BY avg_tenure DESC;

/*PERFORMANCE & SATISFACTION
=================================================================================================*/
SELECT 
    PerformanceScore,
    ROUND(AVG(EmpSatisfaction), 2) AS avg_satisfaction,
    COUNT(*) AS total_employees
FROM hr_cleaned_data
GROUP BY PerformanceScore
ORDER BY avg_satisfaction DESC;

-- Higher performance scores correlate with higher satisfaction levels.


/*HIGH ABSENCE EMPLOYEES
=================================================================================================*/
SELECT 
    Employee_Name,
    Department,
    Absences,
    PerformanceScore
FROM hr_cleaned_data
WHERE Absences > (SELECT AVG(Absences) FROM hr_cleaned_data)
ORDER BY Absences DESC;

-- Top 5 Highest-Paid Employees
SELECT 
    Employee_Name,
    Department,
    Position,
    Salary
FROM hr_cleaned_data
ORDER BY Salary DESC
LIMIT 5;

-- Gender Diversity
SELECT 
    Sex,
    COUNT(*) AS total_employees,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_cleaned_data), 2) AS percentage
FROM hr_cleaned_data
GROUP BY Sex;

