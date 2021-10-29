DROP SEQUENCE product_transaction_idseq;

-- Sample Sequence
CREATE SEQUENCE [product_transaction_idseq] AS INT START WITH 1001 INCREMENT BY 1 MAXVALUE 9999;

-- Sample Table
CREATE TABLE dbo.TShopeeProduct(
    product_transaction_id INT DEFAULT(NEXT VALUE FOR product_transaction_idseq) not null,
    product_id VARCHAR(20) not null,
    product_name VARCHAR(max) not null,
    product_variety VARCHAR(max),
    product_stock_quantity INT,
    product_unit_price DECIMAL(10, 2),
    CONSTRAINT product_transaction_id_pk PRIMARY KEY (product_transaction_id)
);

-- Sample Select
SELECT
    product_quantity
FROM
    dbo.TShopeeProduct WITH (NOLOCK);

-- Sample Update
UPDATE
    dbo.TShopeeProduct
SET
    product_quantity = 16
WHERE
    product_id = '12822727955';

-- Sample Delete
DELETE FROM
    dbo.TShopeeProduct
WHERE
    product_id = '12822727955';

-- Sample Insert
INSERT INTO
    dbo.TShopeeProduct
VALUES
    (
        NEXT VALUE FOR product_transacseq,
        '12822727955',
        'asdf',
        'Normal',
        9,
        10
    )