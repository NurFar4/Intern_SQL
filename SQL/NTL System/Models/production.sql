-- Products Table
DROP TABLE dbo.TNtlProduct;

CREATE TABLE dbo.TNtlProduct(
    product_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    description VARCHAR(max),
    product_category_id INT,
    product_subcategory_id INT,
    CONSTRAINT product_id_pk PRIMARY KEY(product_id)
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

-- Supplier Table
DROP TABLE dbo.TNtlSupplier;

CREATE TABLE dbo.TNtlSupplier(
    supplier_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    code VARCHAR(max),
    CONSTRAINT supplier_id_pk PRIMARY KEY(supplier_id)
);

-- Supplier Shipment Table
DROP TABLE dbo.TNtlSupplierShipment;

CREATE TABLE dbo.TNtlSupplierShipment(
    supplier_shipment_id INT IDENTITY(1, 1) not null,
    supplier_id INT,
    product_id INT,
    CONSTRAINT supplier_shipment_id_pk PRIMARY KEY(supplier_shipment_id)
);

-- Product Attribute Value Table
DROP TABLE dbo.TNtlProductAttributeValue;

CREATE TABLE dbo.TNtlProductAttributeValue(
    product_attribute_value_id INT IDENTITY(1, 1) not null,
    attribute_value_id INT,
    product_id INT,
    description VARCHAR(max),
    CONSTRAINT product_attribute_value_id_pk PRIMARY KEY(product_attribute_value_id)
);

-- Attribute Table
DROP TABLE dbo.TNtlAttribute;

CREATE TABLE dbo.TNtlAttribute(
    attribute_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    description VARCHAR(max),
    CONSTRAINT attribute_id_pk PRIMARY KEY(attribute_id)
);

-- Attribute Value Table
DROP TABLE dbo.TNtlAttributeValue;

CREATE TABLE dbo.TNtlAttributeValue(
    attribute_value_id INT IDENTITY(1, 1) not null,
    attribute_id INT,
    name VARCHAR(max),
    CONSTRAINT attribute_value_id_pk PRIMARY KEY(attribute_value_id)
);

-- Product Category Table
DROP TABLE dbo.TNtlProductCategory;

CREATE TABLE dbo.TNtlProductCategory(
    product_category_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max),
    CONSTRAINT product_category_id_pk PRIMARY KEY(product_category_id)
);

-- Product SubCategory Table
DROP TABLE dbo.TNtlProductSubcategory;

CREATE TABLE dbo.TNtlProductSubcategory(
    product_subcategory_id INT IDENTITY(1, 1) not null,
    product_category_id INT,
    name VARCHAR(max),
    CONSTRAINT product_subcategory_id_pk PRIMARY KEY(product_subcategory_id)
);