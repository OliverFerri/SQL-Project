/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles hat are available remotely.
- Focuses on job postings with specified salaries (removes nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, ofering insights into employment
*/

/*
to search for general data anaylst, change salary average from hour to year
and remove job_title condition and change to job_tite_short = 'Data Analyst'
*/

WITH top_jobs AS (
    SELECT
        DENSE_RANK() OVER (ORDER BY salary_hour_avg DESC) AS rnk,
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_hour_avg,
        job_title_short,
        company_id,
        CAST(job_posted_date AS DATE) AS job_posted_date
    FROM job_postings_fact
    WHERE 
        job_title LIKE '%tableau%'
        AND salary_hour_avg IS NOT NULL
        AND job_location = 'Anywhere'
)

SELECT 
    job_id,
    job_title,
    job_title_short,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_hour_avg,
    job_posted_date
FROM top_jobs j
JOIN company_dim c ON j.company_id = c.company_id
WHERE rnk <= 12;