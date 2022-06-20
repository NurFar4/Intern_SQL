-- Customer Table
DROP TABLE dbo.TNtlCustomer;

CREATE TABLE dbo.TNtlCustomer(
    customer_id INT IDENTITY(1, 1) not null,
    name VARCHAR(max)
    address_line_1 VARCHAR(50),
    address_line_2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code INT,
    country VARCHAR(20),
	CONSTRAINT customer_id_pk PRIMARY KEY(customer_id)
);

-- Order Table
DROP TABLE dbo.TNtlOrder;

CREATE TABLE dbo.TNtlOrder(
    order_id INT IDENTITY(1,1) not null,
    order_title VARCHAR(max),
    order_placed_date DATETIME,
    total_price DECIMAL(10,2),
    status_id INT,
	CONSTRAINT order_id_pk PRIMARY KEY(order_id)
);

-- Order Item Table
DROP TABLE dbo.TNtlOrderItem;

CREATE TABLE dbo.TNtlOrderItem(
    order_item_id INT IDENTITY(1, 1) not null,
    sub_total DECIMAL(10, 2),
    discount_fee DECIMAL(10, 2),
    order_id INT,
    product_id INT,
    uom_id INT,
    quantity DECIMAL(10, 6),
	CONSTRAINT order_item_id_pk PRIMARY KEY(order_item_id)
);

-- Job Order Table
DROP TABLE dbo.TNtlJobOrder;

CREATE TABLE dbo.TNtlJobOrder(
    job_order_id INT IDENTITY(1, 1) not null,
    title VARCHAR(100),
    description VARCHAR(max),
    created_date DATETIME,
    status_id INT,
    CONSTRAINT job_order_id_pk PRIMARY KEY(job_order_id_pk)
);

-- Job Order Item Table
DROP TABLE dbo.TNtlJobOrderItem;

CREATE TABLE dbo.TNtlJobOrderItem(
    job_order_item_id INT IDENTITY(1, 1) not null,
    title VARCHAR(100),
    order_item_id INT,
    product_id INT,
    uom_id INT,
    quantity_needed DECIMAL(10, 6),
    quantity_made DECIMAL(10, 6),
    quantity_left DECIMAL(10, 6),
    job_order_id INT,
    CONSTRAINT job_order_item_id_pk PRIMARY KEY(job_order_item_id)
);

-- Invoice Table
-- Created is when payment is complete
-- Completed is when packing is complete
-- Created Date will be auto generated
-- Completed Date will be auto selected
-- When an invoice is generated, it represents that customer already made payment
-- Invoice Status is to signify that packing is complete for Production
DROP TABLE dbo.TNtlInvoice;

CREATE TABLE dbo.TNtlInvoice(
    invoice_id INT IDENTITY(1, 1) not null,
    invoice_title VARCHAR(100),
    invoice_created_date DATETIME,
    invoice_completed_date DATETIME,
    invoice_details VARCHAR(max),
    shipping_fee DECIMAL(10, 2),
    status_id INT,
    order_id INT,
	CONSTRAINT invoice_id_pk PRIMARY KEY(invoice_id)
);

-- Payment Method Table (Intentionally Left Out)

-- Country Table (Intentionally Left Out)

-- State Table (Intentionally Left Out)