--Save SQL Plus Session
SPOOL D: \ Document y2s3 \ Database \ Practical \ session \ temp.txt SPOOL OFF --Create Table using SubQuery
--Like Creating Minified Table
CREATE TABLE CopyEmpTbl AS (
    SELECT
        employee_id,
        first_name,
        last_name
    FROM
        employees
);

SELECT
    employee_id,
    first_name,
    last_name
from
    CopyEmpTbl;

DROP TABLE CopyEmpTbl CASCADE CONSTRAINTS;

CREATE TABLE CopyEmpSalary AS
SELECT
    employee_id,
    salary * 12 "Annual Salary"
FROM
    employees;

SELECT
    *
FROM
    CopyEmpSalary;

--Data Dictionary
SELECT
    TABLE_NAME
FROM
    USER_TABLES;

SELECT
    TABLE_NAME
FROM
    ALL_TABLES;

SELECT
    TABLE_NAME
FROM
    DBA_TABLES;

--Rename Table
RENAME new_location TO location;

--Read Only Table
ALTER TABLE
    location READ ONLY;

ALTER TABLE
    location READ WRITE;

--Add Attributes to Table
ALTER TABLE
    faculty
ADD
    (f_gender CHAR(1));

--Change Datatype of Attribute
ALTER TABLE
    faculty
MODIFY
    (f_gender CHAR(3));

--Add/Delete/Select Constraints
SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM
    USER_CONSTRAINTS
WHERE
    TABLE_NAME = ‘ FACULTY ’;

ALTER TABLE
    FACULTY
ADD
    CONSTRAINT faculty_loc_id_fk FOREIGN KEY (loc_id) REFERENCES location(loc_id);

SELECT
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM
    USER_CONSTRAINTS
WHERE
    TABLE_NAME = ‘ FACULTY ’;

ALTER TABLE
    faculty
ADD
    CONSTRAINT faculty_f_pin_uk UNIQUE (f_pin);

ALTER TABLE
    faculty DROP CONSTRAINT faculty_f_pin_uk;

--Enabling/Disabling Constraints
ALTER TABLE
    faculty DISABLE CONSTRAINT faculty_LOC_ID_FK;

ALTER TABLE
    faculty ENABLE CONSTRAINT faculty_LOC_ID_FK;

--Drop Table (Best Practice)
DROP TABLE location CASCADE CONSTRAINTS;

--Drop All Table
select 'drop table '||table_name||' cascade constraints;' from user_tables;
