-- Production Table
DROP TABLE dbo.TShopeeProduction;

CREATE TABLE dbo.TShopeeProduction(
    production_id INT IDENTITY(1, 1) not null,
    title VARCHAR(max),
    description VARCHAR(max),
    status VARCHAR(20),
    detail_id INT,
    CONSTRAINT production_id_pk PRIMARY KEY(production_id)
);

-- Production Detail Table
DROP TABLE dbo.TShopeeProductionDetail;

CREATE TABLE dbo.TShopeeProductionDetail(
    production_detail_id INT IDENTITY(1, 1) not null,
    UOM VARCHAR(100),
    manufactured_date DATETIME,
    expiry_date DATETIME,
    quantity INT,
    production_id INT,
    product_id INT,
    detail_id INT,
    CONSTRAINT production_detail_id_pk PRIMARY KEY(production_detail_id)
);

-- Stock Warehouse
DROP TABLE dbo.TShopeeStockWarehouse;

CREATE TABLE dbo.TShopeeStockWarehouse(
    stock_warehouse_id INT IDENTITY(1, 1) not null,
    name VARCHAR(50),
    email_address VARCHAR(50),
    phone_number VARCHAR(20),
    address_line_1 VARCHAR(50),
    address_line_2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code INT,
    country VARCHAR(20),
    detail_id INT,
    CONSTRAINT stock_warehouse_id_pk PRIMARY KEY(stock_warehouse_id)
);

-- Stock Item Table
DROP TABLE dbo.TShopeeStockItem;

CREATE TABLE dbo.TShopeeStockItem(
    stock_item_id INT IDENTITY(1, 1) not null,
    name VARCHAR(50),
    description VARCHAR(max),
    stock_quantity INT,
    product_id INT,
    stock_warehouse_id INT,
    detail_id INT,
    CONSTRAINT stock_item_id_pk PRIMARY KEY(stock_item_id)
);

-- Product Table

-- We don't use ID, when we can create new object in input
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
    product_brand VARCHAR(50),
    product_type VARCHAR(50),
    product_variety VARCHAR(50),
    detail_id INT,
    CONSTRAINT product_id_pk PRIMARY KEY(product_id)
);

-- Product Brand Table
DROP TABLE dbo.TShopeeProductBrand;

CREATE TABLE dbo.TShopeeProductBrand(
    product_brand_id INT IDENTITY(1, 1) not null,
    name VARCHAR(50),
    detail_id INT,
    CONSTRAINT product_brand_id_pk PRIMARY KEY(product_brand_id)
);

-- Product Type Table
DROP TABLE dbo.TShopeeProductType;

CREATE TABLE dbo.TShopeeProductType(
    product_type_id INT IDENTITY(1, 1) not null,
    name VARCHAR(50),
    detail_id INT,
    CONSTRAINT product_type_id_pk PRIMARY KEY(product_type_id)
);

-- Product Variety Table
DROP TABLE dbo.TShopeeProductVariety;

CREATE TABLE dbo.TShopeeProductVariety(
    product_variety_id INT IDENTITY(1, 1) not null,
    name VARCHAR(50),
    detail_id INT,
    CONSTRAINT product_variety_id_pk PRIMARY KEY(product_variety_id)
);