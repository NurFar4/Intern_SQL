CREATE
OR REPLACE FUNCTION age (date_of_birth IN DATE) RETURN NUMBER IS current_age NUMBER;
BEGIN current_age := TRUNC((SYSDATE – date_of_birth) / 365.25);
RETURN current_age;
END;
/ 

--Call Function
DECLARE calculated_age NUMBER;
current_dob DATE := TO_DATE ('07/01/1971', 'DD/MM/YYYY');
BEGIN calculated_age := age(current_dob);
DBMS_OUTPUT.PUT_LINE(‘ Calculated age is ’ || calculated_age);
END;
/

EXECUTE age(current_dob);