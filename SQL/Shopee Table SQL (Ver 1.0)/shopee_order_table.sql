DROP TABLE dbo.shopee_order_detail;

/*
 order status => Completed , Cancelled
 Payment Method => 
 Refund Status => True, False
 */
CREATE TABLE dbo.shopee_order_detail(
    order_transaction_no INT DEFAULT(NEXT VALUE FOR order_transacseq) not null,
    order_id VARCHAR(50) not null,
    order_status VARCHAR(20),
    payment_method VARCHAR(50),
    voucher_code VARCHAR(50),
    buyer_username VARCHAR(100) not null,
    buyer_name VARCHAR(100),
    buyer_mobile_phone VARCHAR(12) not null,
    product_name VARCHAR(max) not null,
    carrier_name VARCHAR(100),
    tracking_id VARCHAR(20),
    shipping_address VARCHAR(max),
    variety VARCHAR(max),
    refund_status VARCHAR(10),
    product_quantity INT,
    product_unit_price DECIMAL(10, 2),
    product_sub_total DECIMAL(10, 2),
    shipping_fee DECIMAL(10, 2),
    extra_charges DECIMAL(10, 2),
    order_income DECIMAL(10, 2),
    purchase_date_time DATETIME,
    CONSTRAINT order_transaction_no PRIMARY KEY (order_transaction_no),
    CONSTRAINT chk_order_status CHECK(
        order_status IN ('Completed', 'Cancelled', 'Shipped', 'To ship')
    ),
    CONSTRAINT chk_refund_status CHECK(refund_status IN ('True', 'False'))
);

-- Sample Sequence
CREATE SEQUENCE [order_transacseq] AS INT START WITH 1001 INCREMENT BY 1 MAXVALUE 9999;

-- Sample Insert
INSERT INTO
    dbo.shopee_order_detail
VALUES
    (
        NEXT VALUE FOR order_transacseq,
        '210826JW8FCH49',
        'Completed',
        'Credit / Debit Card',
        'No Voucher Code',
        'ericc81',
        'Eric',
        '60125250889',
        'DESI''Q PURE GHEE / MINYAK SAPI TULEN / DESIQ - (400G)',
        'DHL eCommerce',
        '5920119475479211',
        '8, Jalan Serendah 26/41, Sekitar 26, Shah Alam, 40400, Selangor',
        'Normal',
        'false',
        2,
        31.88,
        63.76,
        0.0,
        1.35,
        62.41,
        CONVERT(DATETIME, '2021-08-26 12:04:00')
    );

-- Sample Delete
DELETE FROM
    dbo.shopee_order_detail
WHERE
    order_transaction_no = 1034;

-- Sample Update
UPDATE
    dbo.shopee_order_detail
SET
    product_quantity = 16
WHERE
    order_transaction_no = 1034;

-- Sample Select
SELECT
    product_quantity
FROM
    dbo.shopee_order_detail WITH (NOLOCK);

-- Sample Procedure
CREATE
OR ALTER PROCEDURE update_product_quantity (@PID INT, @OID VARCHAR(100)) AS BEGIN
SET
    NOCOUNT ON
SELECT
    CONCAT(CONVERT(VARCHAR, @PID), ' ', @OID)
END;

DROP PROCEDURE dbo.update_product_quantity;

EXEC update_product_quantity 22,
'210826JW8FCH49' -- Sample Function
CREATE
OR ALTER FUNCTION add_five (@PID INT, @AID INT) RETURNS INT AS BEGIN DECLARE @TMP INT;

SET
    @TMP = @PID + @AID + 5;

RETURN(@TMP);

END;

DROP FUNCTION dbo.add_five;

SELECT
    dbo.add_five(5, 6);