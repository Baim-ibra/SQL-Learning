/*
Answer what are the  most optimal skills to learn (aka its in high demand and high paying skill)??
-identify skills in high demand and associated with high average salaries for data analyst roles
-concentrates on remote positions with specified salaries
-why? target skills that offer job security (high demand) anad financial benefits(high salaries),
offering strategic insight for careee in data analysis
*/
-- CTE to find Top skills demand for data analyst

WITH job_demand AS (
SELECT
sd.skill_id,
sd.skills,
COUNT(j.job_id) AS job_count
FROM job_postings_fact j
INNER JOIN skills_job_dim sj ON sj.job_id = j.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sj.skill_id
WHERE j.job_title_short ='Data Analyst'
AND j.salary_year_avg IS NOT NULL
AND j.job_work_from_home = True
GROUP BY sd.skill_id
),

--CTE to find top high paying skills for data analyst

skills_pay AS (
SELECT
sd.skill_id,
sd.skills,
ROUND(AVG(salary_year_avg),0) AS avg_sal
FROM job_postings_fact j
INNER JOIN skills_job_dim sj ON sj.job_id = j.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sj.skill_id
WHERE j.job_title_short ='Data Analyst'
AND j.salary_year_avg IS NOT NULL
AND j.job_work_from_home = True
GROUP BY sd.skill_id
)

SELECT
    jd.skill_id,
    jd.skills,
    jd.job_count,
    sp.avg_sal
FROM job_demand jd
JOIN skills_pay sp
    ON jd.skill_id = sp.skill_id
ORDER BY
    jd.job_count DESC,
    sp.avg_sal DESC;
