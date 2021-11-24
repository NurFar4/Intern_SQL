DELETE FROM TShopeeProduction;      
DELETE FROM TShopeeProductionDetail;
DELETE FROM TShopeeStockWarehouse;
DELETE FROM TShopeeStockItem;
DELETE FROM TShopeeProduct;
DELETE FROM TShopeeProductBrand;
DELETE FROM TShopeeProductType;
DELETE FROM TShopeeProductVariety;
DELETE FROM TShopeeDetail;

DECLARE @detail_id INT;
DECLARE @dt datetime = GETDATE();

EXEC NSP_TShopeeDetail_Insert 'Stock Warehouse: Sword Factory', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeStockWarehouse_Insert 'Sword Factory', 'lobortis.nisi@protonmail.com', '016-778 3734', '63 Angkasa Impian 2', 'Blok A Lorong Sahabat', 'Shah Alam', 'Selangor', 57100, 'Malaysia', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Stock Warehouse: Lechters Housewares', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeStockWarehouse_Insert 'Lechters Housewares', 'xxlsiuwgh9@temporary-mail.net', '039100-1131', '53 Blok A Megan Phoenix', 'Jln Cheras Km 10', 'Sungai Besi', 'Wilayah Persekutuan', 56000, 'Malaysia', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Stock Warehouse: ManCharm', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeStockWarehouse_Insert 'ManCharm', 'w069lerxf9c@temporary-mail.net', '6073352968', 'No. 6 Jalan Liang 22', 'Taman Gembira', 'Johor Bahru', 'Johor', 81200, 'Malaysia', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Brand: ArctiBlade', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductBrand_Insert 'ArctiBlade', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Brand: EvanAxe', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductBrand_Insert 'EvanAxe', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Brand: ShinySword', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductBrand_Insert 'ShinySword', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Type: Arrows', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Arrows', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Type: Shield', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Shield', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Type: Sword', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Sword', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Iron', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Iron', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Gold', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Gold', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Steel', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Steel', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Wooden', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Wooden', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Diamond', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Diamond', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Ebony', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Ebony', @detail_id