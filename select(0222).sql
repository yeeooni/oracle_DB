-- 사원의 최대 연봉과 최소 연봉의 평균을 구하고 별칭을 "평균급여"라고 줘라. 

select  (highest_sal+lowest_sal)/2 as 평균급여
from job_grades;

-- 사원들이 얼마의 커미션을 받는지 구하라( 알수 없을땐 0으로 구한다.)

select nvl(commission_pct,0)
from employees;

-- (풀네임)의 전화번호는 (전화번호)입니다. 별칭 : 사원 전화번호

select first_name ||' '|| last_name ||'의 전화번호는 '|| phone_number ||'입니다.' "사원 전화번호"
from employees;

-- (직무이름)의 평균 임금은 (평균 급여)원 입니다. 별칭 : 직무별 평균 급여

select job_id ||'의 평균 임금은 ' || salary / 20 ||' 원 입니다.' as "직무별 평균 급여"
from employees;

-- 출력 결과: 프로젝트 진행 기간은 (프로젝트 진행 기간) 입니다. 별칭: 프로젝트 진행 기간 (띄어쓰기 존재)

select '프로젝트 진행 기간은 '|| start_date||' ~ '|| end_date ||' 입니다.' "프로젝트 진행 기간"
from job_history;

-- 출력 결과: (부서 이름) 의관리자번호는 (매니저 번호) 입니다. -참고 별칭: 부서 이름 별칭: 메니저 번호 (행 4개)

select department_id ||' 의 관리자 번호는 '|| phone_number ||' 입니다.' " 매니저 번호 "
from employees;

-- 부서 번호가 xx인 부서의 이름은 xx 입니다.

select '부서 번호가 ' || department_id || '인 부서의 이름은 ' || department_name ||'입니다.'
from departments;

-- 사원 번호 xx는 xx날부터 프로젝트를 시작했습니다.

select '사원 번호 '|| employee_id ||'는 '|| start_date ||'날부터 프로젝트를 시작했습니다.'
from job_history;

-- employees테이블 제일 앞 열에 새로운 오늘의 날짜를 붙이고 부서번호가 null인 사람을 찾아서 null을 80으로 바꿔라.

select '2019.02.22'|| employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id, nvl(department_id,80)
from employees;

-- 유럽 영국에서 일하는 사람 중에 봉급을 제일 많이 받는사람은? Ellen Abel

-- jobs 테이블에서 직무 이름과 최소 급여, 최대급여, 평균급여를 출력하고 평균급여의 별칭을 평균 급여로 하시오.

select job_id "직무 이름", min_salary "최소 급여", max_salary "최대 급여", (min_salary+max_salary)/2 "평균 급여"
from jobs;

-- locations 테이블에서 전체주소를 출력하고 별칭을 주소 로 하시오 . (전체주소 : street_address, city, country_ID )

select street_address||' '|| city ||' '||country_id 전체주소
from locations;

-- 부서번호가 ()인 사원의 커미션포함급여는 ()이다. 라고 출력하시오

select '부서번호가'|| department_id ||' 인 사원의 커미션포함급여는'|| (nvl(commission_pct,0)*salary+salary) ||'이다.' 
from employees;

-- 사원이름(풀네임), 입사일, 매니저번호 (매니저가 없을 경우 '-1' 으로 표시)

select first_name ||' '||last_name, hire_date, nvl(manager_id,-1)
from employees;