-- Identify attrition patterns across departments and job roles
-- Analyze impact of salary, overtime, and experience
-- Discover high-risk employee segments
-- Calculate attrition rates for business insights


-- fetch all table data
select * from employee_attrition;


-- 1. Total Attrition Count
select attrition, 
	   count(*) as total
from employee_attrition
group by attrition;


-- 2. Attrition by Department
select department, 
       sum(case when attrition = 'yes' then 1 else 0 end ) as total_attrition
from employee_attrition
group by department
order by total_attrition desc;



-- 3. Attrition by Job Role
select job_role,
	   count(*) as lost_job
from employee_attrition
where attrition = 'yes'
group by job_role
order by lost_job desc;



-- 4. Average Monthly Income by Department
select department,
		round(avg(monthly_income),2) as average_income
from employee_attrition
group by department;



-- 5. Overtime vs Attrition
SELECT over_time,
       COUNT(*) AS total_attrition
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY over_time;



-- 6. Attrition by Age Group & Gender
select 
	case
		when age < 30 then 'under 30'
        when age < 40 then 'under 40'
        else 'above 40'
        end as age_group,
        gender,
        count(*) as total_attrition
from employee_attrition
where attrition = 'yes'
group by gender, age_group
order by gender desc, age_group desc;



-- 7. Attrition Rate by Department
select department,
		round(sum(case when attrition = 'yes' then 1 else 0 end) * 100 / count(*),2) as attrition_rate
from employee_attrition
group by department
order by attrition_rate;



-- 8. Top 3 Job Roles with Highest Attrition
select job_role, 
		count(*) as lost_job
from employee_attrition
where attrition = 'yes'
group by job_role
order by lost_job desc
limit 3;



-- 9. Attrition by Years at Company (< 5 years)
SELECT 
    years_at_company,
    COUNT(*) AS number_of_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employee_attrition
where years_at_company < 5
GROUP BY years_at_company
ORDER BY years_at_company ;



-- 10. Top 5 Common Attrition Profiles
SELECT 
    Job_Role,
    Marital_Status,
    education_field,
    Over_Time,
    COUNT(*) AS attrition_count
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Job_Role, Marital_Status, education_field, Over_Time
ORDER BY attrition_count DESC
LIMIT 5;























