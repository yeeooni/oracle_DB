
-- NON-EQUI JOIN
-- 조인 조건의 특정 범위 내에 있는지를 조사하기 위해 where절의 조인 조건으로 = 연산자와 비교 연산자를 사용합니다.
-- 모든 사원의 사번, 이름, 급여, 급여등급

select e.employee_id, e.first_name , e.salary, jg.grade_level
from employees e, job_grades jg
where e.salary > jg.lowest_sal and e.salary <=jg.highest_sal;

select e.employee_id, e.first_name, e.salary, jg.grade_level
from employees e, job_grades jg
where e.salary between jg.lowest_sal and jg.highest_sal;

-- OUTER JOIN
-- 2개 이상의 테이블이 조인될 때 어느 한쪽의 테이블에는 해당하는 데이터가 존재하는데 다른 쪽 테이블에는 데이터가 존재하지 않는 경우
-- 그데이터는 출력되지 않는 문제를 해결하기 위해서 사용되는 조인기법

-- departments  = department_id 개인키
-- employees = department_id 외래키, null 가능

-- 모든 사원의 사번, 이름, 부서번호, 부서이름
-- 단, 부서가 미지정일 경우 부서이름을 '대기발령 중'으로 출력 

select e.employee_id, e.first_name, e.department_id, d.department_id, nvl(d.department_name, '대기발령중')
from employees e, departments d
where e.department_id = d.department_id(+);


-- 모든 사원의 사번, 이름, 상관사번, 상관이름 
-- 단, 상관이 없을 경우 상관이름에 '사장'으로 출력

select e.employee_id, e.first_name, m.employee_id, nvl(m.first_name, '사장') 
from employees e, employees m
where e.manager_id = m.employee_id(+) ;

-- OUTER JOIN
-- 모든 사원의 사번, 이름 , 부서번호, 부서이름

select e.employee_id, e.first_name, d.department_id, nvl(d.department_name, '대기발령')
from employees e, departments d
where e. department_id = d.department_id(+);

-- 모든 부서에 근무하는 사원의 사번, 이름, 부서번호, 부서이름 

select e.employee_id, nvl(e.first_name, '사원없음'), d.department_id, d.department_name
from departments d, employees e
where e.department_id(+) = d.department_id ;

select department_id
from employees;

select department_id
from departments;

-- 모든사원의 사번, 이름 ,상관 사번, 상관 이름, 부서이름
-- 단, 부서가 미지정일 경우 부서이름을 '대기발령중'으로' 출력
-- 단, 상관이 없을 경우 상관 이름에 '사장'으로 출력

select e.employee_id, e.first_name, m.employee_id, m.first_name, nvl(d.department_name, '대기발령중'), nvl(m.first_name, '사장')
from employees e, employees m, departments d
where e.manager_id = m.employee_id(+) and d.department_id(+) = e.department_id;

---------------------------------------------------------------------------------------------------------------------------------
-- ANSI JOIN
-- 표준

select *
from employees, departments;

-- CROSS JOIN 
-- 2개 이상의 테이블을 조건 없이 실행하는 조인 연산을 의미한다.

select *
from employees cross join departments;

-- INNER JOIN 
-- 동일 컬럼을 기준으로 조인하기 위한 EQUI JOIN을 ANSI JOIN에서는 FROM 다음에 
-- INNER JOIN 이란 단어를 사용하여 조인할 테이블 이름을 명시하고 ON 절을 사용하여 조인 조건을 명시합니다.

-- 사번, 이름 , 부서이름
-- 50번 부서의 사번
-- inner join 사용 시 where에 일반조건을 사용한다.
-- defult 가 inner join 이기 때문에 join만 써도 된다.

select employee_id, first_name, department_name
from employees e inner join departments d
on e.department_id = d.department_id
where e.department_id = 50;

select employee_id, first_name, department_name
from employees e join departments d
on e.department_id = d.department_id
where e.department_id = 50;

select employee_id, first_name, department_name
from employees e join departments d
on e.department_id = d.department_id
where e.department_id = 50;

-- column의 이름이 같을 때 using을 사용할 때 
-- equi 관계를 안써도 된다.

select employee_id, first_name, department_name
from employees e join departments d
using(department_id)
where department_id = 50;

-- NATURAL JOIN
-- ON절을 사용하기 싫을 때 
-- 똑같은 column 하나 일 때 

select employee_id, first_name, department_name
from employees e natural join departments d
where department_id = 50;

-- 'Seattle'에 근무하는 사번, 이름, 부서이름, 도시 

select e.employee_id, e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e. department_id = d.department_id and d. location_id = l.location_id and l.city = 'Seattle';


-- join on ~ join on ~ join on 
-- 순서가 중요하다.
select e.employee_id, e.first_name, d.department_name, l.city
from employees e join departments d 
on e. department_id = d.department_id 
join locations l
on  d. location_id = l.location_id 
where l.city = 'Seattle';

-----------------------------------------------------------------------------------------------------------------------------------------

-- ANSI JOIN 

select e.employee_id, e.first_name, d.department_id, nvl(d.department_name, '대기발령')
from employees e left outer join departments d
on e. department_id = d.department_id;

select e.employee_id, e.first_name, d.department_id, nvl(d.department_name, '사원없음')
from employees e right outer join departments d
on e. department_id = d.department_id;

-- 모든 부서와 모든 사원에 근무하는 사원의 사번, 이름(사원없음), 부서번호, 부서이름(대기발령)

select e.employee_id, e.first_name, d.department_id, nvl(d.department_name, '대기발령'), nvl(e.first_name, '사원없음')
from employees e full outer join departments d
on e. department_id = d.department_id;


