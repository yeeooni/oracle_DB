-- 부서번호가 50이거나 60인 사원과 급여가 5000이상인 사원의
-- 사번, 이름, 급여, 부서번호

-- 두 질의 결과값의 합으로 중복을 제거
select employee_id, first_name, salary, department_id
from employees
where department_id = 50 or department_id = 90

union

select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;


-- 두 질의 결과값의 합으로 중복을 포함
select employee_id, first_name, salary, department_id
from employees
where department_id = 50 or department_id = 90

union all

select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;


-- 두 질의 결과값의 공통되는 값
select employee_id, first_name, salary, department_id
from employees
where department_id = 50 or department_id = 90

intersect

select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;


-- 첫 번째 질의 결과에서 두 번째 질의 결과에 있는 행을 제거한 값
select employee_id, first_name, salary, department_id
from employees
where department_id = 50 or department_id = 90

minus

select employee_id, first_name, salary, department_id
from employees
where salary >= 10000;

select employee_id, first_name, salary, department_id
from employees
where salary >= 10000

minus

select employee_id, first_name, salary, department_id
from employees
where department_id = 50 or department_id = 90;


-- Group by 
-- 부서별 총합, 평균급여, 사원수, 최대급여, 최소급여
-- select 절에는 group by 절에 있는 column만 쓸 수 있다.

select department_id, sum(salary), round(avg(salary), 0), count(employee_id), max(salary), min(salary)
from employees
group by department_id;

-- 부서별 총합, 평균급여, 사원수, 최대급여, 최소급여
-- 평균급여가 5000이하인 부서
-- group by 절의 조건은 having 절에 사용한다.
-- 일반조건은 where절에 사용한다.

select department_id, sum(salary), round(avg(salary), 0), count(employee_id), max(salary), min(salary)
from employees
group by department_id
having avg(salary) <= 5000;

-- 각 부서별 평균 급여보다 많이 받는 사원의 
-- 사번, 이름, 급여
-- Sub query 이용 

select employee_id, first_name, salary
from employees
where salary > all (select avg(salary)
                        from employees
                        group by department_id);
                        
                        
-- 부서별 최고급여를 받는 사원의
-- 부서이름, 사번, 이름, 급여

select e.employee_id, e.first_name, e.salary, d.department_name, e.department_id
from (select department_id, max(salary) maxsal
       from employees
       group by department_id) m , employees e, departments d
where e.department_id = m.department_id and e.salary = m.maxsal and e.department_id = d.department_id;


-- 행번호 
-- 크다 비교가 불가능하다.

select rownum, employee_id, salary
from employees;

select rownum, employee_id, salary
from employees
where rownum <= 10 and rownum > 5;

-- TOP N query
-- 사번, 이름, 급여, 입사년대, 부서이름,
-- 급여순 순위 
-- 한 페이지당 5명씩 출력
-- 2page 출력 & 사용 
-- 1980년대, 1990년대, 2000년대 

select b.m, b.employee_id, b.first_name, b.salary,
        case when to_char(hire_date, 'yyyy') < '1990' then '1980년대'
        when to_char(hire_date, 'yyyy') < '2000' then '1990년대'
        else '2000년대'
        end 입사년대, d.department_name

from(
        select rownum m, a.*
        from( 
                select employee_id, first_name, salary, hire_date, department_id
                from employees
                order by salary desc
              ) a 
        where rownum <= &page * 5) b, departments d

where b.department_id = d.department_id(+) and b.m > &page * 5 - 5;
