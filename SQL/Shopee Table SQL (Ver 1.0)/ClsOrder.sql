-- Sample Table
CREATE TABLE dbo.TShopeeOrder(
    order_id VARCHAR(50) not null,
    refund_status VARCHAR(10),
    voucher_code VARCHAR(50),
    payment_method VARCHAR(50),
    purchase_date_time DATETIME,
    extra_charges DECIMAL(10, 2),
    order_income DECIMAL(10, 2),
    buyer_id INT,
    shipping_detail_id INT,
    order_transaction_id INT,
    CONSTRAINT order_id_pk PRIMARY KEY (order_id),
    CONSTRAINT chk_refund_status CHECK(refund_status IN ('True', 'False'))
);

-- Sample Select
SELECT
    order_status
FROM
    dbo.TShopeeOrder WITH (NOLOCK);

-- Sample Update
UPDATE
    dbo.TShopeeOrder
SET
    voucher_code = 'Gay'
WHERE
    order_id = '210826JW8FCH49';

-- Sample Delete
DELETE FROM
    dbo.TShopeeOrder
WHERE
    order_id = '210826JW8FCH49';

-- Sample Insert
INSERT INTO
    dbo.TShopeeOrder
VALUES
(
    '210826JW8FCH49',
    'Cancelled',
    'False',
    'Normal',
    'asdf',
    'asdf',
    10,
    12,
    CONVERT(DATETIME, '2021-08-26 12:04:00'),
    9,
    10,
    12
);