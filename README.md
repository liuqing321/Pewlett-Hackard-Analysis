# Pewlett-Hackard-Analysis
## Overview of the analysis

The purpose of this analysis is to determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. 

## Results

* In the retirement_titles table, we could see that each employee has several titles. With time went by, the employees' titles could be changed due to the promotion or demotion. 
* There is a large demand for senior Engineer, Senior staff, engineer and staff. Meanwhile, only 2 manager positions will be available. 
 
 ![Retiring title count](https://user-images.githubusercontent.com/88631769/137415190-87cf71d2-75e8-4dff-8eac-0f132e0a5806.PNG)

* The total amount of employees who are eligible for the mentor program is 1549.  
  ![image](https://user-images.githubusercontent.com/88631769/137415299-5507c818-e933-45f0-8f98-49d1c556f498.png)

* Most of the employees who are eligiable for the mentor program have Staff title. Assistant engineer position has the least amount of eligible mentor.
 
  ![Mentorship count](https://user-images.githubusercontent.com/88631769/137415217-e3fb3c5d-9799-44fa-9850-0a2538ba6076.PNG)

## Summary 

### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

![total amount of title](https://user-images.githubusercontent.com/88631769/136491966-b82ffaec-32b5-4ed2-a709-5c59f5d539fc.PNG)

        select count(emp_no) total_titles from unique_titles;

* There are 90,398 roles need to be filled. 

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

![student per mentor](https://user-images.githubusercontent.com/88631769/136491218-ea9a04df-7af8-4621-83eb-eea6aaf10f3f.PNG)

        select r.title,r.amount,n.emp_amount
        into table2
        from retiring_titles r
        join new_table n on r.title=n.title
        order by emp_amount; 

        select title,amount,emp_amount,(amount/emp_amount) student_per_mentor from table2
        order by student_per_mentor desc;

* If the company has decided to hire 90,398 new employees at the same time, there won't be enough mentors for employees who work as senior staff. For each mentor on senior staff position, he or she will tutor 194 employees in total. Also, the situation would be tough for the mentors who are working as engineers or assistant engineers. For those who works as engineers or assistant engineers, each of them will tutor more than 60 new-hires. 

* If the company decided to replenish the team gradually, the pressure on training the new-hires would be released. Additionally, the company could record the training video or publish manuals for the new-hires. So it won't be difficult for one employee to tutor hundreds of new-hires at the same time. 
