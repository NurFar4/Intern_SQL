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

-- Sample Sequence
CREATE SEQUENCE [carrier_idseq] AS INT START WITH 1001 INCREMENT BY 1 MAXVALUE 9999;

-- Sample Table
CREATE TABLE dbo.TShopeeCarrier(
    carrier_id INT DEFAULT(NEXT VALUE FOR carrier_idseq) not null,
    carrier_name VARCHAR(100),
    CONSTRAINT carrier_id_pk PRIMARY KEY (carrier_id)
);

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

-- Sample Sequence
CREATE SEQUENCE [shipping_detail_idseq] AS INT START WITH 1001 INCREMENT BY 1 MAXVALUE 9999;

-- Sample Table
CREATE TABLE dbo.TShopeeShippingDetail(
    shipping_detail_id INT DEFAULT(NEXT VALUE FOR shipping_detail_idseq) not null,
    tracking_id VARCHAR(20),
    shipping_address VARCHAR(max),
    shipping_status VARCHAR(100),
    shipping_fee DECIMAL(10, 2),
    order_id VARCHAR(100),
    carrier_id INT,
    CONSTRAINT shipping_detail_id_pk PRIMARY KEY (shipping_detail_id),
    CONSTRAINT chk_shipping_status CHECK(
        shipping_status IN ('Completed', 'Cancelled', 'Shipped', 'To ship')
    ),
);