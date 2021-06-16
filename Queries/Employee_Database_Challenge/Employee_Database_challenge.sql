SELECT e.emp_no,
       e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title
INTO Unique_Titles
FROM retirement_titles AS r
ORDER BY emp_no, to_date DESC;


SELECT COUNT(u.title), title
INTO retiring_titles
FROM unique_titles AS u
GROUP BY u.title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles

SELECT DISTINCT ON (e.emp_no) e.emp_no,
       e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   t.title
INTO mentor_elig
FROM employees e, dept_emp de, titles t
WHERE (e.emp_no = de.emp_no) AND (e.emp_no = t.emp_no) AND
de.to_date = ('9999-01-01') AND e.birth_date BETWEEN ('1965-01-01') AND ('1965-12-31')
ORDER BY e.emp_no;					


SELECT * FROM mentor_elig

