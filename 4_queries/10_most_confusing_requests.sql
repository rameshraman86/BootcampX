select
  assignments.id as id,
  assignments.day as day,
  assignments.chapter as chapter,
  assignments.name as name,
  count(assistance_requests.id) as total_requests
from
  assignments
  join assistance_requests on assignments.id = assistance_requests.assignment_id
group by
  assignments.id
order by
  total_requests DESC;