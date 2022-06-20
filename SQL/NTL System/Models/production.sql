-- Products Table
DROP TABLE dbo.TNtlProduct;

CREATE TABLE dbo.TNtlProduct(
    product_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    description VARCHAR(max),
    SKU VARCHAR(50),
    SKU2 VARCHAR(50),
    buy_price DECIMAL(10, 2),
    sell_price DECIMAL(10, 2),
    CONSTRAINT product_id_pk PRIMARY KEY(product_id)
);

-- Product Template Table (Intentionally Left Out)

-- Product Variant Combination (Intentionally Left Out)

-- Product Attribute Value Table
DROP TABLE dbo.TNtlProductAttributeValue;

CREATE TABLE dbo.TNtlProductAttributeValue(
    product_attribute_value_id INT IDENTITY(1, 1) not null,
    product_id INT,
    attribute_value_id INT,
    CONSTRAINT product_attribute_value_id PRIMARY KEY(product_attribute_value_id)
);

-- Product Component Table
DROP TABLE dbo.TNtlProductComponent;

CREATE TABLE dbo.TNtlProductComponent(
    product_component_id INT IDENTITY(1, 1) not null,
    master_product_id INT,
    sub_product_id INT,
    quantity INT,
    CONSTRAINT product_component_id_pk PRIMARY KEY(product_component_id)
);

-- Stock Warehouse
DROP TABLE dbo.TNtlStockWarehouse;

CREATE TABLE dbo.TNtlStockWarehouse(
    stock_warehouse_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    email_address VARCHAR(50),
    phone_number VARCHAR(20),
    address_line_1 VARCHAR(50),
    address_line_2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code INT,
    country VARCHAR(20),
    CONSTRAINT stock_warehouse_id_pk PRIMARY KEY(stock_warehouse_id)
);

-- Stock Item Table
DROP TABLE dbo.TNtlStockItem;

CREATE TABLE dbo.TNtlStockItem(
    stock_item_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    description VARCHAR(max),
    quantity DECIMAL(10, 6),
    product_id INT,
    uom_id INT,
    stock_warehouse_id INT,
    CONSTRAINT stock_item_id_pk PRIMARY KEY(stock_item_id)
);