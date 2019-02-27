-- 반올림

-- 0은 소숫점 기준으로 왼쪽 첫번째자리
-- 양수는 소숫점 기준으로 오른쪽
-- 음수는 소숫점 기준으로 왼쪽


select 1234.5438, round (1234.5438, 0), round (1234.5438,1), round (1234.5438, -1),
        round (1234.6438, 3),  round(1234.5438, -3)
from dual;


-- 절삭

select 1234.5438, trunc (1234.5438, 0), trunc (1234.5438,1), trunc (1234.5438, -1),
        trunc (1234.6438, 3),  trunc (1234.5438, -3), trunc (123.456, 2)
from dual;

-- 소숫점 이하 절삭

select floor (1234.5438)
from dual;

-- 나머지 연산

select mod(5, 3)
from dual;

-- 절대값

select abs(-5)
from dual;

-- 사원의 사번, 이름, 급여, 커미션포함급여
-- 커미션 포함 급여는 100의 자리수로 표현(반올림)

select employee_id, first_name, salary, commission_pct * salary+salary, round(commission_pct * salary + salary, -2)
from employees
where commission_pct is not null;

-- 문자함수
-- initcap : 이니셜의 첫문자를 대문자로 
-- length : 문자열의 갯수

select 'KITRi', lower('kiTRI'), upper('kiTRI'), initcap('kiTRI'), length('kiTRI')
from dual;

-- full name
-- concat 문자열을 합치는 함수

select first_name ||' '|| last_name full_name, employee_id, concat(to_char(sysdate, 'yy.mm.dd.hh24:mi:ss'), concat(' ', concat (first_name, concat(' ', last_name))))
from employees;


-- 인자값은 1부터 시작한다.
-- 2 ~ 6 
-- instr ('인자', 알파벳) : 인자의 알파벳의 자릿수 

select 'hello oracle !!!', substr('hello orale!!!', 2,6), substr('hello orcle!!', 2), instr('hello oracle !!!', 'e',3), instr('hello oracle !!!o', 'e')
from dual;

-- '123-456' zipcode, 123 zip1, 456 zip2

select  '123-456' zipcode, 123 zip1, 456 zip2, substr('123-456', 1, instr('123-456','-') -1 ) zip1, substr('123-456', instr('123-456','-') +1 ) zip2
from dual;

-- 날짜함수

select sysdate, to_char(sysdate + 3 / 24 / 60 /60, 'yy.mm.dd.hh24:mi:ss') 
from dual;

-- 개월 차이

select sysdate, months_between(sysdate, sysdate +70)
from dual;

-- 오늘 기준으로 다음 일요일이 언제냐?
-- 오늘 기준으로 다음 화요일이 언제냐?

select sysdate, next_day(sysdate,1), next_day(sysdate, 3)
from dual;

-- 개월 수 추가 

select sysdate, add_months(sysdate, 2)
from dual;

-- 이번달에 마지막 날

select last_day(sysdate)
from dual;

-- to_char 문자열로 return
-- w 이번달의 몇번째 주
-- ww 1년중에 몇번째 주
-- d 요일
-- dd 한달중에 몇번째 날 (일)
-- ddd 1년중 몇번째 날
-- dy 요일의 세글자
-- day 요일의 풀네임
-- am, pm 오전 오후
-- hh 12시간 기준
-- hh24: 24시간 기준
-- mi 분
-- ss 초

select   sysdate, to_char(sysdate, 'w ww d dd ddd dy day '),
                to_char(sysdate, 'am pm hh hh24: mi ss')
from dual;

select to_char(sysdate, 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate, 'yy'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate, 'mm'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate, 'dd'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate, 'hh'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(round(sysdate, 'mi'), 'yyyy.mm.dd.hh24:mi:ss')
from dual

union

select to_char(sysdate, 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(trunc(sysdate), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(trunc(sysdate, 'yy'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(trunc(sysdate, 'mm'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(trunc(sysdate, 'dd'), 'yyyy.mm.dd.hh24:mi:ss'), 
            to_char(trunc(sysdate, 'hh'), 'yyyy.mm.dd.hh24:mi:ss'),
            to_char(trunc(sysdate, 'mi'), 'yyyy.mm.dd.hh24:mi:ss')
from dual;

-- 변환함수
-- 숫자는 오른쪽 정렬
-- 문자는 왼쪽 정렬
-- 오라클의 +는 산술연산밖에 안된다.

select 'a', 3, '3', 3 + 5, '3' + 5 -- 자동형변환
from dual;

-- ,
-- .
-- o
-- 9
-- L
-- $

select length(1123456.789), 
            length(to_char(1123456.789, '000,000,000.00')),
            length(to_char(1123456.789, '999,999,999.99'))
from dual;

select 1123456.789, to_char(1123456.789, 'L000,000,000.00'),
                    to_char(1123456.789, '$999,999,999.')
from dual;

select to_number('123,345.98', '000000.00')
from dual;

select to_char(13213216.7213, 'L99999990.0000')
from dual;

select to_number('21315153,321312.2313', '00000000000000.0000')
from dual;

select sysdate, to_char(sysdate, 'yy.mm.dd'),
            to_char(sysdate, 'am hh:mi:ss'),
            to_char(sysdate, 'hh24:mi:ss')
from dual;

-- 20190225142154 >> 날짜 >> 3일후

select to_char (to_date (to_char (20190225142154, '00000000000000'),'yyyy.mm.dd.hh24:mi:ss') + 2,'yyyy.mm.dd.hh24:mi:ss')
from dual;

-- 일반 함수

select commission_pct, nvl(commission_pct, 0), nvl2(commission_pct, 1, 0)
from employees;

-- 연봉 등급
-- 급여가 4000 미만인 사원은 박봉
-- 급여가 10000 미만  평균연봉
-- 급여가 10000 이상은 고연봉
-- 사번, 이름, 급여, 연봉등급

select employee_id, concat(first_name, concat(' ',last_name)), salary, 
    
        case 
        when salary < 4000  then '박봉'
        when salary < 10000 then '평균연봉'
        else '고연봉'
        end 연봉등급
        
from employees
order by salary desc;

-- 사원구분
-- 1980년도 입사 임원
-- 90년도 평사원
-- 2000 신입사원
-- 사번, 이름, 입사일, 사원구분

select employee_id, first_name, hire_date,
        
        case when to_number(to_char(hire_date, 'yyyy'), '0000') between 1980 and 1989 then '임원'
        when to_number(to_char(hire_date, 'yyyy'), '0000') between 1990 and 1999 then '평사원'
        else '신입사원'
        end 사원구분

from employees
order by 3;

select employee_id, first_name, hire_date,

        case when substr(to_char(trunc(hire_date, 'yyyy'), 'yyyy'), 1, 3 ) = '198' then '임원'
        when substr(to_char(trunc(hire_date, 'yyyy'), 'yyyy'), 1, 3) = '199' then '평사원'
        else '신입사원'
        end 사원구분

from employees;



-- 꼭 외우기 

select ascii('0'), ascii('A'), ASCII('a')
from dual;

select case when 'abc' < 'acd' then '작다'
end 
from dual;

Select Instr('TEST SAMPLE CODE','E',1, 1) 
From Dual;

-- 'TEST SMAPLE CODE' 라는 구분에서 'E'를 찾는데 1부터 시작을 해서 1번째 찾아가는 'E'의 위치는 어디인가?

select instr('TEST SMAPLE CODE', 'E', 3, 1)
from dual;

-- 'TEST SMAPLE CODE' 라는 구분에서 'E'를 찾는데 3부터 시작을 해서 1번째 찾아가는 'E'의 위치는 어디인가?

SELECT INSTR('TEST SMAPLE CODE', 'E', 3, 2)
FROM DUAL;

-- 'TEST SMAPLE CODE' 라는 구분에서 'E'를 찾는데 3부터 시작을 해서 2번째 찾아가는 'E'의 위치는 어디인가?


-- 부서명의 마지막 글자를 제외하고 출력하라.
-- 기존 부서명, 마지막 글자를 제외한 부서명으로 정렬

select department_name, substr(department_name, 1, length(department_name) - 1)
from departments
order by 2;

-- emp테이블에서 sal이 3000미만 이면 c등급, 3000에서 3900이하 B등급
-- 4000 이상이면 A등급으로 등급을 나타내어라
-- 사번, 이름(풀네임), 급여, 등급별로 정렬


select employee_id, concat(first_name, concat(' ',last_name)), salary,
    case when salary < 3000 then 'C등급'
    when salary between 3000 and 3900 then 'B등급'
    else 'A등급'
    end 등급

from employees
order by 4;

--사번,이름, job_id, 근무상황(별칭)
--미국에서 일하는 부서일 경우 "본사근무"
--캐나다에서 일하는 부서일 경우 "파견근무"
--영국에서 일하는 부서일 경우 "해외출장"
--본사, 파견, 해외 순으로 정렬


select employee_id, first_name, job_id,

case when country_id = 'US' then '본사근무'
when country_id = 'CA' then '파견근무'
else '해외출장'
end 근무상황
from employees ee, departments d, locations l
where l.location_id = d.location_id and d.department_id = nvl(ee.department_id, 80)
order by 4;



--아래와 같이 출력되게 코드를 작성하시오.
--'풀네임'의 부서번호와 부서코드는 '90''AD'이다. 
--부서를 명시할때는 job_id의 앞 두글자(ex)sST,IT,AD)로 명시. 별칭 부서번호와 코드

select concat(first_name, concat(' ',last_name)) ||'의 부서번호와 부서코드는 '||concat( substr(department_id, 1), concat(' ', substr(job_id, 1, 2))) ||' 이다.' 
from employees;

--  Q1. 각 사원의 이름, 부서번호, 급여, 급여별 레벨을 출력하기
-- 단, 레벨의 종류와 기준은 Job_Grades 테이블을 참고한다.
-- 단, 레벨을 기준으로 오름차순 정렬한다.
-- 단, 레벨에 별칭을 준다(급여별 레벨).

select first_name, department_id, salary,
case when salary between 1000 and 2999 then 'A등급'
when salary  between 3000 and 5999 then'B등급'
when salary  between 6000 and 9999 then'C등급'
when salary between 10000 and 14999 then'D등급'
else 'F등급'
end  "급여별 레벨"
from employees
order by 4 asc;

-- Q2. 강의 A가 2019년02월20일부터 2019년07월16일까지 실행될 때, 총 기간이 며칠인지 구하시오
-- 단, 날짜는 20190220, 20190716 형태의 숫자로부터 시작한다.
-- 단, 주말도 포함한다
-- 단, 별칭은 수강기간

select  to_date( to_char (20190220, '00000000'), 'yyyy.mm.dd') 
, to_date( to_char (20190716, '00000000'), 'yyyy.mm.dd'), (to_date( to_char (20190716, '00000000'), 'yyyy.mm.dd')) - to_date( to_char (20190220, '00000000'), 'yyyy.mm.dd') as 수강기간
from dual;


--직책이름, 최대급여, 직무별 소득분류를 출력하시오.-
--이때 최대급여가 10000이하인 직무는 저소득, 10000은 초과하지만20000이하인 직무는 중간소득, 20000을 초과하는 직무는 고소득으로 정하여 직책분류를 만들고, 
--직책이름을 기준으로 정렬하시오. 이때, 직책이름은 모두 대문자로 표기하시오.

select upper(job_title) , max_salary,
case when max_salary < = 10000 then '저소득'
when max_salary > 10000 and max_salary < = 20000 then '중간소득'
else '고소득'
end 직책분류
from jobs
order by job_title; 


--오늘날짜를 yymmdd형식으로 문자로 바꾼후 숫자로 다시바꿔 123456을 더한값을 출력하라.

select to_number(to_char (sysdate, 'yymmdd'), '000000') +123456
from dual;

-- 시스템시간기준 144일후를 yyyy mm dd day 형태로 나타내주세요. 별칭은 "수료일"

select to_char (sysdate +144, 'yyyy.mm.dd.day') as 수료일
from dual;

-- 2019/07/21 은 2019년도로부터 몇 번째 날일까?

select to_char ( sysdate, 'ddd')
from dual;

-- 매니저 번호가 130미만은 초보  130이상 150이하는 중급 그외는 고급이다. 사번 이름 매니저번호를 오름차순으로 정리하라.

select employee_id, first_name, nvl(manager_id, 0),
case when nvl(manager_id, 0) < 130 then '초보'
when manager_id between 130 and 150 then '중급'
else '고급'
end 매니저번호
from employees;

-- 48,456,231.20451 + 30000을 변환함수를 이용하여 푸시오

select 48,456,231.20451, to_number('48,456,231.20451', '00,000,000.00000')  + 30000
from dual;

-- 명예퇴직자
-- 시스템 현재날짜 기준 근속년 30이상 명예퇴직, 그외 보류
-- 사번, 이름, 전화번호, 부서
-- 명예퇴직자 기준 정렬

select employee_id, first_name, phone_number, department_id,
case when to_char( sysdate , 'yyyy') - to_char ( hire_date, 'yyyy') > = 30 then '명예퇴직'
else '보류'
end 명예퇴직자
from employees
order by 5;

-- 10. 사원 전화 번호의 .을 -으로 바꿔 표시하시오.
-- 정답 

select phone_number,
case when instr(phone_number, '.' ,5) = 7
        then substr(phone_number,1,3 ) ||'-'|| substr(phone_number,5,2) ||'-'|| substr(phone_number,8,4)||'-' ||substr(phone_number,13)
        when  instr(phone_number, '.' ,5) = 8
        then substr(phone_number,1,3) ||'-'|| substr(phone_number,5,3) ||'-'|| substr(phone_number,9)
        end "하이픈 표시"
from employees;

-- 임금을 3자리(1000의자리) 에서 반올림하여 표현하시오

select round( salary, -4)
from employees;


-- 사번, 이름, 부서번호
-- 부서번호 60 개발자
-- 90 임원진
-- 나머지 비개발자

select employee_id, concat(first_name, concat(' ', last_name)), nvl(department_id,0),

    case when department_id = 60 then '개발자'
    when department_id = 90 then '임원진'
    else '비개발자'
    end 직원유형

from  employees
order by 4;

-- decode 함수는 등가비교는 불가하다.

select employee_id, first_name, department_id,  
decode(department_id, 60, '개발자', 90, '임원진', '비개발자') 직원유형
from employees;

-- 그룹함수
-- 회사의 총사원수, 급여총합, 급여평균, 최고급여, 최저급여
-- 단일행 함수 count(employee_id) : 총 사원수
-- sum(salary) : 급여의 총합
-- avg(salary) : 급여의 평균
-- max(salary) : 급여의 최고
-- min(salary) : 급여의 최저


Select Count(Employee_Id), Sum(Salary), Avg(Salary), Max(Salary), Min(Salary)
From Employees;

-- 평균급여보다 많이 받는 사원의 사번, 이름, 급여

Select Employee_Id, First_Name, Salary
From Employees
Where Salary > (Select Avg(Salary) From Employees);

