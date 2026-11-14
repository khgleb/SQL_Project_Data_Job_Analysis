/*
Problem: identify the most demanded skills for Business Analyst roles.
*/

SELECT
    skills,
    COUNT(job_postings_fact.job_id) AS demand_for_skill
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst'
GROUP BY
    skills
ORDER BY
    demand_for_skill DESC
LIMIT 10;