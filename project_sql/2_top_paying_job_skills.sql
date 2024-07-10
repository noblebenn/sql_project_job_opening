WITH top_paying_job AS(
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,name as comapny_name
FROM job_postings_fact
LEFT JOIN company_dim on company_dim.company_id=job_postings_fact.company_id
WHERE job_title_short='Data Analyst' AND
    job_location LIKE'%India' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC

)

SELECT top_paying_job.*, skills
FROM top_paying_job
INNER JOIN skills_job_dim ON skills_job_dim.job_id=top_paying_job.job_id
INNER JOIN skills_dim ON skills_dim.skill_id=skills_job_dim.skill_id
ORDER BY salary_year_avg DESC