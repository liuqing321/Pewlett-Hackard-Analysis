-- D1:The Number of Retiring Employees by Title
-- create new table 
select e.emp_no,e.first_name,e.last_name,ti.title,ti.from_date,ti.to_date
into title_info
from employees e 
join title ti on e.emp_no=ti.emp_no
where e.birth_date between '1952-01-01' AND '1955-12-31'
order by e.emp_no asc; 

select * from title_info; 

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no)emp_no,first_name,last_name,title
into unique_titles
from title_info
order by emp_no asc,to_date desc; 

select count(emp_no) total_titles from unique_titles;

-- Creating retiring_titles table. 

select count(emp_no) amount,title
into retiring_titles
from unique_titles
group by title
order by count(emp_no) desc;

select * from retiring_titles;


--D2:The Employees Eligible for the Mentorship Program

select distinct on(e.emp_no)e.emp_no,e.first_name,e.last_name,e.birth_date,de.from_date,de.to_date,ti.title
into mentorship_info
from employees e 
join dept_emp de on de.emp_no=e.emp_no
join title ti on e.emp_no=ti.emp_no
where (e.birth_date between '1965-01-01' AND '1965-12-31') and (de.to_date='9999-01-01')
order by e.emp_no asc;

select * from mentorship_info;

select count(emp_no) emp_amount,title
into new_table 
from mentorship_info
group by title
order by emp_amount desc; 

select count(emp_no) from mentorship_info; 

select r.title,r.amount,n.emp_amount
into table2
from retiring_titles r
join new_table n on r.title=n.title
order by emp_amount; 

select title,amount,emp_amount,(amount/emp_amount) student_per_mentor from table2
order by student_per_mentor desc;

