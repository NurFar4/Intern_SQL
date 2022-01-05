-- Platform Table
DROP TABLE dbo.TShopeePlatform;

CREATE TABLE dbo.TShopeePlatform(
    platform_id INT IDENTITY(1, 1) not null,
    name VARCHAR(100),
    detail_id INT,
	CONSTRAINT platform_id_pk PRIMARY KEY(platform_id)
);

-- Customer Table
DROP TABLE dbo.TShopeeCustomer;

CREATE TABLE dbo.TShopeeCustomer(
    customer_id INT IDENTITY(1, 1) not null,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    dob DATETIME,
    email_address VARCHAR(20),
    phone_number VARCHAR(20),
    address_line_1 VARCHAR(50),
    address_line_2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code INT,
    country VARCHAR(20),
    platform_id INT,
    detail_id INT,
	CONSTRAINT customer_id_pk PRIMARY KEY(customer_id)
);

-- Order Table
DROP TABLE dbo.TShopeeOrder;

CREATE TABLE dbo.TShopeeOrder(
    order_id INT IDENTITY(1,1) not null,
    order_title VARCHAR(max),
    order_placed_date DATETIME,
    total_price DECIMAL(10,2),
    order_status_id INT,
    detail_id INT,
	CONSTRAINT order_id_pk PRIMARY KEY(order_id)
);

-- Order Status Table
DROP TABLE dbo.TShopeeOrderStatus;

CREATE TABLE dbo.TShopeeOrderStatus(
    order_status_id INT IDENTITY(1, 1) not null,
    name VARCHAR(100),
    detail_id INT,
	CONSTRAINT order_status_id_pk PRIMARY KEY(order_status_id)
);

-- Order Item Table
DROP TABLE dbo.TShopeeOrderItem;

CREATE TABLE dbo.TShopeeOrderItem(
    order_item_id INT IDENTITY(1, 1) not null,
    quantity INT,
    sub_total DECIMAL(10, 2),
    discount_fee DECIMAL(10, 2),
    RMA_num INT,
    RMA_issued_by VARCHAR(50),
    RMA_issued_date DATETIME,
    order_id INT,
    order_item_status_id INT,
    product_id INT,
    detail_id INT,
	CONSTRAINT order_item_id_pk PRIMARY KEY(order_item_id)
);

-- Order Item Status Table
DROP TABLE dbo.TShopeeOrderItemStatus;

CREATE TABLE dbo.TShopeeOrderItemStatus(
    order_item_status_id INT IDENTITY(1, 1) not null,
    name VARCHAR(100),
    description VARCHAR(max),
    return_merchandise_authorization_nr INT,
    detail_id INT,
	CONSTRAINT order_item_status_id_pk PRIMARY KEY(order_item_status_id)
);

-- Invoice Table
-- Created is when payment is complete
-- Completed is when packing is complete
-- Created Date will be auto generated
-- Completed Date will be auto selected
-- When an invoice is generated, it represents that customer already made payment
-- Invoice Status is to signify that packing is complete for Production
DROP TABLE dbo.TShopeeInvoice;

CREATE TABLE dbo.TShopeeInvoice(
    invoice_id INT IDENTITY(1, 1) not null,
    invoice_title VARCHAR(100),
    invoice_created_date DATETIME,
    invoice_completed_date DATETIME,
    invoice_details VARCHAR(max),
    shipping_fee DECIMAL(10, 2),
    invoice_status_id INT,
    payment_method_id INT,
    order_id INT,
    customer_id INT,
    detail_id INT,
	CONSTRAINT invoice_id_pk PRIMARY KEY(invoice_id)
);

-- Invoice Status Table
DROP TABLE dbo.TShopeeInvoiceStatus;

CREATE TABLE dbo.TShopeeInvoiceStatus(
    invoice_status_id INT IDENTITY(1, 1) not null,
    name VARCHAR(100),
    detail_id INT,
	CONSTRAINT invoice_status_id_pk PRIMARY KEY(invoice_status_id)
);

-- Payment Method Table
DROP TABLE dbo.TShopeePaymentMethod;

CREATE TABLE dbo.TShopeePaymentMethod(
    payment_method_id INT IDENTITY(1, 1) not null,
    name VARCHAR(100),
    detail_id INT,
	CONSTRAINT payment_method_id_pk PRIMARY KEY(payment_method_id)
);