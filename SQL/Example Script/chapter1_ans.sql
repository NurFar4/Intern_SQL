--Answers
alter session
set
    "_ORACLE_SCRIPT" = true;

create user Scott identified by tiger;

GRANT CREATE SESSION,
CREATE TABLE TO Scott;

GRANT
SELECT
,
INSERT
,
UPDATE
,
    DELETE ON regions TO Scott;

GRANT UNLIMITED TABLESPACE TO Scott;

INSERT into
    regions (region_id, region_name)
values
    (123, 'South Africa');

--Q2
create user bigidea identified by summer;

GRANT CREATE SESSION,
CREATE TABLE TO bigidea;

GRANT
SELECT
,
INSERT
,
UPDATE
,
    ALTER,
    DELETE ON regions TO bigidea;

GRANT UNLIMITED TABLESPACE TO bigidea;

INSERT into
    regions (region_id, region_name)
values
    (124, 'East Africa');

SELECT
    *
FROM
    USER_TAB_PRIVS
where
    table_name = 'regions';

REVOKE SELECT on regions FROM bigidea;