-- Procedure 1 Count all employees
delimiter  //
drop procedure if exists count_employees//
create procedure count_employees(out total int)
begin
	Select count(*) into total 
	From employees;
select total as "Total number of employees";
end //
delimiter ;

call count_employees(@total)

-- procedure 2 count all female employees
delimiter //
drop procedure if exists count_female_employees //

create procedure count_female_employees(IN gender char(1), OUT total INT)
BEGIN
	select count(*) into total
    FROM employees as emp
    WHERE emp.gender=gender;
SELECT total as "Total Female employees";
END //
delimiter ;

call count_female_employees('F', @total);

-- procedure 3: display average salary by department name
delimiter //
drop procedure if exists avgSalaryByDept //

create procedure avgSalaryByDept(IN department varchar(50), OUT avgSalary float)
BEGIN
	select avg(s.salary) INTO avgSalary
    FROM salaries as s
    INNER JOIN dept_emp USING (emp_no)
    INNER JOIN departments as de USING(dept_no)
    WHERE de.dept_name = department;
Select avgSalary as "average salary by department";
END //
delimiter ;

call avgSalaryByDept('Finance', @avgSalary);

-- procedure 4:  count number of departments 
delimiter //
drop procedure if exists count_dept//

create procedure count_dept(out total int)
begin
	Select count(*) into total 
	From departments;
select total as "Total number of departments";
end //
delimiter ;

call count_dept(@total);

-- procedure 5: get highest paid salary by title 

delimiter //
drop procedure if exists highest_paid_salary_by_title//

create procedure highest_paid_salary_by_title(in title varchar(50), out maxSalary float)
begin
	select max(s.salary) INTO maxSalary
    FROM salaries as s
    INNER JOIN titles t
    On s.emp_no = t.emp_no
    Where t.title = title;
select maxSalary as "Highest Paid Salary";
end //
delimiter ;

call  highest_paid_salary_by_title("Engineer", @maxSalary);





