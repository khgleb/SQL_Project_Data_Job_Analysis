/*
Problem: what are the top-paying Business Analyst jobs?
- Identify the top 10 highest paying Business Analyst roles that have Full-time schedules.
- Focuses on job postings with specified salaries (NOT NULL).
*/

SELECT
    jpf.job_id,
    cd.name AS company_name,
    jpf.job_title,
    jpf.job_location,
    jpf.job_schedule_type,
    jpf.salary_year_avg,
    jpf.job_posted_date
FROM
    job_postings_fact AS jpf
LEFT JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE
    jpf.job_title = 'Business Analyst' AND
    jpf.job_schedule_type = 'Full-time' AND
    jpf.salary_year_avg IS NOT NULL
ORDER BY
    jpf.salary_year_avg DESC
LIMIT 10;