/*Procedure 1,2*/
select
    s.staff_id,
    s.staff_lname || ' ' || s.staff_fname "Name",
    s.staff_position "Job Title",
    d.department_name "Department"
from
    staff s,
    department d
where
    s.department_id = d.department_id;
    /*Procedure 3,4*/
select
    s.staff_id,
    s.staff_lname || ' ' || s.staff_fname "Name",
    s.staff_position "Job Title",
    'RM ' || s.staff_salary "Salary",
    d.department_name "Department"
from
    staff s,
    department d
where
    s.department_id = d.department_id
    and s.staff_id = 'S1013';
select
    s.staff_id,
    s.staff_lname || ' ' || s.staff_fname "Name",
    s.staff_position "Job Title",
    'RM ' || s.staff_salary "Salary",
    d.department_name "Department"
from
    staff s,
    department d
where
    s.department_id = d.department_id
    and d.department_name = 'Admission';
select
    *
from
    medicine_distribution;
select
    m.medicine_id,
    m.medicine_name,
    md.report_id
from
    medicine m,
    medicine_distribution md
where
    m.medicine_id = md.medicine_id
order by
    1;

select
    f.facility_id,
    f.facility_name,
    s.service_name,
    s.service_description,
    s.service_id
from
    facility f,
    service s
where
    f.facility_id = s.facility_id;

select
    medicine_id "ID",
    medicine_name "Name",
    'RM ' || medicine_unitprice "Unit Price"
from
    medicine;