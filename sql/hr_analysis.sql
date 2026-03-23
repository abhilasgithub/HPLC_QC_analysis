-- ============================================
-- HR Attrition Analysis SQL Queries
-- Project: Employee Attrition Dashboard
-- ============================================

-- 1. Create HR Table
CREATE TABLE IF NOT EXISTS hr_data (
    emp_id VARCHAR(10) PRIMARY KEY,
    age INT,
    department VARCHAR(50),
    job_role VARCHAR(50),
    gender VARCHAR(10),
    education VARCHAR(20),
    monthly_income DECIMAL(10,2),
    years_at_company INT,
    job_satisfaction INT,
    work_life_balance INT,
    overtime VARCHAR(5),
    attrition VARCHAR(5)
);

-- 2. Overall Attrition Rate
SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data;

-- 3. Attrition by Department
SELECT 
    department,
    COUNT(*) AS total,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY department
ORDER BY attrition_rate DESC;

-- 4. Attrition by Overtime
SELECT 
    overtime,
    COUNT(*) AS total,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY overtime;

-- 5. Avg Income: Attrited vs Retained
SELECT 
    attrition,
    ROUND(AVG(monthly_income), 2) AS avg_income,
    ROUND(AVG(age), 1) AS avg_age,
    ROUND(AVG(years_at_company), 1) AS avg_tenure
FROM hr_data
GROUP BY attrition;

-- 6. Job Satisfaction Impact
SELECT 
    job_satisfaction,
    COUNT(*) AS total,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY job_satisfaction
ORDER BY job_satisfaction;

-- 7. Attrition by Age Group
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 40 THEN '30-40'
        ELSE 'Above 40'
    END AS age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY age_group;

-- 8. Gender-wise Attrition
SELECT 
    gender,
    COUNT(*) AS total,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_data
GROUP BY gender;
