/*
Question: What are the top skills based on salary?
- Look at the average salary associated with skills for Data Analyt positions.
- Focus on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary leavels for Data Analysts and
  helps identify the most financially rewarding skills.
*/

SELECT skills, ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact f
JOIN skills_job_dim sj ON f.job_id = sj.job_id
JOIN skills_dim s ON sj.skill_id = s.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND (job_location LIKE '%Dallas%' OR job_location = 'Anywhere')
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;

/*
1. Top Tier Skills (>$150k avg salary)

PySpark leads strongly at $208k — this is the clear standout.
Bitbucket ($189k) is surprisingly high, likely tied to senior/engineering-heavy data roles that involve heavy CI/CD and version control.
Niche/specialized tools like Couchbase, Watson, DataRobot (~$155–160k) show that expertise in specific enterprise or AI platforms commands big premiums.

2. Major Trend: Big Data & Modern Data Engineering
Skills associated with scalable data processing are dominating the top of the list:

PySpark, Databricks, Pandas, NumPy, Airflow, Elasticsearch — all in the top half.
This reflects that high-paying Data Analyst jobs are increasingly overlapping with Data Engineering responsibilities (building pipelines, handling large datasets).

3. Cloud & DevOps Rising Fast

GCP, Azure, GitLab, Bitbucket, Atlassian, Jenkins all appear.
Companies are willing to pay significantly more for analysts who can work in cloud environments and collaborate using modern dev tools.

4. Programming Languages Matter

Golang (Go), Swift, Scala are paying very well ($123k–$154k).
Python ecosystem tools (Pandas, NumPy, Scikit-learn, Jupyter) are also very strong — showing Python remains king but specialized languages add a premium.

5. Database & Infrastructure Skills

Strong performers: PostgreSQL, Elasticsearch, DB2, Couchbase.
Traditional databases (like DB2) still pay decently in legacy enterprise environments.

Summary of Trends:

Highest rewards go to Big Data tools (PySpark, Databricks) and specialized platforms.
There’s a clear blurring of lines between Data Analyst and Data Engineer roles — the best-paid “analyst” jobs require pipeline, cloud, and dev skills.
Python + Cloud + Big Data stack appears to be the golden combination for top compensation.
Niche tools (Watson, DataRobot, Swift, etc.) can give big salary boosts in specific industries/companies.
*/

/*
JSON Results:

[
  {
    "skills": "pyspark",
    "avg_salary": "208173"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "145848"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "142422"
  },
  {
    "skills": "gcp",
    "avg_salary": "137500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125782"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "scala",
    "avg_salary": "123669"
  },
  {
    "skills": "airflow",
    "avg_salary": "122169"
  },
  {
    "skills": "crystal",
    "avg_salary": "120100"
  },
  {
    "skills": "jenkins",
    "avg_salary": "116577"
  },
  {
    "skills": "db2",
    "avg_salary": "115758"
  },
  {
    "skills": "azure",
    "avg_salary": "115041"
  }
]
*/