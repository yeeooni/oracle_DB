-- 부서이름이 it에 근무하는 사원의 사번, 이름, 급여
select e.employee_id, e.first_name, e.salary
from departments d, employees e
where e.department_id = d.department_id
and d.department_name = 'IT'
order by salary;

select e.employee_id, e.first_name, e.salary
from employees e
where e.department_id = 60;

select department_id
from departments
where department_name ='IT';

-- select을 기준으로 맞춰주는게 좋다 -- subquery(부질의)
-- 따로따로 뽑아놓고 그 값을 가로안에 집어 넣는다.
select employee_id, first_name, salary
from employees 
where department_id = (select department_id
                                from departments
                                where department_name ='IT');


-- 'Seattile' 에 근무하는 사원의 사번, 이름, 급여
Select Employee_Id, First_Name, Salary
From Employees
Where Department_Id In (Select Department_Id
                                 From Departments
                                 Where Location_Id = (Select Location_Id
                                                             From Locations
                                                             Where City = 'Seattle'));

-- subquery , join 결합
Select Employee_Id, First_Name, Salary
From Employees
Where Department_Id in (select d.department_id
                                from departments d join locations l
                                using (location_id)
                                where l.city = 'Seattle');
                                
-- 지역번호가 1700인 부서에 일하는 사원의 사번, 이름, 부서번호, 부서이름
-- equi join
select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id and d.location_id = 1700;

select department_id, department_name
from departments
where location_id = 1700;


-- 인라인 뷰 
select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e, (select department_id, department_name
                            from departments
                            where location_id = 1700) d
where d.department_id = e.department_id;



-- 'Jennifer' 의 사번, 근무부서, 부서번호, 나라를 출력하시오
select e.employee_id, d.department_name, d.department_id, c.country_name
from employees e, departments d, countries c, locations l
where e.department_id = d.department_id and l.location_id = d.location_id and c.country_id = l.country_id and e.first_name = 'Jennifer';



-- 'Kevin' 보다 급여를 많이 받는 사원의 사번, 이름, 급여
select employee_id, first_name, salary
from employees
where salary > (select salary
                    from employees
                    where first_name = 'Kevin' );

-- 50번 부서에 있는 사원들 보다 급여를 많이 받는 사원의 사번, 이름, 급여
select employee_id, first_name, salary
from employees
where salary > (select max(salary)
                    from employees 
                    where department_id = 50);

-- 다 만족해야하는 경우이기때문에 all을 사용하는 것이 좋다.
select employee_id, first_name, salary
from employees
where salary > all (select salary
                    from employees 
                    where department_id = 50);




-- 부서에 근무하는 모든 사원들의 평균 급여보다 많이 받는 사원의 사번, 이름, 급여
-- 연산을 기준으로 왼쪽은 컬럼의 이름 오른쪽은 값이 나와야한다.
select employee_id, first_name, salary
from employees
where salary > (select avg(salary)
                    from employees
                    where department_id is not null);
        
        select employee_id, first_name, salary
            from employees
               where    salary  > (select avg(e.salary)
                        from departments d, employees e
                        where e.department_id = d.department_id(+));
        
        select employee_id, first_name, salary
        from employees
        where salary   >    (select avg(e.salary)
                                from employees e  left outer join departments d
                                on e.department_id = d.department_id);
                                
                                -- 부서번호가 20번의 평균 급여보다 크고,
                                -- 매니저가 있는 사원으로 부서번호가 20이 아닌 사원의 사번, 이름, 급여, 부서번호
                                
                                select avg(salary)
                                from employees 
                                where department_id = 20;
                                
                       
                       select manager_id
                       from employees;
                       
                        select DISTINCT ee.employee_id, ee.first_name, ee.department_id         
                        from employees e, employees ee
                        where e.manager_id = ee.employee_id and ee.department_id != 20 and e.salary > (select avg(salary)
                                                                                                                                from employees
                                                                                                                                where department_id = 20);
                                                                                                                                
    select e.employee_id, e.first_name, e.salary, d.department_id 
    from employees e, departments d
    where e.employee_id(+) = d.manager_id and e.department_id != 20 and e.salary > (select avg(salary)
                                                                                            from employees
                                                                                            where department_id = 20);
    
                                                                                                                                                                                                                        
-- 20번 부서의 평균급여
-- 50번 부서의 급여총합
-- 80번 부서의 인원 수 
                select *
                from departments
                where department_id in ( 20, 50, 80);
                           
   select                             
            (select avg(salary) --단일row 단일column일 경우 사용가능
            from employees 
            where department_id = 20),
            
            (select count(employee_id)
            from employees
            where department_id = 80),
        
            (select sum(salary)
            from employees
            where department_id = 50)
                                                                                                     
           from dual;
                                                                                                                                
                                                                                                                                
-- 모든 사원의 사번, 이름, 급여, 등급, 부서이름
-- a는 1등급, b는 2등급.....

select e.employee_id, e.first_name, e.salary,
        case
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'A'
        then '1등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'B'
        then '2등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'C'
        then '3등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'D'
        then '4등급'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'E'
        then '5등급'
        else '6등급'
        end 등급, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
order by 4;

select e.employee_id, d.department_name, e.salary,
    decode((select grade_level from job_grades where e.salary between lowest_sal and highest_sal), 'A', '1등급', 'B', '2등급', 'C', '3등급', 'D', '4등급', 'E', '5등급', '6등급') 급여등급
from employees e, departments d
where e.department_id = d.department_id;
                                                        