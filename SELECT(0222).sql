-- ����� �ִ� ������ �ּ� ������ ����� ���ϰ� ��Ī�� "��ձ޿�"��� ���. 

select  (highest_sal+lowest_sal)/2 as ��ձ޿�
from job_grades;

-- ������� ���� Ŀ�̼��� �޴��� ���϶�( �˼� ������ 0���� ���Ѵ�.)

select nvl(commission_pct,0)
from employees;

-- (Ǯ����)�� ��ȭ��ȣ�� (��ȭ��ȣ)�Դϴ�. ��Ī : ��� ��ȭ��ȣ

select first_name ||' '|| last_name ||'�� ��ȭ��ȣ�� '|| phone_number ||'�Դϴ�.' "��� ��ȭ��ȣ"
from employees;

-- (�����̸�)�� ��� �ӱ��� (��� �޿�)�� �Դϴ�. ��Ī : ������ ��� �޿�

select job_id ||'�� ��� �ӱ��� ' || salary / 20 ||' �� �Դϴ�.' as "������ ��� �޿�"
from employees;

-- ��� ���: ������Ʈ ���� �Ⱓ�� (������Ʈ ���� �Ⱓ) �Դϴ�. ��Ī: ������Ʈ ���� �Ⱓ (���� ����)

select '������Ʈ ���� �Ⱓ�� '|| start_date||' ~ '|| end_date ||' �Դϴ�.' "������Ʈ ���� �Ⱓ"
from job_history;

-- ��� ���: (�μ� �̸�) �ǰ����ڹ�ȣ�� (�Ŵ��� ��ȣ) �Դϴ�. -���� ��Ī: �μ� �̸� ��Ī: �޴��� ��ȣ (�� 4��)

select department_id ||' �� ������ ��ȣ�� '|| phone_number ||' �Դϴ�.' " �Ŵ��� ��ȣ "
from employees;

-- �μ� ��ȣ�� xx�� �μ��� �̸��� xx �Դϴ�.

select '�μ� ��ȣ�� ' || department_id || '�� �μ��� �̸��� ' || department_name ||'�Դϴ�.'
from departments;

-- ��� ��ȣ xx�� xx������ ������Ʈ�� �����߽��ϴ�.

select '��� ��ȣ '|| employee_id ||'�� '|| start_date ||'������ ������Ʈ�� �����߽��ϴ�.'
from job_history;

-- employees���̺� ���� �� ���� ���ο� ������ ��¥�� ���̰� �μ���ȣ�� null�� ����� ã�Ƽ� null�� 80���� �ٲ��.

select '2019.02.22'|| employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, nvl(department_id,80)
from employees;

-- ���� �������� ���ϴ� ��� �߿� ������ ���� ���� �޴»����? Ellen Abel

-- jobs ���̺��� ���� �̸��� �ּ� �޿�, �ִ�޿�, ��ձ޿��� ����ϰ� ��ձ޿��� ��Ī�� ��� �޿��� �Ͻÿ�.

select job_id "���� �̸�", min_salary "�ּ� �޿�", max_salary "�ִ� �޿�", (min_salary+max_salary)/2 "��� �޿�"
from jobs;

-- locations ���̺��� ��ü�ּҸ� ����ϰ� ��Ī�� �ּ� �� �Ͻÿ� . (��ü�ּ� : street_address, city, country_ID )

select street_address||' '|| city ||' '||country_id ��ü�ּ�
from locations;

-- �μ���ȣ�� ()�� ����� Ŀ�̼����Ա޿��� ()�̴�. ��� ����Ͻÿ�

select '�μ���ȣ��'|| department_id ||' �� ����� Ŀ�̼����Ա޿���'|| (nvl(commission_pct,0)*salary+salary) ||'�̴�.' 
from employees;

-- ����̸�(Ǯ����), �Ի���, �Ŵ�����ȣ (�Ŵ����� ���� ��� '-1' ���� ǥ��)

select first_name ||' '||last_name, hire_date, nvl(manager_id,-1)
from employees;