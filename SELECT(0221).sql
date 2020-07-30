
-- 모든 사원의 모든 정보
select *
from employees;

-- 사원의 사번, 이름, 급여
select employee_id, first_name, salary
from employees;

select first_name
from employees
where first_name like 'E%';

-- 부서의 부서번호, 부서이름
select department_id, department_name
from departments;

-- 부서번호
select distinct department_id,  employee_id
from employees;

-- 연산 결과 표시 (dual: 임시테이블 생성)
select 10/3
from dual;

-- 사번, 이름, 급여, 200인상 급여
select employee_id, 
        first_name, 
        last_name, salary, 
        salary+200
from employees;

-- 사번, 이름, 급여, 커미션포함급여
select employee_id 사번, first_name 이름, salary 급여, 
        nvl(commission_pct,0) 커미션, 
        nvl(commission_pct,0)*salary+salary "커미션포함급여"
from employees;

-- 별칭 삽입
select employee_id as 사번, first_name as 이름, salary as 급여
from employees;

-- 연결 연산자
select first_name ||', '|| salary "이름,급여"
from employees;

-- 사번, 이름(풀네임)
select employee_id, first_name ||' '|| last_name name 
from employees;

-- 사번이 100번인 사원의 이름은 Steven king 입니다. (info)
select '사번이 ' || employee_id || '인 사원의 이름은' || first_name ||' '|| last_name || '입니다.' info
from employees;

select employee_id, first_name ||' '|| last_name as name
from employees;

select phone_number
from employees;

select job_id
from employees;

select first_name || ' ' || last_name ||' 사원님의 급여는 '|| salary ||' 입니다.' "급여 내역"
from employees;

select *
from job_history;

select '사원번호가 '|| employee_id || '인 사람의 직책은 '|| job_id ||' 이며 입사일은 '|| start_date ||', 퇴사일은 '|| end_date ||' 입니다.' 입퇴사자정보
from job_history;

-- 와싱턴 시애틀에 위치한 지사의 우편번호는 98199이다." (post code)
select state_province || ' ' || city ||'에 위치한 지사의 우편번호는 ' || postal_code || '이다.' as "post code"
from locations;

-- "이름(풀네임)의 급여는 10% 인상되어 ??이다."(급여인상)

select first_name || ' ' || last_name || '의 급여는 10% 인상되어 '|| salary * 1.1 ||'이다.' 급여인상
from employees;

--. **(이름)의 메일주소는**이고 핸드폰번호는**이다. 다음과 같이 출력하기 column이름은 연락처

select first_name ||' '|| last_name || '의 메일주소는 '|| email ||'이고 핸드폰번호는'|| phone_number ||'이다.' 연락처
from employees;


-- **(국가) **(지역)주 **(도시)시 **(주소)의 우편번호는 **이다. 다음과 같이 출력하기 column이름은 우편번호

select country_id, state_province, city, street_address ||'의 우편번호는 '|| postal_code||'이다.' 우편번호
from locations;

-- "000 사원 - 이메일 : 000@gamil.com / 전화번호 : ***.***.****" 형식으로 출력하세요 (이름은 '이름 성' 형식)

select first_name || ' ' || last_name || ' 사원 - 이메일 :' || email || '@gmail.com / 전화번호: ' || phone_number 
from employees;

-- 도로 주소, 도시명, 주이름, 국가ID" 형식으로 출력하세요 (Column명은 '주소')

select street_address||', ' || city||' , '||state_province||' ,'|| country_id 주소
from locations;

-- 사원의 최대 연봉과 최소 연봉의 평균을 구하고 별칭을 "평균급여"라고 줘라. 

select
from

-- 사원의 이메일과 전화번호를 결합하여 "회신"이라는 별칭으로 리스트를 만들어라. (이메일과 전화번호 사이에는 /추가)

select email || ' / ' || phone_number 회신
from employees;

-- 사원의 id와 부서id를 활용하여 어디 소속인지 알아내라

select
from

-- 사원들이 얼마의 커미션을 받는지 구하라( 알수 없을땐 0으로 구한다.)

select nvl(commission_pct,0)
from employees;

--(풀네임)의 전화번호는 (전화번호)입니다. 별칭 : 사원 전화번호

select first_name || ' '|| last_name || '의 전화번호는 '|| phone_number || '입니다' "사원 전화번호"
from employees;

