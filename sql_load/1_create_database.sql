
    
    --january jobs
    CREATE TABLE january_jobs AS
    SELECT*
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1;

    --February jobs
       CREATE TABLE February_jobs AS
    SELECT*
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 2;

  --March jobs
       CREATE TABLE March_jobs AS
    SELECT*
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 3;

