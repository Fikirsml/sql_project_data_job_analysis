select 
j.job_id,
c.name as company_name,
j.job_title,
j.job_location,
j.job_schedule_type,
j.job_posted_date:: date,
j.salary_year_avg
from 
job_postings_fact j
LEFT JOIN company_dim c on j.company_id=c.company_id
where 
j.job_title_short='Data Analyst' AND 
j.salary_year_avg is not null AND 
j.job_location = 'Anywhere'
ORDER BY
j.salary_year_avg DESC
limit 10;