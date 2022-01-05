-- Detail Table
DROP TABLE dbo.TShopeeDetail;

CREATE TABLE dbo.TShopeeDetail(
    detail_id INT IDENTITY(1, 1) not null,
    status VARCHAR(max),
    remark VARCHAR(max),
    created_by VARCHAR(100),
    created_date DATETIME,
    last_updated_by VARCHAR(100),
    last_updated_date DATETIME,
    CONSTRAINT detail_id_pk PRIMARY KEY(detail_id)
);

-- User Table
DROP TABLE dbo.TShopeeUser;

CREATE TABLE dbo.TShopeeUser(
    user_id INT IDENTITY(1, 1),
    username VARCHAR(max),
    password VARCHAR(max),
    email VARCHAR(max),
    CONSTRAINT user_id_pk PRIMARY KEY (user_id)
);

-- User Role Table
DROP TABLE dbo.TShopeeUserRole;

CREATE TABLE dbo.TShopeeUserRole(
    user_role_id INT IDENTITY(1, 1),
    username VARCHAR(max),
    role VARCHAR(100),
    CONSTRAINT user_role_id_pk PRIMARY KEY (user_role_id)
);