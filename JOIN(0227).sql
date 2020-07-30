
-- NON-EQUI JOIN
-- ���� ������ Ư�� ���� ���� �ִ����� �����ϱ� ���� where���� ���� �������� = �����ڿ� �� �����ڸ� ����մϴ�.
-- ��� ����� ���, �̸�, �޿�, �޿����

select e.employee_id, e.first_name , e.salary, jg.grade_level
from employees e, job_grades jg
where e.salary > jg.lowest_sal and e.salary <=jg.highest_sal;

select e.employee_id, e.first_name, e.salary, jg.grade_level
from employees e, job_grades jg
where e.salary between jg.lowest_sal and jg.highest_sal;

-- OUTER JOIN
-- 2�� �̻��� ���̺��� ���ε� �� ��� ������ ���̺��� �ش��ϴ� �����Ͱ� �����ϴµ� �ٸ� �� ���̺��� �����Ͱ� �������� �ʴ� ���
-- �׵����ʹ� ��µ��� �ʴ� ������ �ذ��ϱ� ���ؼ� ���Ǵ� ���α��

-- departments  = department_id ����Ű
-- employees = department_id �ܷ�Ű, null ����

-- ��� ����� ���, �̸�, �μ���ȣ, �μ��̸�
-- ��, �μ��� �������� ��� �μ��̸��� '���߷� ��'���� ��� 

select e.employee_id, e.first_name, e.department_id, d.department_id, nvl(d.department_name, '���߷���')
from employees e, departments d
where e.department_id = d.department_id(+);


-- ��� ����� ���, �̸�, ������, ����̸� 
-- ��, ����� ���� ��� ����̸��� '����'���� ���

select e.employee_id, e.first_name, m.employee_id, nvl(m.first_name, '����') 
from employees e, employees m
where e.manager_id = m.employee_id(+) ;

-- OUTER JOIN
-- ��� ����� ���, �̸� , �μ���ȣ, �μ��̸�

select e.employee_id, e.first_name, d.department_id, nvl(d.department_name, '���߷�')
from employees e, departments d
where e. department_id = d.department_id(+);

-- ��� �μ��� �ٹ��ϴ� ����� ���, �̸�, �μ���ȣ, �μ��̸� 

select e.employee_id, nvl(e.first_name, '�������'), d.department_id, d.department_name
from departments d, employees e
where e.department_id(+) = d.department_id ;

select department_id
from employees;

select department_id
from departments;

-- ������� ���, �̸� ,��� ���, ��� �̸�, �μ��̸�
-- ��, �μ��� �������� ��� �μ��̸��� '���߷���'����' ���
-- ��, ����� ���� ��� ��� �̸��� '����'���� ���

select e.employee_id, e.first_name, m.employee_id, m.first_name, nvl(d.department_name, '���߷���'), nvl(m.first_name, '����')
from employees e, employees m, departments d
where e.manager_id = m.employee_id(+) and d.department_id(+) = e.department_id;

---------------------------------------------------------------------------------------------------------------------------------
-- ANSI JOIN
-- ǥ��

select *
from employees, departments;

-- CROSS JOIN 
-- 2�� �̻��� ���̺��� ���� ���� �����ϴ� ���� ������ �ǹ��Ѵ�.

select *
from employees cross join departments;

-- INNER JOIN 
-- ���� �÷��� �������� �����ϱ� ���� EQUI JOIN�� ANSI JOIN������ FROM ������ 
-- INNER JOIN �̶� �ܾ ����Ͽ� ������ ���̺� �̸��� ����ϰ� ON ���� ����Ͽ� ���� ������ ����մϴ�.

-- ���, �̸� , �μ��̸�
-- 50�� �μ��� ���
-- inner join ��� �� where�� �Ϲ������� ����Ѵ�.
-- defult �� inner join �̱� ������ join�� �ᵵ �ȴ�.

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

-- column�� �̸��� ���� �� using�� ����� �� 
-- equi ���踦 �Ƚᵵ �ȴ�.

select employee_id, first_name, department_name
from employees e join departments d
using(department_id)
where department_id = 50;

-- NATURAL JOIN
-- ON���� ����ϱ� ���� �� 
-- �Ȱ��� column �ϳ� �� �� 

select employee_id, first_name, department_name
from employees e natural join departments d
where department_id = 50;

-- 'Seattle'�� �ٹ��ϴ� ���, �̸�, �μ��̸�, ���� 

select e.employee_id, e.first_name, d.department_name, l.city
from employees e, departments d, locations l
where e. department_id = d.department_id and d. location_id = l.location_id and l.city = 'Seattle';


-- join on ~ join on ~ join on 
-- ������ �߿��ϴ�.
select e.employee_id, e.first_name, d.department_name, l.city
from employees e join departments d 
on e. department_id = d.department_id 
join locations l
on  d. location_id = l.location_id 
where l.city = 'Seattle';

-----------------------------------------------------------------------------------------------------------------------------------------

-- ANSI JOIN 

select e.employee_id, e.first_name, d.department_id, nvl(d.department_name, '���߷�')
from employees e left outer join departments d
on e. department_id = d.department_id;

select e.employee_id, e.first_name, d.department_id, nvl(d.department_name, '�������')
from employees e right outer join departments d
on e. department_id = d.department_id;

-- ��� �μ��� ��� ����� �ٹ��ϴ� ����� ���, �̸�(�������), �μ���ȣ, �μ��̸�(���߷�)

select e.employee_id, e.first_name, d.department_id, nvl(d.department_name, '���߷�'), nvl(e.first_name, '�������')
from employees e full outer join departments d
on e. department_id = d.department_id;


