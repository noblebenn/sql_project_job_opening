WITH salary_avg AS(
SELECT
    round(avg(salary_year_avg),2) as average_salary,skills,
    skills_dim.skill_id
from job_postings_fact
INNER JOIN skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
WHERE job_title_short='Data Analyst' 
    AND job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY skills_dim.skill_id),
 demand AS(
SELECT count(job_postings_fact.job_id) as company_demanded,
       skills, skills_dim.skill_id
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
WHERE job_title_short='Data Analyst' AND 
      job_work_from_home = TRUE AND
          salary_year_avg IS NOT NULL

GROUP BY skills_dim.skill_id
)

select salary_avg.skills,
    salary_avg.skill_id,
    company_demanded,
    average_salary
from salary_avg
INNER JOIN demand ON demand.skill_id=salary_avg.skill_id
WHERE company_demanded>10
oRDER BY average_salary DESC,
    company_demanded DESC
         
LIMIT 25;


-- or we can write all the query in the below given code

SELECT
     skills_dim.skill_id,
     skills_dim.skills,
     count(job_postings_fact.job_id) as job_count,
     round(avg(job_postings_fact.salary_year_avg),2) as sala_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id=job_postings_fact.job_id
INNER JOIN skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
WHERE job_title_short like 'Data Analyst' AND 
      job_location like '%India' AND
          salary_year_avg IS NOT NULL 
GROUP BY skills_dim.skill_id
HAVING count(job_postings_fact.job_id) >10
oRDER BY sala_avg DESC,
    job_count DESC
         
LIMIT 25;

