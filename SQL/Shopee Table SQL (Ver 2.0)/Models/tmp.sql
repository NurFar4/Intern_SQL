DROP TABLE dbo.TShopeeTrash;

CREATE TABLE dbo.TShopeeTrash(
    id INT IDENTITY(1, 1) not null,
    name VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    created_at DATETIME,
    CONSTRAINT product_id_pk PRIMARY KEY(product_id)
);