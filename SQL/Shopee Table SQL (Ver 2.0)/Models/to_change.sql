DROP TABLE dbo.TShopeeProduct;

CREATE TABLE dbo.TShopeeProduct(
    product_id INT IDENTITY(1, 1) not null,
    product_code VARCHAR(20),
    name VARCHAR(50),
    description VARCHAR(max),
    SKU VARCHAR(20),
    SKU2 VARCHAR(20),
    buy_price DECIMAL(10, 2),
    sell_price DECIMAL(10, 2),
    product_brand_id INT,
    product_type_id INT,
    product_variety_id INT,
    detail_id INT,
    CONSTRAINT product_id_pk PRIMARY KEY(product_id)
);