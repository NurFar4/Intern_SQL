-- Syntax
--Procedures
--Receive multiple input parameter
--Return multiple output values
--Function
--Receive multiple input parameter
--Always return single output value
CREATE
OR REPLACE PROCEDURE calc_GPA (
    student_id IN NUMBER,
    term_id IN NUMBER,
    student_GPA OUT NUMBER
) 

CREATE
OR REPLACE PROCEDURE update_enrollment_grade (
    current_s_id IN VARCHAR2,
    current_c_sec_id IN NUMBER,
    current_grade IN CHAR
) IS BEGIN
UPDATE
    enrollment
SET
    grade = current_grade
WHERE
    s_id = current_s_id
    AND c_sec_id = current_c_sec_id;

COMMIT;

END;

/ 

EXECUTE update_enrollment_grade(5, 13, 'B');

--Set Parameter Value to B
DECLARE current_grade_update CHAR := 'B';
BEGIN update_enrollment_grade(5, 13, current_grade_update);
END;
/