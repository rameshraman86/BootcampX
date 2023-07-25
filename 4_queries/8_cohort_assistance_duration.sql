select
  cohorts.name,
  sum(
    assistance_requests.completed_at - assistance_requests.started_at
  )
from
  cohorts
  join students on cohorts.id = students.cohort_id
  join assistance_requests on students.id = assistance_requests.student_id
group by
  cohorts.name;