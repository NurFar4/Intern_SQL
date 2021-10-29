--Creating View
CREATE
OR REPLACE VIEW faculty_view AS
SELECT
    f_id,
    f_last,
    f_first,
    f_mi,
    loc_id,
    f_phone,
    f_rank
FROM
    faculty;

--Deleting View
DROP VIEW faculty_view;

Select
    count(*)
from
    faculty_view;

Select
    count(*)
from
    faculty;

INSERT INTO
    faculty_view
VALUES
    (6, 'May', 'Lisa', 'I', 11, '7155552508', 'INST');

Select
    count(*)
from
    faculty_view;

Select
    count(*)
from
    faculty;

--Query Using View
SELECT
    f_last,
    f_first,
    bldg_code,
    room
FROM
    faculty_view,
    location
WHERE
    faculty_view.loc_id = location.loc_id;

--Modify View
CREATE
OR REPLACE VIEW location_view AS
select
    *
from
    location;

CREATE
OR REPLACE VIEW location_view AS
select
    *
from
    location;

CREATE
OR REPLACE VIEW location_view2 AS
select
    *
from
    location_view
where
    bldg_code = 'BUS';

Select
    *
from
    location_view2;

--Update view
update
    location_view2
set
    bldg_code = 'CR'
where
    loc_id = 8;

select
    *
from
    location_view2;

Rollback;

--Views Are dynamic, subquery are dynamic
--Check Option
--Check limits the values inserted (Some Sort Of Validation)
CREATE
OR REPLACE VIEW location_view3 AS
SELECT
    *
from
    location_view
WHERE
    bldg_code = 'BUS' WITH CHECK OPTION;

select
    *
from
    location_view3;

update
    location_view3
set
    bldg_code = 'CR'
where
    loc_id = 8;

select
    *
from
    location_view3;

--Views that cannot be updated
CREATE
OR REPLACE VIEW location3 AS
SELECT
    count(*) as cnt
FROM
    location;

SELECT
    *
FROM
    location3;

INSERT INTO
    location3
values
    (2);

--Usage of View
--Simplify Complex Operations
CREATE
OR REPLACE VIEW inventory_view AS
SELECT
    item_desc,
    inv_size,
    color,
    inv_price,
    inv_qoh,
    inv_price * inv_qoh AS value
FROM
    inventory,
    item
WHERE
    item.item_id = inventory.item_id
ORDER BY
    item_desc;

SELECT
    item_desc,
    SUM(value)
FROM
    inventory_view
GROUP BY
    item_desc;

--With Read Only
--Should be Self Explanatory (Unable to update, insert delete)
CREATE
OR REPLACE VIEW location_view4 AS
SELECT
    *
FROM
    location WITH READ ONLY;

UPDATE
    location_view4
SET
    bldg_code = 'CR'
WHERE
    loc_id = 8;

--Sequence
CREATE SEQUENCE idseq START WITH 20 MAXVALUE 9999 NOCYCLE;

SELECT
    sequence_name
FROM
    user_sequences;

Select
    idseq.NEXTVAL
from
    dual;

Select
    idseq.CURRVAL
from
    dual;

--Synonym
--Shortcut for typing columns
CREATE PUBLIC SYNONYM loc FOR location;

INSERT INTO
    loc
VALUES
    (system.idseq.NEXTVAL, 'CR', '135', 50);

--Drop Synonym
Drop public synonym loc;

Drop synonym loc;

--Create Index
CREATE INDEX course_section_max_enrl ON course_section(max_enrl);

SELECT
    rowid,
    max_enrl
FROM
    course_section
ORDER BY
    max_enrl;

--Create Composite Index
CREATE INDEX consultant_skill_skill_id_cert ON consultant_skill(skill_id, certification);

SELECT
    *
FROM
    consultant_skill;

SELECT
    ROWID,
    skill_id,
    certification
FROM
    consultant_skill
ORDER BY
    skill_id,
    certification;

SELECT
    *
FROM
    consultant_skill
WHERE
    skill_id = 1
    AND certification = 'Y';

--View Index
SELECT
    index_name
FROM
    user_indexes;

--Drop Index
DROP INDEX course_section_max_enrl;