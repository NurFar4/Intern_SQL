select
    staff_id "ID",
    staff_lname || ' ' || staff_fname "Name",
    staff_position "Job Title"
from
    staff
where
    staff_position in ('Doctor', 'Nurse', 'Admission Staff');

EXECUTE DBMS_OUTPUT.PUT_LINE(overhead_t('asdf'));