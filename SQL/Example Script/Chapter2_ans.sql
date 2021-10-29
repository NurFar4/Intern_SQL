CREATE TABLE mod_emp (last_name VARCHAR2 (20), Salary NUMBER(8, 2));

ALTER TABLE
    mod_emp
MODIFY
    (last_name VARCHAR2(30));

ALTER TABLE
    mod_emp
MODIFY
    (last_name VARCHAR2(10));

ALTER TABLE
    mod_emp
MODIFY
    (salary NUMBER(10, 2));

ALTER TABLE
    mod_emp
MODIFY
    (salary NUMBER(8, 2) DEFAULT 50);

--Exercise 3
Create Table my_table(
    id VARCHAR2(5),
    Name varchar2(15),
    hobby varchar2(15),
    fav_song varchar2(15),
    fav_book varchar2(15),
    lucky_num number(1) DEFAULT 0,
    birthdate varchar2(20),
    CONSTRAINT my_table_id_pk PRIMARY KEY(id)
);

INSERT INTO
    my_table (
        id,
        name,
        hobby,
        fav_song,
        fav_book,
        lucky_num,
        birthdate
    )
values
    ('hi', 'hi', 'hi', 'hi', 'hi', 9, 'hi');

INSERT INTO
    my_table (
        id,
        name,
        hobby,
        fav_song,
        fav_book,
        birthdate
    )
values
    ('hi2', 'hi2', 'hi2', 'hi2', 'hi2', 'hi2');

CREATE TABLE my_tablecopy1 AS (
    SELECT
        *
    FROM
        my_table
);


INSERT INTO
    my_tablecopy1 (
        id,
        name,
        hobby,
        fav_song,
        fav_book,
        birthdate
    )
values
    ('hi2', 'hi2', 'hi2', 'hi2', 'hi2', 'hi2');

CREATE TABLE my_tablecopy2 AS (
    SELECT
        id,
        name,
        hobby
    FROM
        my_tablecopy1
);