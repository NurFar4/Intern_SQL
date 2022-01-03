DELETE FROM dbo.TShopeePlatform;
DELETE FROM dbo.TShopeeCustomer;
DELETE FROM dbo.TShopeeOrder;
DELETE FROM dbo.TShopeeOrderStatus;
DELETE FROM dbo.TShopeeOrderItem;
DELETE FROM dbo.TShopeeOrderItemStatus;
DELETE FROM dbo.TShopeeInvoice;
DELETE FROM dbo.TShopeeInvoiceStatus;
DELETE FROM dbo.TShopeePaymentMethod;
DELETE FROM dbo.TShopeeDetail;
DELETE FROM dbo.TShopeeUser;
DELETE FROM dbo.TShopeeUserRole;
DELETE FROM dbo.TShopeeStockWarehouse;
DELETE FROM dbo.TShopeeStockItem;
DELETE FROM dbo.TShopeeProductBrand;
DELETE FROM dbo.TShopeeProductCategory;
DELETE FROM dbo.TShopeeProductType;
DELETE FROM dbo.TShopeeProductModel;
DELETE FROM dbo.TShopeeProductVariety;
DELETE FROM dbo.TShopeeSupplier;
DELETE FROM dbo.TShopeeSupplierShipment;
DELETE FROM dbo.TShopeeProduct;
DELETE FROM dbo.TShopeeProductStatus;
DELETE FROM dbo.TShopeeProductComponent;
DELETE FROM dbo.TShopeeProduction;
DELETE FROM dbo.TShopeeProductionStatus;
DELETE FROM dbo.TShopeeProductionDetail;
DELETE FROM dbo.TShopeeShipment;
DELETE FROM dbo.TShopeeCarrier;
DELETE FROM dbo.TShopeeShipmentStatus;

EXEC NSP_TShopeeUser_Insert 'admin', 'admin', 'admin@gmail.com';
EXEC NSP_TShopeeUser_Insert 'user', 'user', 'user@gmail.com';
EXEC NSP_TShopeeUser_Insert 'txe1', 'arf11234', 'txen2000@gmail.com';

EXEC NSP_TShopeeUserRole_Insert 'user', 'User';
EXEC NSP_TShopeeUserRole_Insert 'admin', 'Admin';
EXEC NSP_TShopeeUserRole_Insert 'txe1', 'Admin';

DECLARE @dt datetime = GETDATE();
DECLARE @detail_id INT;

-- Stock Warehouse
EXEC NSP_TShopeeDetail_Insert 'Stock Warehouse: VendLah! (HQ)', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeStockWarehouse_Insert 'VendLah! (HQ)', 'ivd.sales@dgb.com.my', '03-9078 3220', 'No 8 Jalan Serendah 26/41', 'Sekitar 26', 'Shah Alam', 'Selangor', 40400, 'Malaysia', @detail_id

-- Product Status
DECLARE @product_status_id INT;

EXEC NSP_TShopeeDetail_Insert 'Product Status: In Use', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductStatus_Insert 'In Use', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Status: New', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductStatus_Insert 'New', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Status: In Stock', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductStatus_Insert 'In Stock', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Status: Empty', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductStatus_Insert 'Empty', @detail_id

-- Production Status
DECLARE @production_status_id INT;

EXEC NSP_TShopeeDetail_Insert 'Production Status: Complete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductionStatus_Insert 'Complete', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Production Status: Incomplete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductionStatus_Insert 'Incomplete', @detail_id