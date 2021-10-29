SELECT  last_name
       ,first_name 
       ,TRUNC((SYSDATE - hire_date)/365.25)
FROM employees; 