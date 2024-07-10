SELECT count(job_postings_fact.job_id) as company_demanded,
       skills
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
WHERE job_title_short='Data Analyst' AND 
      job_location LIKE '% India'
GROUP BY skills
ORDER BY company_demanded DESC
LIMIT 10;