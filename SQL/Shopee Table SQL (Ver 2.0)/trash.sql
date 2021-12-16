-- Operation Table
DROP TABLE dbo.TShopeeOperation;

CREATE TABLE dbo.TShopeeOperation(
    operation_id INT IDENTITY(1, 1) not null,
    title VARCHAR(50),
    description VARCHAR(max),
    table_category_id INT,
    detail_id INT,
    CONSTRAINT operation_id_pk PRIMARY KEY(operation_id)
);

-- Table Category Table
DROP TABLE dbo.TShopeeTableCategory;

CREATE TABLE dbo.TShopeeTableCategory(
    table_category_id INT IDENTITY(1, 1) not null,
    name VARCHAR(20),
    detail_id INT,
    CONSTRAINT table_category_id_pk PRIMARY KEY(table_category_id)
);