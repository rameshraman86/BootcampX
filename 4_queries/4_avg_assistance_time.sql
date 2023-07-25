SELECT
  avg(completed_at - started_at) as average_assistance_req_duration
FROM
  assistance_requests;