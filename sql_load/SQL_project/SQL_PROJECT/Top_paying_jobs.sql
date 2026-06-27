/*
Question : What are the top paying data analyst jobs ?
- Identify the top 10 highest paying data analyst roles that are avilable remotely.
- Focuese on job posting with specified salaries (remove nulls).
-why? highlight the top - paying opportunities for data analysts, offering insights into emplyee
*/

SELECT
 job_id,
cd.name AS company_name,
job_title_short,
job_title,
job_work_from_home,
job_location,
job_schedule_type,
salary_rate,
salary_year_avg,
salary_hour_avg

FROM job_postings_fact j 
LEFT JOIN company_dim cd ON cd.company_id = j.company_id
WHERE j.job_title_short = 'Data Analyst' 
AND  job_work_from_home = TRUE
AND salary_year_avg IS NOT NULL 
ORDER BY j.salary_year_avg DESC
LIMIT 10