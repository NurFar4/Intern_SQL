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
DELETE FROM dbo.TShopeeDetail;

DECLARE @dt datetime = GETDATE();
DECLARE @detail_id INT;

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

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Material', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Material', 'Material', @detail_id