USE hr_analytics;

-- What is each employee’s name, department, performance score, and satisfaction?
SELECT 
    e.Employee_Name,
    e.Department,
    p.PerformanceScore,
    p.EmpSatisfaction
FROM employees e
INNER JOIN performance p 
    ON e.EmpID = p.EmpID;

-- Show every employee and their total absences  even if some don’t have attendance data.
SELECT 
    e.Employee_Name,
    e.Department,
    a.Absences,
    a.DaysLateLast30
FROM employees e
LEFT JOIN attendance a 
    ON e.EmpID = a.EmpID;
    
    
-- Does higher performance lead to fewer absences and higher salary
SELECT 
    e.Employee_Name,
    e.Department,
    e.Salary,
    p.PerformanceScore,
    a.Absences
FROM employees e
JOIN performance p ON e.EmpID = p.EmpID
JOIN attendance a ON e.EmpID = a.EmpID
ORDER BY p.PerformanceScore DESC, a.Absences ASC;


-- Do high performers get paid more?
SELECT 
    p.PerformanceScore,
    ROUND(AVG(e.Salary), 2) AS avg_salary
FROM employees e
JOIN performance p ON e.EmpID = p.EmpID
GROUP BY p.PerformanceScore
ORDER BY avg_salary DESC;

-- Which low-performing employees are often absent?
SELECT 
    e.Employee_Name,
    e.Department,
    p.PerformanceScore,
    a.Absences
FROM employees e
JOIN performance p ON e.EmpID = p.EmpID
JOIN attendance a ON e.EmpID = a.EmpID
WHERE p.PerformanceScore = 'No' 
  AND a.Absences > (SELECT AVG(Absences) FROM attendance)
ORDER BY a.Absences DESC;

-- Which manager’s team has the highest average performance?

SELECT 
    e.ManagerName,
    ROUND(AVG(p.EmpSatisfaction), 2) AS avg_satisfaction,
    ROUND(AVG(a.Absences), 2) AS avg_absences
FROM employees e
JOIN performance p ON e.EmpID = p.EmpID
JOIN attendance a ON e.EmpID = a.EmpID
GROUP BY e.ManagerName
ORDER BY avg_satisfaction DESC;




