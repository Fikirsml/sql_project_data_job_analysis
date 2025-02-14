select 
skills, 
count(skills) as ondemand_skills, 
round(avg(salary_year_avg),0)as avg_salary
from job_postings_fact jp
inner join skills_job_dim sj on jp.job_id=sj.job_id
inner join skills_dim s on sj.skill_id=s.skill_id
where jp.job_title_short='Data Analyst' and jp.salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY 
ondemand_skills DESC,
avg_salary DESC 
limit 25;