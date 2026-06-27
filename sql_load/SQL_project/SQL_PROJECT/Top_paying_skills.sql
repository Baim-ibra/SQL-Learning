
/*
Answer : What are the top skills based on salary?
-look at the average salary asociated with each skill for data analyst positions
-focuses on role with specified salaries, regardless of location
-why?it reveals how different skills impact salary levels for data analyst and 
 helps identify the most financially rewarding skills to acquire or improve
 */

SELECT
skills,
ROUND(AVG(salary_year_avg),2) AS avg_sal
FROM job_postings_fact j
INNER JOIN skills_job_dim sj ON sj.job_id =j.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sj.skill_id
WHERE j.salary_year_avg IS NOT NULL
AND j.job_title_short = 'Data Analyst'
AND j.job_work_from_home  = True
GROUP BY skills
ORDER BY avg_sal DESC
LIMIT 25