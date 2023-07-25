select
  distinct teachers.name,
  cohorts.name
from
  teachers
  join assistance_requests on teachers.id = assistance_requests.teacher_id
  join students on students.id = assistance_requests.student_id
  join cohorts on cohorts.id = students.cohort_id
where
  cohorts.name = 'JUL02'
order by
  teachers.name;