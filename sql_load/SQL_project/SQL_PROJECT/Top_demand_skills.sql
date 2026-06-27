/*
Question : What are the most  in-demand skills for data analysts
-Identify the top 5 in- demans skills for data analyst
-focus on all job postings
*/

SELECT
sd.skills,
COUNT(j.job_id) AS job_count
FROM skills_dim sd
INNER JOIN skills_job_dim sj ON sj.skill_id = sd.skill_id
INNER JOIN job_postings_fact j ON j.job_id =sj.job_id
WHERE j.job_title_short ='Data Analyst'
GROUP BY sd.skills
ORDER BY job_count DESC
LIMIT 5
