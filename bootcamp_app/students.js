const { Pool } = require('pg');
// const pool = new Pool();

const pool = new Pool({
  user: 'vagrant',
  password: '1234',
  host: 'localhost',
  database: 'rameshraman'
});


// const input = process.argv.slice(2);
pool.query(`
    SELECT 
      s.id, 
      s.name as student, 
      c.name as cohort
    FROM 
      students as s
    JOIN 
      cohorts as c ON c.id = s.cohort_id
    WHERE 
      c.name LIKE '${process.argv[2]}%'
    LIMIT 
      ${process.argv[3] || 5 } ;
`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.student} has an id of ${user.id} and was in cohort ${user.cohort}`);
    });
  })
  .catch(err => console.error(`error: `, err.stack));


