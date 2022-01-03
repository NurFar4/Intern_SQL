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

EXEC sp_MSForEachTable '
IF OBJECTPROPERTY(object_id(''?''), ''TableHasIdentity'') = 1
DBCC CHECKIDENT (''?'', RESEED, 1)'

EXEC NSP_TShopeeUser_Insert 'admin', 'admin', 'admin@gmail.com';
EXEC NSP_TShopeeUser_Insert 'user', 'user', 'user@gmail.com';
EXEC NSP_TShopeeUser_Insert 'txe1', 'arf11234', 'txen2000@gmail.com';

EXEC NSP_TShopeeUserRole_Insert 'user', 'User';
EXEC NSP_TShopeeUserRole_Insert 'admin', 'Admin';
EXEC NSP_TShopeeUserRole_Insert 'txe1', 'Admin';

DECLARE @dt datetime = GETDATE();
DECLARE @detail_id INT;

-- Platform
EXEC NSP_TShopeeDetail_Insert 'Platform: Lazada', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeePlatform_Insert 'Lazada', @detail_id

-- Platform
EXEC NSP_TShopeeDetail_Insert 'Platform: Shopee', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeePlatform_Insert 'Shopee', @detail_id

-- Payment Method
EXEC NSP_TShopeeDetail_Insert 'Payment Method: Online Banking', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeePaymentMethod_Insert 'Online Banking', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Payment Method: Credit Card', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeePaymentMethod_Insert 'Credit Card', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Payment Method: Debit Card', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeePaymentMethod_Insert 'Debit Card', @detail_id

-- Order Status
EXEC NSP_TShopeeDetail_Insert 'Order Status: Complete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeOrderStatus_Insert 'Complete', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Order Status: Incomplete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeOrderStatus_Insert 'Incomplete', @detail_id

-- Invoice Status
EXEC NSP_TShopeeDetail_Insert 'Invoice Status: Complete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeInvoiceStatus_Insert 'Complete', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Invoice Status: Incomplete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeInvoiceStatus_Insert 'Incomplete', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Invoice Status: Packaging', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeInvoiceStatus_Insert 'Packaging', @detail_id

-- Stock Warehouse
EXEC NSP_TShopeeDetail_Insert 'Stock Warehouse: VendLah! (HQ)', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeStockWarehouse_Insert 'VendLah! (HQ)', 'ivd.sales@dgb.com.my', '03-9078 3220', 'No 8 Jalan Serendah 26/41', 'Sekitar 26', 'Shah Alam', 'Selangor', 40400, 'Malaysia', @detail_id

-- Product Status
EXEC NSP_TShopeeDetail_Insert 'Product Status: Used', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductStatus_Insert 'Used', @detail_id

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

EXEC NSP_TShopeeDetail_Insert 'Product Status: Maxed Out', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductStatus_Insert 'Maxed Out', @detail_id

-- Production Status
EXEC NSP_TShopeeDetail_Insert 'Production Status: Complete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductionStatus_Insert 'Complete', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Production Status: Incomplete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductionStatus_Insert 'Incomplete', @detail_id

-- Product Brand
EXEC NSP_TShopeeDetail_Insert 'Product Brand: Normal', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductBrand_Insert 'Normal', 'Normal', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Brand: NTL Asia', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductBrand_Insert 'NTL Asia', 'NTL Asia', @detail_id

-- Product Category
EXEC NSP_TShopeeDetail_Insert 'Product Category: Normal', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductCategory_Insert 'Normal', 'Normal', @detail_id

-- Product Model
EXEC NSP_TShopeeDetail_Insert 'Product Model: Normal', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductModel_Insert 'Normal', 'Normal', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Model: Material', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductModel_Insert 'Material', 'Material', @detail_id

-- Product Type
EXEC NSP_TShopeeDetail_Insert 'Product Type: Normal', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Normal', 'Normal', @detail_id

-- Product Variety
EXEC NSP_TShopeeDetail_Insert 'Product Variety: Normal', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Normal', 'Normal', @detail_id

-- Carrier
EXEC NSP_TShopeeDetail_Insert 'Carrier: DHL eCommerce', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeCarrier_Insert 'DHL eCommerce', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Carrier: J&T Tracking', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeCarrier_Insert 'J&T Tracking', @detail_id

-- Shipment Status
EXEC NSP_TShopeeDetail_Insert 'Shipment Status: Complete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeShipmentStatus_Insert 'Complete', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Shipment Status: Incomplete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeShipmentStatus_Insert 'Incomplete', @detail_id