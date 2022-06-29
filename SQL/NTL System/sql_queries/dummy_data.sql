DELETE FROM dbo.TNtlUom;
DELETE FROM dbo.TNtlStatus;
DELETE FROM dbo.TNtlStockWarehouse;

DELETE FROM dbo.TNtlStockItem;
DELETE FROM dbo.TNtlProduct;

DELETE FROM dbo.TNtlCustomer;
DELETE FROM dbo.TNtlOrder;
DELETE FROM dbo.TNtlOrderItem;

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
EXEC NSP_TNtlStatus_Insert 'draft';
EXEC NSP_TNtlStatus_Insert 'sale';
EXEC NSP_TNtlStatus_Insert 'cancel';

-- Stock Warehouse
EXEC NSP_TNtlStockWarehouse_Insert 'VendLah! (HQ)', 'ivd.sales@dgb.com.my', '03-9078 3220', 'No 8 Jalan Serendah 26/41', 'Sekitar 26', 'Shah Alam', 'Selangor', 40400, 'Malaysia';
SET @stock_warehouse_id = (SELECT IDENT_CURRENT('TNtlStockWarehouse'));

-- Product
EXEC NSP_TNtlProduct_Insert 'FG-Demo-001', '', '', '', 0, 1;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'FG-Demo-001', '', 28, @product_id, 3, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting', '', '', '', 0, 0;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting', '', 1, @product_id, 3, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(50cm)', '', '', '', 0, 1;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(50cm)', '', 1, @product_id, 1, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(60cm)', '', '', '', 0, 1;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(60cm)', '', 1, @product_id, 1, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(70cm)', '', '', '', 0, 1;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(70cm)', '', 1, @product_id, 1, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(80cm)', '', '', '', 0, 1;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(80cm)', '', 1, @product_id, 1, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(90cm)', '', '', '', 0, 1;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(90cm)', '', 1, @product_id, 1, @stock_warehouse_id;

EXEC NSP_TNtlProduct_Insert 'Silver Blue Solar Tinting(150cm)', '', '', '', 0, 1;
SET @product_id = (SELECT IDENT_CURRENT('TNtlProduct'));
EXEC NSP_TNtlStockItem_Insert 'Silver Blue Solar Tinting(150cm)', '', 1, @product_id, 1, @stock_warehouse_id;

-- Customer
EXEC NSP_TNtlCustomer_Insert 'VIGTECH LABS', 'NO 10,, JALAN SERENDAH 26/41, SEKITAR 26, 40400 SHAH ALAM, SELANGOR, MALAYSIA', '', 'Shah alam', '', 40400, 'Malaysia';
EXEC NSP_TNtlCustomer_Insert 'OdooBot', '', '', '', '', 0, '';
EXEC NSP_TNtlCustomer_Insert 'Administrator', '', '', '', '', 0, '';
EXEC NSP_TNtlCustomer_Insert 'Public user', '', '', '', '', 0, '';
EXEC NSP_TNtlCustomer_Insert 'Default User Template', '', '', '', '', 0, '';
EXEC NSP_TNtlCustomer_Insert 'Portal User Template', '', '', '', '', 0, '';
EXEC NSP_TNtlCustomer_Insert 'Nur Fakhira', '', '', '', '', 0, '';
EXEC NSP_TNtlCustomer_Insert 'Justin Tan', '', '', '', '', 0, '';
EXEC NSP_TNtlCustomer_Insert 'Charlotte', '', '', '', '', 0, '';
EXEC NSP_TNtlCustomer_Insert 'ST-Anhui Guren Film Manufacturing Co. Ltd.', '9-47 Guangcai Market, Wuhe County,', 'Bengbu City, Anhui Province,', '', '', 0, 'China';
EXEC NSP_TNtlCustomer_Insert 'C0001-Insas Technology Berhad', 'D-07, 2, Jalan SS 7/13a, Ss 7,', '', 'Petaling Jaya', 'Selangor', 47301, 'Malaysia';
EXEC NSP_TNtlCustomer_Insert 'GuangZhou Color Card Technology Co. Ltd', 'Long Dong Yu Sha Tan', 'Tianhe District', 'GuangZhou', '', 0, 'China';
EXEC NSP_TNtlCustomer_Insert 'New Partner', '', '', '', '', 0, '';

-- Order

-- Order Item
