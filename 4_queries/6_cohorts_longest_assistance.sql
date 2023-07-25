SELECT
  cohorts.name,
  avg(
    assistance_requests.completed_at - assistance_requests.started_at
  ) as average_assistance_req_duration
FROM
  students
  join cohorts on cohorts.id = students.cohort_id
  join assistance_requests ON assistance_requests.student_id = students.id
group by
  cohorts.name
order by
  average_assistance_req_duration DESC
LIMIT
  1;