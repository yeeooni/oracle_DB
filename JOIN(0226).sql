
-- ���, �̸�, �μ���ȣ
-- �μ���ȣ 60 ������
-- 90 �ӿ���
-- ������ �񰳹���

select employee_id, concat(first_name, concat(' ', last_name)), nvl(department_id,0),

    case when department_id = 60 then '������'
    when department_id = 90 then '�ӿ���'
    else '�񰳹���'
    end ��������

from  employees
order by 4;

-- decode �Լ��� ��񱳴� �Ұ��ϴ�.

select employee_id, first_name, department_id,  
decode(department_id, 60, '������', 90, '�ӿ���', '�񰳹���') ��������
from employees;

-- �׷��Լ�
-- ȸ���� �ѻ����, �޿�����, �޿����, �ְ�޿�, �����޿�
-- ������ �Լ� count(employee_id) : �� �����
-- sum(salary) : �޿��� ����
-- avg(salary) : �޿��� ���
-- max(salary) : �޿��� �ְ�
-- min(salary) : �޿��� ����

Select Count(Employee_Id), Sum(Salary), Avg(Salary), Max(Salary), Min(Salary)
From Employees;

-- ��ձ޿����� ���� �޴� ����� ���, �̸�, �޿�

Select Employee_Id, First_Name, Salary
From Employees
Where Salary > (Select Avg(Salary) From Employees);


-- ���, �̸�, �μ���ȣ, �μ��̸�
-- talbe �� ����(n)-1 ���� ���� ������ �ɾ���Ѵ�.
-- table.column -> table �ȿ� �ִ� column  

Select Ee.Employee_Id ,Ee.First_Name, Ee.Department_Id, De.Department_Name
From Employees Ee, Departments De
Where De.Department_Id = Ee.Department_Id
Order By Department_Id;

--  'Seattle;�� �ٹ��ϴ� ����� ���, �̸�, �μ��̸�, �����̸�

Select Em.Employee_Id, Em.First_Name, De.Department_Name, Lo.City 
From Employees Em,Departments De, Locations Lo
Where Lo.Location_Id = De.Location_Id And De.Department_Id = Em.Department_Id And Lo.City = 'Seattle';

-- 'asia'�� �ٹ��ϴ� ����̸�, �μ��̸�, �����̸�

SELECT EM.employee_id, de.department_name, LO.city
FROM employees EM, countries co, regions re, departments de, locations LO
WHERE EM.department_id = de.department_id AND LO.location_id = de.location_id AND LO.country_id = co.country_id AND co.region_id = re.region_id AND LOWER(re.region_name) = LOWER('asia');

-- 10, 80, 90�� �μ��� �ٹ����� ����� ���, �̸�, ��å�̸�, �μ��̸�

Select Em.Employee_Id, Concat(Em.First_Name, Concat(' ',Last_Name)), Jo.Job_Title, De.Department_Name, Em.Department_Id
From Employees Em, Jobs Jo, Departments De
Where Jo.Job_Id = Em.Job_Id And Em.Department_Id = De.Department_Id And Em.Department_Id In( 10, 80, 90);

-- ��å ���̵� 'SA_REP'�� ����� ���, �̸�, ��å�̸�, �μ��̸� 
-- ��, �μ��� ���� ��� '���߷����� ���

Select Em.Employee_Id, Em.First_Name, Em.Job_Id, De.Department_Name
From Employees Em, Departments De
Where De.Department_Id = Em.Department_Id And Lower(Em.Job_Id) = Lower('sa_rep'); 

-- ����� 200�� ����� �ٹ� �̷�
-- ���, �̸�, �ٹ����� ��� ��å�̸�, �μ��̸�, �ٹ�����(�Ҽ�2�ڸ�)
-- 87.09.17 ~ 93.06.17 = ad_asst
-- 94.07.01 ~ 98.12.31 = ac_account

Select E.Employee_Id, Concat(E.First_Name, Concat(' ' ,E.Last_Name)), J.Job_Title, D.Department_Name, to_char(Round(Months_Between (JH.End_Date, JH.Start_Date), 2), '99.99')
From Employees E, Departments D, Job_History JH, Jobs J
Where JH.Employee_Id = E.Employee_Id  And J.Job_Id = JH.Job_Id And E.Department_Id = D.Department_Id And JH.Employee_Id = 200;

--�������� (Self join)
--��� ����� �μ��̸�, ���, �̸�, �Ŵ��� ���, �Ŵ��� �̸�

select d.department_name, e.employee_id, concat(e.first_name, concat(' ', e.last_name)), em.employee_id, concat(em.first_name, concat(' ', em.last_name))
from employees e, employees em, departments d
where em.employee_id = e.manager_id and d.department_id = e.department_id
order by department_name;

-- peter �� ������ �ٹ����� �ٹ��ϴ� ����� �̸��� ����Ͻÿ�

Select  E.First_Name, Ee.First_Name
From Employees E, Employees Ee
Where E.Department_Id = Ee.Department_Id  And Lower(E.First_Name) = Lower('peter') And Lower(Ee.First_Name) != Lower('peter');

-- us(�빮������, �ҹ������� ��)�� ���, �̸�(Ǯ����), �޿� ���
-- �޿��� ���� ������ ��� 

Select Employee_Id, concat(First_Name, concat(' ' ,last_name)), Salary  
From Employees E, Locations L, Departments D
Where L.Location_Id = D.Location_Id And D.Department_Id = E.Department_Id And L.Country_Id ='US'
order by salary desc;