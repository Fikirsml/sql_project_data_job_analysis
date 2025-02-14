select skills, count(skills) as ondemand_skills
from job_postings_fact jp
inner join skills_job_dim sj on jp.job_id=sj.job_id
inner join skills_dim s on sj.skill_id=s.skill_id
where jp.job_title_short='Data Analyst' and jp.job_location='Anywhere'
GROUP BY skills
ORDER BY ondemand_skills DESC
limit 10;