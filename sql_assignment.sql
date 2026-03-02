create table employee(emp_id int,first_name varchar(30),last_name v,salary,joining_date,department,gender,job_title);

--create clone of existing table
create table employee_clone as select * from employee;

--get all employee details
select * from employee;

-- select top 1 record
select * from employee order by emp_id limit 1;

--select bottom 1 record
select * from employee order by emp_id desc limit 1;

--select random record
select * from employee order by random() limit 1;

--first_name in uppercase
select upper(first_name) as first_name_upper from employee;

--first name in lowercase
select lower(first_name) as first_name_lower from employee;

--create full name
select concat(first_name,' ',last_name) as full_name from employee;

select first_name||' '||last_name as full_name from employee;

--add hello to the firstname (concat operator || or concat() function)
select 'Hello '|| first_name as greeting from employee;

select concat('Hello',' ',first_name) as greeting from employee;

--select employee whose firstname is 'Malli'
select * from employee where first_name='Malli';

--whose firstname present in Malli,Meena,Anjali
select * from employee where first_name in('Malli','Meena','Anjali');

--whose firstname starts with 'V'
select * from employee where first_name like 'V%';

--whose first_name ends with 'i'
select * from employee where first_name like '%i';

--whose firstname contains 'o'
select * from employee where first_name like '%o%';

--whose firstname starts with any single character between m-v
select * from employee where first_name ~* '^[m-v]';

--whose firstname not starts with any single character between m-v
select * from employee where first_name !~* '^[m-v]';

--whose firstname starts with 'M' and contains 5 letters
select * from employee where first_name like 'M____';

--get all unique department values
select distinct department from employee; 

--count total records in a table
select count(*) as total_records from employee;

--first letter uppercase remaining lowercase
select upper(substring(first_name,1,1))||
lower(substring(first_name,2)) as formatted_name from employee;

--display all emp_names in one cell separated by comma
select string_agg(trim(first_name),',') as all_emp_names from employee;

--display lowest,highest,average,difference salaries
select min(salary) as lowest_salary from employee;
select max(salary) as highest_salary from employee;
select avg(salary) as avg_salary from employee;
select max(salary)-min(salary) as diff_salary from employee;

--percentage of diff between highest and lowest salaries
select max(salary) as highest_salary,min(salary) as lowest_salary,round((max(salary)-min(salary))/min(salary)*100,2) as perc_diff from employee;

--remove right side spaces
sele
--remove right side spaces
select rtrim(first_name) as first_name from employee;

--remove left side spaces
select ltrim(first_name) as first_name from employee;

--remove both left & right side spaces
select trim(first_name) as first_name from employee;

--count employees having 50k salary
select count(*)as total_employees from employee where salary=50000;

--Most recent hired employee in each department
select * from employee e where joining_date=(select max(joining_date) from 
employee where department=e.department);

--display first_name and gender as M/F
select first_name,case 
when gender='Male' then 'M'
when gender='Female' then 'F'
end as gender_short from employee;

--display first_name,salary and salary category
select first_name,salary,case 
when salary<50000 then 'low'
when salary between 50000 and 60000 then 'medium'
else 'high' end as salary_category from employee;

--display first_name,department and department classification
select first_name,department,case 
when department='IT' then 'Technical'
when department='HR' then 'Human Resource'
when department='Finance' then 'Accounting'
else 'Other' end as department_classification from employee;

--salary raise eligibility
select first_name,salary,case 
when salary<50000 then 'eligible for raise'
else 'Not eligible' end as raise_status from employee;

--Employment status based on joining date
select first_name,joining_date,case 
when joining_date<'2022-01-01' then 'Experienced'
else 'New Hire' end as employment_status from employee;

--calculate bonus amount
select first_name,salary,case 
when salary>60000 then salary*0.10
when salary between 50000 and 60000 then salary*0.07
else salary*0.05 end as bonus_amount from employee;

--display first_name,salary,seniority level
select first_name,salary,case 
when salary>60000 then 'senior'
when salary between 50000 and 60000 then 'midlevel'
else 'juniour'end as seniority_level from employee;

--department wise total salary desc
select department,sum(salary) as total_salary from employee 
group by department order by total_salary desc;

--job title assigned to more than one employee
select job_title from employee group by job_title having count(emp_id)>1;

--display department,total employees,total salary 
select department,count(emp_id) as total_employees,
sum(salary) as total_salary from employee group by department;

--dispaly department,avg salary order by salary asc
select department,avg(salary) as avg_salary from employee
group by department order by avg_salary asc;

--department wise employee count with size category
select department,count(*)as employee_count,case 
when count(*)>5 then 'Large'
when count(*) between 3 and 5 then 'Medium'
else 'Small' end as department_size from employee group by department;

--department wise avg salary with pay classification
select department,avg(salary) as avg_salary,case 
when avg(salary)>60000 then 'High pay'
when avg(salary) between 50000 and 60000 then'Medium pay'
else 'Low pay' end as pay_level from employee group by department;

--department,gender and employee count
select department,gender,count(*) as employee_count from employee
group by department,gender order by department,gender;

--year wise hiring trend classification
select count(*) as total_hires,extract(year from joining_date) as joining_year,case
when count(*)>5  then 'High hiring'
when count(*) between 3 and 5 then'Moderate hiring'
else 'Low hiring' end as hiring_trend from employee group by joining_year;

--department wise count of employees earning>60000
select department,count(*) as high_earners,case 
when count(*)>2 then 'High_paying Team'
else 'Normal Team' end as team_category from employee 
where salary>60000 group by department;

--Extract year,month,day & current date
select joining_date,extract(year from joining_date) as year,
extract(month from joining_date) as month,
extract(day from joining_date) as day,
current_date from employee;

--difference between joining_date and current_date
select joining_date,current_date-joining_date as days_difference,
(date_part('year',age(current_date,joining_date))*12+date_part('month',age(current_date,
joining_date))) as months_difference from employee;

--employees whose joining year is 2020
select * from employee where extract(year from joining_date)=2020;

--whose joining date between '2021-01-01' and '2021-12-01'
select * from employee where joining_date between '2021-01-01' and '2021-12-01';




















