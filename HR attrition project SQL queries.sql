create database HR_analytics;
use HR_analytics;

-- KPI 1: Total Employees, Active vs Ex-Employees (Card Visual)
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'No'  THEN 1 ELSE 0 END) AS active_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS ex_employees
FROM `hr dataset csv`;


-- KPI 2: Overall Attrition Rate % (Card Visual)
SELECT
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
    AS attrition_rate_pct
FROM `hr dataset csv`;


-- KPI 3: Average Age of Employees (Card Visual)
SELECT
    ROUND(AVG(Age), 0) AS avg_age
FROM `hr dataset csv`;


-- KPI 4: Attrition Count by Department (Bar Chart)
SELECT
    Department,
    COUNT(*)  AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM `hr dataset csv`
GROUP BY Department
ORDER BY attrition_rate_pct DESC;


-- KPI 5: Attrition by Job Role (Bar / Table Visual)
SELECT
    `Job Role`,
    COUNT(*)  AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM `hr dataset csv`
GROUP BY `Job Role`
ORDER BY attrition_rate_pct DESC;

-- KPI 6: Attrition by Age Band (Donut / Bar Chart)
SELECT
    `CF_age band` AS age_band,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM `hr dataset csv`
GROUP BY `CF_age band`
ORDER BY attrition_count DESC;


-- KPI 7: Attrition by Gender (Donut Chart)
SELECT
    Gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM `hr dataset csv`
GROUP BY Gender;


-- KPI 8: Attrition by Marital Status
SELECT
    `Marital Status`,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM `hr dataset csv`
GROUP BY `Marital Status`
ORDER BY attrition_rate_pct DESC;


-- KPI 9: Impact of Overtime on Attrition
SELECT
    `Over Time`,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM `hr dataset csv`
GROUP BY `Over Time`
ORDER BY attrition_rate_pct DESC;


-- KPI 10: Attrition by Business Travel
SELECT
    `Business Travel`,
    COUNT(*)  AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM `hr dataset csv`
GROUP BY `Business Travel`
ORDER BY attrition_rate_pct DESC;


-- KPI 11: Average Monthly Income — Attrition vs Active
SELECT
    Attrition,
    ROUND(AVG(`Monthly Income`), 2)  AS avg_monthly_income,
    ROUND(AVG(Age), 0)  AS avg_age,
    ROUND(AVG(`Years At Company`), 1) AS avg_years_at_company
FROM `hr dataset csv`
GROUP BY Attrition;


-- KPI 12: Attrition by Job Satisfaction Score
SELECT
    `Job Satisfaction`,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM `hr dataset csv`
GROUP BY `Job Satisfaction`
ORDER BY `Job Satisfaction`;


-- KPI 13: Attrition by Education Field
SELECT
    `Education Field`,
    COUNT(*)  AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM `hr dataset csv`
GROUP BY `Education Field`
ORDER BY attrition_rate_pct DESC;


-- KPI 14: Rank Job Roles by Attrition Rate (Window Function + CTE)
WITH role_attrition AS (
    SELECT
        `Job Role`,
        COUNT(*)  AS total_employees,
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
        ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
    FROM `hr dataset csv`
    GROUP BY `Job Role`
)
SELECT
    `Job Role`,
    total_employees,
    attrition_count,
    attrition_rate_pct,
    RANK() OVER(ORDER BY attrition_rate_pct DESC) AS attrition_rank
FROM role_attrition;


-- KPI 15: At-Risk Employees (Active + Overtime + Low Satisfaction)
SELECT
    `Employee Number`,
    Gender,
    Age,
    Department,
    `Job Role`,
    `Monthly Income`,
    `Job Satisfaction`,
    `Work Life Balance`,
    `Over Time`
FROM `hr dataset csv`
WHERE Attrition = 'No'
AND `Over Time` = 'Yes'
AND `Job Satisfaction` <= 2
AND `Work Life Balance` <= 2
ORDER BY `Monthly Income` ASC;
