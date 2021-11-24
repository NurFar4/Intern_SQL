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
    role VARCHAR(50),
    CONSTRAINT user_role_id_pk PRIMARY KEY (user_role_id)
);