-- Operation Table
DROP TABLE dbo.TShopeeOperation;

CREATE TABLE dbo.TShopeeOperation(
    operation_id INT IDENTITY(1,1) not null,
    title VARCHAR(50),
    description VARCHAR(max),
    table_category_id INT,
    CONSTRAINT operation_id_pk PRIMARY KEY(operation_id)
);

-- Shipment Status Table
DROP TABLE dbo.TShopeeTableCategory;

CREATE TABLE dbo.TShopeeTableCategory(
    table_category_id INT IDENTITY(1,1) not null,
    name VARCHAR(20),
    CONSTRAINT table_category_id_pk PRIMARY KEY(table_category_id)
);