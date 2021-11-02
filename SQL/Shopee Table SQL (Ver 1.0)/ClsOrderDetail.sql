DROP SEQUENCE order_transaction_idseq;

-- Sample Sequence
CREATE SEQUENCE [order_transaction_idseq] AS INT START WITH 1001 INCREMENT BY 1 MAXVALUE 9999;

-- Sample Table
CREATE TABLE dbo.TShopeeOrderDetail(
    order_transaction_id INT DEFAULT(NEXT VALUE FOR order_transaction_idseq) not null,
    order_id VARCHAR(50) not null,
    product_transaction_id INT,
    product_quantity INT,
    sub_total DECIMAL(10, 2),
    CONSTRAINT order_transaction_id_pk PRIMARY KEY (order_transaction_id)
);

-- Sample Select
SELECT
    order_id
FROM
    dbo.TShopeeOrderDetail WITH (NOLOCK);

-- Sample Update
UPDATE
    dbo.TShopeeOrderDetail
SET
    order_id = '1003'
WHERE
    product_id = '12822727955';

-- Sample Delete
DELETE FROM
    dbo.TShopeeOrderDetail
WHERE
    product_id = '12822727955';

-- Sample Insert
INSERT INTO
    dbo.TShopeeOrderDetail
VALUES
(
    NEXT VALUE FOR order_transacseq,
    '210826JW8FCH49',
    '12822727955'
);