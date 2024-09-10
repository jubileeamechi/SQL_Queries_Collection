-- Employees with first name containing 'o':
SELECT * FROM employee WHERE first_name like '%o%'; 

-- TO get details from employee table:
SELECT * FROM employee;

-- To get Employees firstname and lastname:
SELECT first_name, last_name FROM employee;

-- To get employees Firstname as Employeename:
SELECT first_name AS Employee_Name FROM employee;

-- To get employees Lastname in lowercase :
SELECT lower(last_name) FROM employee;

-- To get employees Lastname in Uppercase :
SELECT upper(Last_name) FROM employee;

-- To get unique Department:
SELECT DISTINCT department FROM employee;

-- To get employees lastname and firstname in a single column seperated by a '-':
SELECT CONCAT_WS('_', first_name, last_name) AS FullName FROM employee;

-- To get the Year, Month and Day From the Joining_date an employee: 
SELECT Employee_ID, year(joining_date) AS JoiningYear, month(joining_date) AS JoiningMonth, day(Joining_date) AS JoiningYear FROM employee;

-- To get employee firstname in ascending order and salary in descending order :
SELECT first_name, salary FROM employee ORDER BY First_name ASC, salary DESC;

-- To get employees with firstname that is neither Bob nor Alex :    
SELECT First_name FROM employee WHERE First_name != 'BOB' AND First_name != 'Alex';

-- To get details of employees with firstname ending with 'N' :
SELECT * FROM employee WHERE First_name LIKE '%n';

-- To get details of employee with firstname starting with 'J' and contains four letters :
SELECT * FROM employee WHERE First_name LIKE 'J___';

-- To create employee table with the following columns:-employeeID, Firstname, Lastname, Salary, joining date and department:
create table employees(
Employee_ID INT auto_increment,
First_Name varchar(50),
Last_Name varchar(50),
Salary decimal(8,0),
Joining_Date date NOT NULL,
Department varchar(50),
primary key(`Employee_ID`)
);

-- To get datails of employee with salary above 3,000,000 :
SELECT * FROM employee WHERE Salary>3000000;  

-- To get datails of employees with salary between 2,000,000 to 5,000,000 :
SELECT * FROM employee WHERE Salary BETWEEN 2000000 AND 5000000;

-- To get details of employees with firstname that is bob or alex :
SELECT * FROM employee WHERE First_name = 'BOB' OR First_name = 'ALEX';

-- To get details of employees that joined 2019:
SELECT * FROM employee WHERE Joining_date between '2019-01-01' AND '2019-12-31';  

-- To get details of employees that joined within january:
SELECT * FROM employee WHERE Joining_date BETWEEN '2019-01-01' AND '2019-01-31';

-- To get details of employees that joined before march :
SELECT * FROM employee WHERE Joining_date < '2019-03-01';

-- To get details of employees with firstname starting with 'B':
SELECT * FROM employee WHERE First_name LIKE 'B%';

-- To get details of employees that joined from march 2019:
SELECT * FROM employee WHERE Joining_date BETWEEN '2019-03-01' AND '2019-12-31';

-- To get Firstname and reward amount of employee even if they did not recieve a reward :
SELECT First_name, COALESCE(Reward.amount, 0) AS RewardAmount FROM employee LEFT JOIN reward ON employee.Employee_ID = reward.Employee_ref_ID;

-- To get firstname and reward amount of employee :
SELECT First_name, reward.amount FROM employee JOIN reward ON employee.Employee_ID = reward.Employee_ref_ID;

-- To get details of employee with firstname containing four letters ending with 'N' :
SELECT * FROM employee WHERE First_name LIKE '___N';

-- To get firstname and reward amount of employee using right join :
SELECT First_name, reward.amount FROM employee RIGHT JOIN reward ON employee.Employee_ID = reward.Employee_ref_ID;

-- To get employee firstname and maximum reward amount  :
SELECT employee.First_name, (SELECT MAX(reward.amount) FROM reward WHERE reward.Employee_ref_ID = employee.Employee_ID) AS max_reward FROM employee;

-- To get top 2 employee salary :
SELECT Salary AS TopSalary FROM employee ORDER BY Salary DESC LIMIT 2; 

-- To get details of employee with salary above 3,000,000 :
SELECT * FROM employee WHERE Salary < 3000000;

-- To get the second higest employee salary :
SELECT Salary AS SecondHighestSalary FROM employee order by Salary DESC LIMIT 1 OFFSET 1;