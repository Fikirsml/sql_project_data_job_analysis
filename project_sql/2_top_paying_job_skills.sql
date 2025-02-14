with top_paying_jobs as (
    select 
    j.job_id,
    c.name as company_name,
    j.job_title,
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
    limit 10
)




select
tp.* ,skills
from top_paying_jobs tp
inner join skills_job_dim sj 
on tp.job_id=sj.job_id
inner join skills_dim s
on sj.skill_id=s.skill_id
order by tp.salary_year_avg DESC