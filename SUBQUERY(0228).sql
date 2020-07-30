-- �μ��̸��� it�� �ٹ��ϴ� ����� ���, �̸�, �޿�
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

-- select�� �������� �����ִ°� ���� -- subquery(������)
-- ���ε��� �̾Ƴ��� �� ���� ���ξȿ� ���� �ִ´�.
select employee_id, first_name, salary
from employees 
where department_id = (select department_id
                                from departments
                                where department_name ='IT');


-- 'Seattile' �� �ٹ��ϴ� ����� ���, �̸�, �޿�
Select Employee_Id, First_Name, Salary
From Employees
Where Department_Id In (Select Department_Id
                                 From Departments
                                 Where Location_Id = (Select Location_Id
                                                             From Locations
                                                             Where City = 'Seattle'));

-- subquery , join ����
Select Employee_Id, First_Name, Salary
From Employees
Where Department_Id in (select d.department_id
                                from departments d join locations l
                                using (location_id)
                                where l.city = 'Seattle');
                                
-- ������ȣ�� 1700�� �μ��� ���ϴ� ����� ���, �̸�, �μ���ȣ, �μ��̸�
-- equi join
select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id and d.location_id = 1700;

select department_id, department_name
from departments
where location_id = 1700;


-- �ζ��� �� 
select e.employee_id, e.first_name, d.department_id, d.department_name
from employees e, (select department_id, department_name
                            from departments
                            where location_id = 1700) d
where d.department_id = e.department_id;



-- 'Jennifer' �� ���, �ٹ��μ�, �μ���ȣ, ���� ����Ͻÿ�
select e.employee_id, d.department_name, d.department_id, c.country_name
from employees e, departments d, countries c, locations l
where e.department_id = d.department_id and l.location_id = d.location_id and c.country_id = l.country_id and e.first_name = 'Jennifer';



-- 'Kevin' ���� �޿��� ���� �޴� ����� ���, �̸�, �޿�
select employee_id, first_name, salary
from employees
where salary > (select salary
                    from employees
                    where first_name = 'Kevin' );

-- 50�� �μ��� �ִ� ����� ���� �޿��� ���� �޴� ����� ���, �̸�, �޿�
select employee_id, first_name, salary
from employees
where salary > (select max(salary)
                    from employees 
                    where department_id = 50);

-- �� �����ؾ��ϴ� ����̱⶧���� all�� ����ϴ� ���� ����.
select employee_id, first_name, salary
from employees
where salary > all (select salary
                    from employees 
                    where department_id = 50);




-- �μ��� �ٹ��ϴ� ��� ������� ��� �޿����� ���� �޴� ����� ���, �̸�, �޿�
-- ������ �������� ������ �÷��� �̸� �������� ���� ���;��Ѵ�.
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
                                
                                -- �μ���ȣ�� 20���� ��� �޿����� ũ��,
                                -- �Ŵ����� �ִ� ������� �μ���ȣ�� 20�� �ƴ� ����� ���, �̸�, �޿�, �μ���ȣ
                                
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
    
                                                                                                                                                                                                                        
-- 20�� �μ��� ��ձ޿�
-- 50�� �μ��� �޿�����
-- 80�� �μ��� �ο� �� 
                select *
                from departments
                where department_id in ( 20, 50, 80);
                           
   select                             
            (select avg(salary) --����row ����column�� ��� ��밡��
            from employees 
            where department_id = 20),
            
            (select count(employee_id)
            from employees
            where department_id = 80),
        
            (select sum(salary)
            from employees
            where department_id = 50)
                                                                                                     
           from dual;
                                                                                                                                
                                                                                                                                
-- ��� ����� ���, �̸�, �޿�, ���, �μ��̸�
-- a�� 1���, b�� 2���.....

select e.employee_id, e.first_name, e.salary,
        case
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'A'
        then '1���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'B'
        then '2���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'C'
        then '3���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'D'
        then '4���'
        when (select grade_level from job_grades where e.salary between lowest_sal and highest_sal) = 'E'
        then '5���'
        else '6���'
        end ���, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
order by 4;

select e.employee_id, d.department_name, e.salary,
    decode((select grade_level from job_grades where e.salary between lowest_sal and highest_sal), 'A', '1���', 'B', '2���', 'C', '3���', 'D', '4���', 'E', '5���', '6���') �޿����
from employees e, departments d
where e.department_id = d.department_id;
                                                        