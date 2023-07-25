select
  teachers.name,
  count(assistance_requests.*) as total_assistances
from
  teachers
  join assistance_requests on assistance_requests.teacher_id = teachers.id
where
  teachers.name = 'Waylon Boehm'
group by
  teachers.name;