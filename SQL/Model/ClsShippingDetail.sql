DROP SEQUENCE shipping_detail_idseq;

-- Sample Sequence
CREATE SEQUENCE [shipping_detail_idseq] AS INT START WITH 1001 INCREMENT BY 1 MAXVALUE 9999;

-- Sample Table
CREATE TABLE dbo.TShopeeShippingDetail(
    shipping_detail_id INT DEFAULT(NEXT VALUE FOR shipping_detail_idseq) not null,
    tracking_id VARCHAR(20),
    shipping_fee DECIMAL(10, 2),
    shipping_address VARCHAR(max),
    shipping_status VARCHAR(100),
    order_id VARCHAR(100),
    carrier_id INT,
    CONSTRAINT shipping_detail_id_pk PRIMARY KEY (shipping_detail_id),
    CONSTRAINT chk_shipping_status CHECK(
        shipping_status IN ('Completed', 'Cancelled', 'Shipped', 'To ship')
    ),
);