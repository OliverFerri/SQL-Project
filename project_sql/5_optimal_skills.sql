/*
Question: What are the most optimal skills to learn(high demand and high pay)?
- Identify skills in demand and associated with high average salaries for Data Analyst roles.
- Concentrate on remote positions with specified salaries.
- Why? Targets skills that offer job secruity (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis.
*/

WITH 
top_demand AS (
    SELECT sj.skill_id, skills, COUNT(f.job_id) AS skill_count
    FROM job_postings_fact f
    JOIN skills_job_dim sj ON f.job_id = sj.job_id
    JOIN skills_dim s ON sj.skill_id = s.skill_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND (job_location LIKE '%Dallas%' OR job_location = 'Anywhere')
    GROUP BY skill_id
), 
top_avg_salary AS (
    SELECT sj.skill_id, skills,  ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact f
    JOIN skills_job_dim sj ON f.job_id = sj.job_id
    JOIN skills_dim s ON sj.skill_id = s.skill_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND (job_location LIKE '%Dallas%' OR job_location = 'Anywhere')
    GROUP BY skill_id
)

SELECT 
    d.skill_id,
    d.skills,
    skill_count,
    avg_salary
FROM top_demand d
JOIN top_avg_salary s ON d.skill_id = s.skill_id
ORDER BY skill_count DESC, avg_salary DESC
LIMIT 25;