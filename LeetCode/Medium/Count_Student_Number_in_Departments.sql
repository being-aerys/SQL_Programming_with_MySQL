SELECT D.dept_name, COUNT(student_id) AS student_number
FROM department D
         LEFT JOIN student S
                   ON D.dept_id = S.dept_id
GROUP BY D.dept_name
ORDER BY student_number DESC, D.dept_name;