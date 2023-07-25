select
  teachers.name as teacher,
  students.name as student,
  assignments.name as assignment,
  (
    assistance_requests.completed_at - assistance_requests.started_at
  ) as assistance_request_duration
from
  assistance_requests
  join teachers on assistance_requests.teacher_id = teachers.id
  join students on assistance_requests.student_id = students.id
  join assignments on assistance_requests.assignment_id = assignments.id
order by
  assistance_request_duration;