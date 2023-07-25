select
  students.name,
  count(assistance_requests.*) as assistance_requests
from
  students
  join assistance_requests on assistance_requests.student_id = students.id
where
  students.name = 'Elliot Dickinson'
group by
  students.name;