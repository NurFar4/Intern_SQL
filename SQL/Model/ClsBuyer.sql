DROP SEQUENCE buyer_idseq;

-- Sample Sequence
CREATE SEQUENCE [buyer_idseq] AS INT START WITH 1001 INCREMENT BY 1 MAXVALUE 9999;

-- Sample Table
CREATE TABLE dbo.TShopeeBuyer(
    buyer_id INT DEFAULT(NEXT VALUE FOR buyer_idseq) not null,
    buyer_username VARCHAR(100) not null,
    buyer_name VARCHAR(100),
    buyer_mobile_phone VARCHAR(20) not null,
    CONSTRAINT buyer_id_pk PRIMARY KEY (buyer_id)
);

-- Sample Select
SELECT
    buyer_name
FROM
    dbo.TShopeeBuyer WITH (NOLOCK);

-- Sample Update
UPDATE
    dbo.TShopeeBuyer
SET
    buyer_name = 'Gay'
WHERE
    buyer_username = 'ericc81';

-- Sample Delete
DELETE FROM
    dbo.TShopeeBuyer
WHERE
    buyer_username = 'ericc81';

-- Sample Insert
INSERT INTO
    dbo.TShopeeBuyer
VALUES
(
    NEXT VALUE FOR buyer_idseq,
    'ericc81',
    'asdf',
    'Normal'
);