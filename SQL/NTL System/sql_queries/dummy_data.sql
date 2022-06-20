DELETE FROM dbo.TNtlUom;
DELETE FROM dbo.TNtlStatus;
DELETE FROM dbo.TNtlStockWarehouse;

DELETE FROM dbo.TNtlStockItem;
DELETE FROM dbo.TNtlProduct;

EXEC sp_MSForEachTable '
IF OBJECTPROPERTY(object_id(''?''), ''TableHasIdentity'') = 1
DBCC CHECKIDENT (''?'', RESEED, 0)';

DECLARE @stock_warehouse_id INT;
DECLARE @product_id INT;

-- Uom
EXEC NSP_TNtlUom_Insert 'CM';
EXEC NSP_TNtlUom_Insert 'M';
EXEC NSP_TNtlUom_Insert 'Units';

-- Status
EXEC NSP_TNtlStatus_Insert 'Incomplete';
EXEC NSP_TNtlStatus_Insert 'Complete';

-- Stock Warehouse
EXEC NSP_TNtlStockWarehouse_Insert 'VendLah! (HQ)', 'ivd.sales@dgb.com.my', '03-9078 3220', 'No 8 Jalan Serendah 26/41', 'Sekitar 26', 'Shah Alam', 'Selangor', 40400, 'Malaysia';
SET @stock_warehouse_id = (SELECT IDENT_CURRENT('TNtlStockWarehouse'));

-- Product
EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(50cm)', '', '', '', 0, 0;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(50cm)', '', 1, @product_id, 2, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(60cm)', '', '', '', 0, 0;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(60cm)', '', 1, @product_id, 2, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(70cm)', '', '', '', 0, 0;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(70cm)', '', 1, @product_id, 2, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(80cm)', '', '', '', 0, 0;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(80cm)', '', 1, @product_id, 2, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(90cm)', '', '', '', 0, 0;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(90cm)', '', 1, @product_id, 2, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(150cm)', '', '', '', 0, 0;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(150cm)', '', 1, @product_id, 2, @stock_warehouse_id;
