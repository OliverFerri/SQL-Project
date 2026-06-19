/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2.
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
  providing insights into the most valuable skills for job seekers.
*/

SELECT skills, COUNT(f.job_id) AS skill_count
FROM job_postings_fact f
JOIN skills_job_dim sj ON f.job_id = sj.job_id
JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND (job_location LIKE '%Dallas%' OR job_location = 'Anywhere')
GROUP BY skills
ORDER BY skill_count DESC
LIMIT 5;