
-- 사번, 이름, 부서번호
-- 부서번호 60 개발자
-- 90 임원진
-- 나머지 비개발자

select employee_id, concat(first_name, concat(' ', last_name)), nvl(department_id,0),

    case when department_id = 60 then '개발자'
    when department_id = 90 then '임원진'
    else '비개발자'
    end 직원유형

from  employees
order by 4;

-- decode 함수는 등가비교는 불가하다.

select employee_id, first_name, department_id,  
decode(department_id, 60, '개발자', 90, '임원진', '비개발자') 직원유형
from employees;

-- 그룹함수
-- 회사의 총사원수, 급여총합, 급여평균, 최고급여, 최저급여
-- 단일행 함수 count(employee_id) : 총 사원수
-- sum(salary) : 급여의 총합
-- avg(salary) : 급여의 평균
-- max(salary) : 급여의 최고
-- min(salary) : 급여의 최저

Select Count(Employee_Id), Sum(Salary), Avg(Salary), Max(Salary), Min(Salary)
From Employees;

-- 평균급여보다 많이 받는 사원의 사번, 이름, 급여

Select Employee_Id, First_Name, Salary
From Employees
Where Salary > (Select Avg(Salary) From Employees);


-- 사번, 이름, 부서번호, 부서이름
-- talbe 의 갯수(n)-1 개의 조인 조건을 걸어야한다.
-- table.column -> table 안에 있는 column  

Select Ee.Employee_Id ,Ee.First_Name, Ee.Department_Id, De.Department_Name
From Employees Ee, Departments De
Where De.Department_Id = Ee.Department_Id
Order By Department_Id;

--  'Seattle;에 근무하는 사원의 사번, 이름, 부서이름, 도시이름

Select Em.Employee_Id, Em.First_Name, De.Department_Name, Lo.City 
From Employees Em,Departments De, Locations Lo
Where Lo.Location_Id = De.Location_Id And De.Department_Id = Em.Department_Id And Lo.City = 'Seattle';

-- 'asia'에 근무하는 사원이름, 부서이름, 도시이름

SELECT EM.employee_id, de.department_name, LO.city
FROM employees EM, countries co, regions re, departments de, locations LO
WHERE EM.department_id = de.department_id AND LO.location_id = de.location_id AND LO.country_id = co.country_id AND co.region_id = re.region_id AND LOWER(re.region_name) = LOWER('asia');

-- 10, 80, 90번 부서에 근무중인 사원의 사번, 이름, 직책이름, 부서이름

Select Em.Employee_Id, Concat(Em.First_Name, Concat(' ',Last_Name)), Jo.Job_Title, De.Department_Name, Em.Department_Id
From Employees Em, Jobs Jo, Departments De
Where Jo.Job_Id = Em.Job_Id And Em.Department_Id = De.Department_Id And Em.Department_Id In( 10, 80, 90);

-- 직책 아이디가 'SA_REP'인 사원의 사번, 이름, 직책이름, 부서이름 
-- 단, 부서가 없는 경우 '대기발령으로 출력

Select Em.Employee_Id, Em.First_Name, Em.Job_Id, De.Department_Name
From Employees Em, Departments De
Where De.Department_Id = Em.Department_Id And Lower(Em.Job_Id) = Lower('sa_rep'); 

-- 사번이 200인 사원의 근무 이력
-- 사번, 이름, 근무했을 당시 직책이름, 부서이름, 근무개월(소수2자리)
-- 87.09.17 ~ 93.06.17 = ad_asst
-- 94.07.01 ~ 98.12.31 = ac_account

Select E.Employee_Id, Concat(E.First_Name, Concat(' ' ,E.Last_Name)), J.Job_Title, D.Department_Name, to_char(Round(Months_Between (JH.End_Date, JH.Start_Date), 2), '99.99')
From Employees E, Departments D, Job_History JH, Jobs J
Where JH.Employee_Id = E.Employee_Id  And J.Job_Id = JH.Job_Id And E.Department_Id = D.Department_Id And JH.Employee_Id = 200;

--셀프조인 (Self join)
--모든 사원의 부서이름, 사번, 이름, 매니저 사번, 매니저 이름

select d.department_name, e.employee_id, concat(e.first_name, concat(' ', e.last_name)), em.employee_id, concat(em.first_name, concat(' ', em.last_name))
from employees e, employees em, departments d
where em.employee_id = e.manager_id and d.department_id = e.department_id
order by department_name;

-- peter 와 동일한 근무지에 근무하는 사원의 이름을 출력하시오

Select  E.First_Name, Ee.First_Name
From Employees E, Employees Ee
Where E.Department_Id = Ee.Department_Id  And Lower(E.First_Name) = Lower('peter') And Lower(Ee.First_Name) != Lower('peter');

-- us(대문자인지, 소문자인지 모름)에 사번, 이름(풀네임), 급여 출력
-- 급여가 높은 순으로 출력 

Select Employee_Id, concat(First_Name, concat(' ' ,last_name)), Salary  
From Employees E, Locations L, Departments D
Where L.Location_Id = D.Location_Id And D.Department_Id = E.Department_Id And L.Country_Id ='US'
order by salary desc;