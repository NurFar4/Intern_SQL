alter session
set
    "_ORACLE_SCRIPT" = true;

--Creating a user
CREATE USER demo IDENTIFIED BY demopass;

--Create Role
CREATE ROLE demo_role;

--Grant Privileges
GRANT CREATE SESSION,
CREATE TABLE TO demo_role;

GRANT
SELECT
,
INSERT
,
UPDATE
,
    DELETE ON regions TO demo_role;

--Change Password
ALTER USER demo identified by 1234;

--Remove Role
DROP ROLE demo_role;

--Remove Users
DROP demo;

--Revoke Privileges
REVOKE CREATE SESSION
FROM
    demo_role;

--See User Privilege
SELECT
    *
FROM
    USER_SYS_PRIVS;

SELECT
    *
FROM
    USER_TAB_PRIVS;

SELECT
    *
FROM
    USER_ROLE_PRIVS;