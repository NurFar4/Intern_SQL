-- Stock Warehouse
DROP TABLE dbo.TShopeeStockWarehouse;

CREATE TABLE dbo.TShopeeStockWarehouse(
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
    detail_id INT,
    CONSTRAINT stock_warehouse_id_pk PRIMARY KEY(stock_warehouse_id)
);

-- Stock Item Table
DROP TABLE dbo.TShopeeStockItem;

CREATE TABLE dbo.TShopeeStockItem(
    stock_item_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    description VARCHAR(max),
    stock_quantity DECIMAL(10, 6),
    product_id INT,
    stock_warehouse_id INT,
    detail_id INT,
    CONSTRAINT stock_item_id_pk PRIMARY KEY(stock_item_id)
);

-- Product Brand Table
DROP TABLE dbo.TShopeeProductBrand;

CREATE TABLE dbo.TShopeeProductBrand(
    product_brand_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    code VARCHAR(20),
    detail_id INT,
    CONSTRAINT product_brand_id_pk PRIMARY KEY(product_brand_id)
);

-- Product Category Table
DROP TABLE dbo.TShopeeProductCategory;

CREATE TABLE dbo.TShopeeProductCategory(
    product_category_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    code VARCHAR(20),
    detail_id INT,
    CONSTRAINT product_category_id_pk PRIMARY KEY(product_category_id)
);

-- Product Type Table
DROP TABLE dbo.TShopeeProductType;

CREATE TABLE dbo.TShopeeProductType(
    product_type_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    code VARCHAR(20),
    detail_id INT,
    CONSTRAINT product_type_id_pk PRIMARY KEY(product_type_id)
);

-- Product Model Table
DROP TABLE dbo.TShopeeProductModel;

CREATE TABLE dbo.TShopeeProductModel(
    product_model_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    code VARCHAR(20),
    detail_id INT,
    CONSTRAINT product_model_id_pk PRIMARY KEY(product_model_id)
);

-- Product Variety Table
DROP TABLE dbo.TShopeeProductVariety;

CREATE TABLE dbo.TShopeeProductVariety(
    product_variety_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    code VARCHAR(20),
    detail_id INT,
    CONSTRAINT product_variety_id_pk PRIMARY KEY(product_variety_id)
);

-- Supplier Table
DROP TABLE dbo.TShopeeSupplier;

CREATE TABLE dbo.TShopeeSupplier(
    supplier_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    code VARCHAR(20),
    nation VARCHAR(20),
    poc_name VARCHAR(max),
    poc_email VARCHAR(max),
    poc_phone_number VARCHAR(20),
    detail_id INT,
    CONSTRAINT supplier_id_pk PRIMARY KEY(supplier_id)
);

-- Supplier Shipment Table
DROP TABLE dbo.TShopeeSupplierShipment;

CREATE TABLE dbo.TShopeeSupplierShipment(
    supplier_shipment_id INT IDENTITY(1, 1) not null,
    received_date DATETIME,
    supplier_tracking_id VARCHAR(max),
    NTL_tracking_id VARCHAR(max),
    height DECIMAL(10, 6),
    width DECIMAL(10, 6),
    length DECIMAL(10, 6),
    supplier_id INT,
    product_id INT,
    detail_id INT,
    CONSTRAINT supplier_shipment_id_pk PRIMARY KEY(supplier_shipment_id)
);

-- Product Table
-- We don't use ID, when we can create new object in input
DROP TABLE dbo.TShopeeProduct;

CREATE TABLE dbo.TShopeeProduct(
    product_id INT IDENTITY(1, 1) not null,
    product_code VARCHAR(50),
    name VARCHAR(max),
    description VARCHAR(max),
    SKU VARCHAR(50),
    SKU2 VARCHAR(50),
    buy_price DECIMAL(10, 2),
    sell_price DECIMAL(10, 2),
    product_brand_id INT,
    product_model_id INT,
    product_category_id INT,
    product_type_id INT,
    product_variety_id INT,
    product_status_id INT,
    detail_id INT,
    CONSTRAINT product_id_pk PRIMARY KEY(product_id)
);

-- Product Status Table
-- E.g.
-- In Stock
-- Empty
-- Used
-- New
DROP TABLE dbo.TShopeeProductStatus;

CREATE TABLE dbo.TShopeeProductStatus(
    product_status_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    detail_id INT,
    CONSTRAINT product_status_id_pk PRIMARY KEY(product_status_id)
);

-- Product Components Table
DROP TABLE dbo.TShopeeProductComponent;

CREATE TABLE dbo.TShopeeProductComponent(
    product_component_id INT IDENTITY(1, 1) not null,
    master_product_id INT,
    sub_product_id INT,
    quantity INT,
    detail_id INT,
    CONSTRAINT product_component_id_pk PRIMARY KEY(product_component_id)
);

-- Production Table
DROP TABLE dbo.TShopeeProduction;

CREATE TABLE dbo.TShopeeProduction(
    production_id INT IDENTITY(1, 1) not null,
    title VARCHAR(max),
    description VARCHAR(max),
    staff_name VARCHAR(max),
    created_date DATETIME,
    total_usage DECIMAL(10, 6),
    production_status_id INT,
    detail_id INT,
    CONSTRAINT production_id_pk PRIMARY KEY(production_id)
);

-- Production Status
DROP TABLE dbo.TShopeeProductionStatus;

CREATE TABLE dbo.TShopeeProductionStatus(
    production_status_id INT IDENTITY(1, 1) not null,
    name VARCHAR(50),
    detail_id INT,
    CONSTRAINT production_status_id_pk PRIMARY KEY(production_status_id)
);

-- Production Detail Table
DROP TABLE dbo.TShopeeProductionDetail;

CREATE TABLE dbo.TShopeeProductionDetail(
    production_detail_id INT IDENTITY(1, 1) not null,
    UOM VARCHAR(100),
    manufactured_date DATETIME,
    expiry_date DATETIME,
    height DECIMAL(10, 6),
    width DECIMAL(10, 6),
    length DECIMAL(10, 6),
    quantity DECIMAL(10, 6),
    cannot_be_used INT,
    can_be_used INT,
    production_id INT,
    product_id INT,
    detail_id INT,
    CONSTRAINT production_detail_id_pk PRIMARY KEY(production_detail_id)
);