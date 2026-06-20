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

SELECT
    DENSE_RANK() OVER (ORDER BY salary_hour_avg DESC) AS rnk,
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_hour_avg,
    job_title_short,
    f.company_id,
    CAST(job_posted_date AS DATE) AS job_posted_date
FROM job_postings_fact f
JOIN company_dim c ON f.company_id = c.company_id
WHERE 
    job_title LIKE '%tableau%'
    AND salary_hour_avg IS NOT NULL
    AND job_location = 'Anywhere'
LIMIT 12;