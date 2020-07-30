
-- ��� ����� ��� ����
select *
from employees;

-- ����� ���, �̸�, �޿�
select employee_id, first_name, salary
from employees;

select first_name
from employees
where first_name like 'E%';

-- �μ��� �μ���ȣ, �μ��̸�
select department_id, department_name
from departments;

-- �μ���ȣ
select distinct department_id,  employee_id
from employees;

-- ���� ��� ǥ�� (dual: �ӽ����̺� ����)
select 10/3
from dual;

-- ���, �̸�, �޿�, 200�λ� �޿�
select employee_id, 
        first_name, 
        last_name, salary, 
        salary+200
from employees;

-- ���, �̸�, �޿�, Ŀ�̼����Ա޿�
select employee_id ���, first_name �̸�, salary �޿�, 
        nvl(commission_pct,0) Ŀ�̼�, 
        nvl(commission_pct,0)*salary+salary "Ŀ�̼����Ա޿�"
from employees;

-- ��Ī ����
select employee_id as ���, first_name as �̸�, salary as �޿�
from employees;

-- ���� ������
select first_name ||', '|| salary "�̸�,�޿�"
from employees;

-- ���, �̸�(Ǯ����)
select employee_id, first_name ||' '|| last_name name 
from employees;

-- ����� 100���� ����� �̸��� Steven king �Դϴ�. (info)
select '����� ' || employee_id || '�� ����� �̸���' || first_name ||' '|| last_name || '�Դϴ�.' info
from employees;

select employee_id, first_name ||' '|| last_name as name
from employees;

select phone_number
from employees;

select job_id
from employees;

select first_name || ' ' || last_name ||' ������� �޿��� '|| salary ||' �Դϴ�.' "�޿� ����"
from employees;

select *
from job_history;

select '�����ȣ�� '|| employee_id || '�� ����� ��å�� '|| job_id ||' �̸� �Ի����� '|| start_date ||', ������� '|| end_date ||' �Դϴ�.' �����������
from job_history;

-- �ͽ��� �þ�Ʋ�� ��ġ�� ������ �����ȣ�� 98199�̴�." (post code)
select state_province || ' ' || city ||'�� ��ġ�� ������ �����ȣ�� ' || postal_code || '�̴�.' as "post code"
from locations;

-- "�̸�(Ǯ����)�� �޿��� 10% �λ�Ǿ� ??�̴�."(�޿��λ�)

select first_name || ' ' || last_name || '�� �޿��� 10% �λ�Ǿ� '|| salary * 1.1 ||'�̴�.' �޿��λ�
from employees;

--. **(�̸�)�� �����ּҴ�**�̰� �ڵ�����ȣ��**�̴�. ������ ���� ����ϱ� column�̸��� ����ó

select first_name ||' '|| last_name || '�� �����ּҴ� '|| email ||'�̰� �ڵ�����ȣ��'|| phone_number ||'�̴�.' ����ó
from employees;


-- **(����) **(����)�� **(����)�� **(�ּ�)�� �����ȣ�� **�̴�. ������ ���� ����ϱ� column�̸��� �����ȣ

select country_id, state_province, city, street_address ||'�� �����ȣ�� '|| postal_code||'�̴�.' �����ȣ
from locations;

-- "000 ��� - �̸��� : 000@gamil.com / ��ȭ��ȣ : ***.***.****" �������� ����ϼ��� (�̸��� '�̸� ��' ����)

select first_name || ' ' || last_name || ' ��� - �̸��� :' || email || '@gmail.com / ��ȭ��ȣ: ' || phone_number 
from employees;

-- ���� �ּ�, ���ø�, ���̸�, ����ID" �������� ����ϼ��� (Column���� '�ּ�')

select street_address||', ' || city||' , '||state_province||' ,'|| country_id �ּ�
from locations;

-- ����� �ִ� ������ �ּ� ������ ����� ���ϰ� ��Ī�� "��ձ޿�"��� ���. 

select
from

-- ����� �̸��ϰ� ��ȭ��ȣ�� �����Ͽ� "ȸ��"�̶�� ��Ī���� ����Ʈ�� ������. (�̸��ϰ� ��ȭ��ȣ ���̿��� /�߰�)

select email || ' / ' || phone_number ȸ��
from employees;

-- ����� id�� �μ�id�� Ȱ���Ͽ� ��� �Ҽ����� �˾Ƴ���

select
from

-- ������� ���� Ŀ�̼��� �޴��� ���϶�( �˼� ������ 0���� ���Ѵ�.)

select nvl(commission_pct,0)
from employees;

--(Ǯ����)�� ��ȭ��ȣ�� (��ȭ��ȣ)�Դϴ�. ��Ī : ��� ��ȭ��ȣ

select first_name || ' '|| last_name || '�� ��ȭ��ȣ�� '|| phone_number || '�Դϴ�' "��� ��ȭ��ȣ"
from employees;

