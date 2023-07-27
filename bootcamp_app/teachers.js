const { Pool } = require('pg');
const pool = new Pool();

pool.query(
  `select
    distinct teachers.name as teacher,
    cohorts.name as cohorts
  from
    teachers
    join assistance_requests on teachers.id = assistance_requests.teacher_id
    join students on students.id = assistance_requests.student_id
    join cohorts on cohorts.id = students.cohort_id
  where
    cohorts.name = '${process.argv[2]}'
  order by
    teachers.name`
)
  .then(res => res.rows.forEach(teacher => {
    console.log(`${teacher.cohorts} : ${teacher.teacher}`);
  })
  )
  .catch(err => console.error('Error: ', err.stack));
