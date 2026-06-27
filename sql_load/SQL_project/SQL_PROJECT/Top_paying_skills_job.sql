/*Question : What skills are required for the top data analyst jobs
- Use top 10 highest - paying Data Analyst jobs from first query
- Add specific skills required for the roles
- Why? it provides detaile look at which high -paying job demand certain skills
*/

WITH Top_paying_jobs AS (
SELECT
job_id,
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
LIMIT 10)

SELECT
Top_paying_jobs.*,
sd.skills
FROM Top_paying_jobs 
INNER JOIN skills_job_dim sj ON sj.job_id = Top_paying_jobs.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sj.skill_id 
ORDER BY salary_year_avg DESC