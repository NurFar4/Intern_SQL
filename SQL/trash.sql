DROP SEQUENCE tmp_product_idseq;

-- Sample Sequence
CREATE SEQUENCE [tmp_product_idseq] AS INT START WITH 1001 INCREMENT BY 1 MAXVALUE 9999;

DROP TABLE dbo.tmp_product;

-- Sample Table
CREATE TABLE dbo.tmp_product(
    product_id INT DEFAULT(NEXT VALUE FOR tmp_product_idseq) not null,
    product_name VARCHAR(50),
    product_quantity INT,
    product_unit_price DECIMAL(10,2),
    created_at DATETIME,
    CONSTRAINT tmp_product_id_pk PRIMARY KEY (product_id)
);

-- Stored Procedure: Select All
If exists (Select * from sysobjects where ID = Object_id('NSP_tmp_product_SelectAll') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_tmp_product_SelectAll
go
Create Procedure NSP_tmp_product_SelectAll
(
    @product_id as INT  
)
as
    Select * 
    From [tmp_product] with (nolock)
    Where 1=1
    and case when @product_id = -1 then @product_id else [product_id] end = @product_id 
    Order by [product_id]
go

-- Stored Procedure: Select By Primary Key
If exists (Select * from sysobjects where ID = Object_id('NSP_tmp_product_SelectByPK') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_tmp_product_SelectByPK
go
Create Procedure NSP_tmp_product_SelectByPK
(
    @product_id as INT
)
as
    Select * 
    From [tmp_product] with (nolock)
    Where 1=1
    And [product_id] = @product_id
go

-- Stored Procedure: Insert
If exists (Select * from sysobjects where ID = Object_id('NSP_tmp_product_Insert') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_tmp_product_Insert
go
Create Procedure NSP_tmp_product_Insert
(
    @product_name as VARCHAR(50), @product_quantity as INT, @product_unit_price as DECIMAL(10,2), @created_at as DATETIME
)
as
Insert into  [tmp_product]
(
	[product_id], [product_name], [product_quantity], [product_unit_price], [created_at]
)
Values
(
	NEXT VALUE FOR product_idseq, @product_name, @product_quantity, @product_unit_price, @created_at
)
go

-- Stored Procedure: Update
If exists (Select * from sysobjects where ID = Object_id('NSP_tmp_product_Update') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_tmp_product_Update
go
Create Procedure NSP_tmp_product_Update
(
    @product_id as INT, @product_name as VARCHAR(50), @product_quantity as INT, @product_unit_price as DECIMAL(10,2), @created_at as DATETIME
)
as
Update  [tmp_product] Set 
	[product_name] = @product_name, [product_quantity] = @product_quantity, [product_unit_price] = @product_unit_price, [created_at] = @created_at
Where 1=1
And [product_id] = @product_id
go

-- Stored Procedure: Delete
If exists (Select * from sysobjects where ID = Object_id('NSP_tmp_product_Delete') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_tmp_product_Delete
go
Create Procedure NSP_tmp_product_Delete
(
    @product_id as INT
)
as
Delete [tmp_product]
Where 1=1
And [product_id] = @product_id
go

-- Sample Insert
INSERT INTO
    dbo.tmp_product
VALUES
(
    NEXT VALUE FOR tmp_product_idseq,
    'Tiger Biscuits',
    50,
    2.50,
    CONVERT(DATETIME, '2021-08-18 09:25:30')
);

-- Sample Delete
DELETE FROM
    dbo.tmp_product
WHERE
    product_id = 1001;

-- Sample Update
UPDATE
    dbo.tmp_product
SET
    product_quantity = 16
WHERE
    product_id = 1001;

-- Sample Select
SELECT
    product_quantity
FROM
    dbo.tmp_product WITH (NOLOCK);