DROP SEQUENCE carrier_idseq;

-- Sample Sequence
CREATE SEQUENCE [carrier_idseq] AS INT START WITH 1001 INCREMENT BY 1 MAXVALUE 9999;

-- Sample Table
CREATE TABLE dbo.TShopeeCarrier(
    carrier_id INT DEFAULT(NEXT VALUE FOR carrier_idseq) not null,
    carrier_name VARCHAR(100),
    CONSTRAINT carrier_id_pk PRIMARY KEY (carrier_id)
);

-- Sample Select
SELECT
    carrier_name
FROM
    dbo.TShopeeCarrier WITH (NOLOCK);

-- Sample Update
UPDATE
    dbo.TShopeeCarrier
SET
    carrier_name = 'gay'
WHERE
    carrier_id = '1001';

-- Sample Delete
DELETE FROM
    dbo.TShopeeCarrier
WHERE
    carrier_id = '1001';

-- Sample Insert
INSERT INTO
    dbo.TShopeeCarrier
VALUES
(
    NEXT VALUE FOR carrier_idseq,
    'asdf',
);