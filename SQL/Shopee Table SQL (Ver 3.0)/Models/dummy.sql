DELETE FROM dbo.TShopeeStockWarehouse;
DELETE FROM dbo.TShopeeStockItem;
DELETE FROM dbo.TShopeeProductBrand;
DELETE FROM dbo.TShopeeProductCategory;
DELETE FROM dbo.TShopeeProductType;
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

-- Supplier
DECLARE @supplier_id INT;

EXEC NSP_TShopeeDetail_Insert 'Supplier: K-One Solution', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeSupplier_Insert 'K-One Solution', 'A', 'Local', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Supplier: Quanjiao Guangtai Adhesive Products Co.,Ltd', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeSupplier_Insert 'Quanjiao Guangtai Adhesive Products Co.,Ltd', 'B', 'International', @detail_id

-- Product Brand
DECLARE @product_brand_id INT;

EXEC NSP_TShopeeDetail_Insert 'Product Brand: TeckWrap', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductBrand_Insert 'TeckWrap', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Brand: Quanjiao', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductBrand_Insert 'Quanjiao', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Brand: NTL Asia', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductBrand_Insert 'NTL Asia', @detail_id

-- Product Model
DECLARE @product_model_id INT;

EXEC NSP_TShopeeDetail_Insert 'Product Model: None', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductModel_Insert 'None', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Model: General', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductModel_Insert 'General', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Model: Axia (B200) G,E,Gxtra,SE,Advance,Style2014, 2017, 2019 Facelift', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductModel_Insert 'Axia (B200) G,E,Gxtra,SE,Advance,Style2014, 2017, 2019 Facelift', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Model: Myvi 1st Generation (M300), 2005', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductModel_Insert 'Myvi 1st Generation (M300), 2005', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Model: Myvi 2nd Generation (M600), Standard, 2011', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductModel_Insert 'Myvi 2nd Generation (M600), Standard, 2011', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Model: Myvi 3rd Generation (M800), G,X,H,AV, 2018', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductModel_Insert 'Myvi 3rd Generation (M800), G,X,H,AV, 2018', @detail_id


-- Product Category
DECLARE @product_category_id INT;

EXEC NSP_TShopeeDetail_Insert 'Product Category: Vinyl Wrap', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductCategory_Insert 'Vinyl Wrap', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Category: PPF', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductCategory_Insert 'PPF', @detail_id

-- Product Type
DECLARE @product_type_id INT;

EXEC NSP_TShopeeDetail_Insert 'Product Type: None', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'None', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Type: Material', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Material', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Type: Side Mirror (Driver)', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Side Mirror (Driver)', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Type: Side Mirror (Passenger)', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Side Mirror (Passenger)', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Type: Petrol Cover', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Petrol Cover', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Type: Product Package', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Product Package', @detail_id

-- Product Variety
DECLARE @product_variety_id INT;

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Normal', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Normal', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Matte', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Matte', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Gloss', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Gloss', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Chrome', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Chrome', @detail_id

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

-- Product (Material)
DECLARE @product_id INT;

EXEC NSP_TShopeeDetail_Insert 'Product: Matte - 01 Black', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @product_brand_id = (SELECT product_brand_id FROM dbo.TShopeeProductBrand WHERE name = 'TeckWrap')
SET @product_model_id = (SELECT product_model_id FROM dbo.TShopeeProductModel WHERE name = 'None')
SET @product_category_id = (SELECT product_category_id FROM dbo.TShopeeProductCategory WHERE name = 'Vinyl Wrap')
SET @product_type_id = (SELECT product_type_id FROM dbo.TShopeeProductType WHERE name = 'Material')
SET @product_variety_id = (SELECT product_variety_id FROM dbo.TShopeeProductVariety WHERE name = 'Matte')
SET @product_status_id = (SELECT product_status_id FROM dbo.TShopeeProductStatus WHERE name = 'In Use')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'))
EXEC NSP_TShopeeProduct_Insert 
'CM 01', 'Matte - 01 Black', 'Matte Material', 'CM 01', 'VA001', 
1300, 0,
@product_brand_id, @product_model_id, @product_category_id, @product_type_id, @product_variety_id, @product_status_id, @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product: Gloss - 01 Black', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @product_brand_id = (SELECT product_brand_id FROM dbo.TShopeeProductBrand WHERE name = 'TeckWrap')
SET @product_model_id = (SELECT product_model_id FROM dbo.TShopeeProductModel WHERE name = 'None')
SET @product_category_id = (SELECT product_category_id FROM dbo.TShopeeProductCategory WHERE name = 'Vinyl Wrap')
SET @product_type_id = (SELECT product_type_id FROM dbo.TShopeeProductType WHERE name = 'Material')
SET @product_variety_id = (SELECT product_variety_id FROM dbo.TShopeeProductVariety WHERE name = 'Gloss')
SET @product_status_id = (SELECT product_status_id FROM dbo.TShopeeProductStatus WHERE name = 'In Use')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'))
EXEC NSP_TShopeeProduct_Insert 
'CG 01', 'Gloss - 01 Black', 'Gloss Material', 'CG 01', 'VA005', 
1300, 0, 
@product_brand_id, @product_model_id, @product_category_id, @product_type_id, @product_variety_id, @product_status_id, @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product: Chrome Mirror - 10HD Chrome Black', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @product_brand_id = (SELECT product_brand_id FROM dbo.TShopeeProductBrand WHERE name = 'TeckWrap')
SET @product_model_id = (SELECT product_model_id FROM dbo.TShopeeProductModel WHERE name = 'None')
SET @product_category_id = (SELECT product_category_id FROM dbo.TShopeeProductCategory WHERE name = 'Vinyl Wrap')
SET @product_type_id = (SELECT product_type_id FROM dbo.TShopeeProductType WHERE name = 'Material')
SET @product_variety_id = (SELECT product_variety_id FROM dbo.TShopeeProductVariety WHERE name = 'Chrome')
SET @product_status_id = (SELECT product_status_id FROM dbo.TShopeeProductStatus WHERE name = 'In Use')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'))
EXEC NSP_TShopeeProduct_Insert 
'CHM 10HD', 'Chrome Mirror - 10HD Chrome Black', 'Chrome Material', 'CHM 10HD', 'VA010', 
1300, 0, 
@product_brand_id, @product_model_id, @product_category_id, @product_type_id, @product_variety_id, @product_status_id, @detail_id

-- Supplier Shipment
EXEC NSP_TShopeeDetail_Insert 'Supplier: K-One Solution, Product: Matte - 01 Black', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @supplier_id = (SELECT supplier_id FROM dbo.TShopeeSupplier WHERE name = 'K-One Solution')
SET @product_id = (SELECT product_id FROM dbo.TShopeeProduct WHERE SKU = 'CM 01')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'))
EXEC NSP_TShopeeSupplierShipment_Insert 
'20210917', 'A28031710057', 'A01',
1.52, 1.8, 0,
@supplier_id, @product_id, @detail_id

EXEC NSP_TShopeeDetail_Insert 'Supplier: K-One Solution, Product: Gloss - 01 Black', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @supplier_id = (SELECT supplier_id FROM dbo.TShopeeSupplier WHERE name = 'K-One Solution')
SET @product_id = (SELECT product_id FROM dbo.TShopeeProduct WHERE SKU = 'CG 01')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'))
EXEC NSP_TShopeeSupplierShipment_Insert 
'20210917', 'A28032598090', 'A02',
1.52, 1.8, 0,
@supplier_id, @product_id, @detail_id

EXEC NSP_TShopeeDetail_Insert 'Supplier: K-One Solution, Product: Chrome Mirror - 10HD Chrome Black', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @supplier_id = (SELECT supplier_id FROM dbo.TShopeeSupplier WHERE name = 'K-One Solution')
SET @product_id = (SELECT product_id FROM dbo.TShopeeProduct WHERE SKU = 'CHM 10HD')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'))
EXEC NSP_TShopeeSupplierShipment_Insert 
'20210917', 'A28030910056', 'A03',
1.52, 1.8, 0,
@supplier_id, @product_id, @detail_id

-- Product (Product Component)
EXEC NSP_TShopeeDetail_Insert 'Product: Myvi 1st Generation (M300), 2005 : Petrol Cover', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @product_brand_id = (SELECT product_brand_id FROM dbo.TShopeeProductBrand WHERE name = 'NTL Asia')
SET @product_model_id = (SELECT product_model_id FROM dbo.TShopeeProductModel WHERE name = 'Myvi 1st Generation (M300), 2005')
SET @product_category_id = (SELECT product_category_id FROM dbo.TShopeeProductCategory WHERE name = 'Vinyl Wrap')
SET @product_type_id = (SELECT product_type_id FROM dbo.TShopeeProductType WHERE name = 'Petrol Cover')
SET @product_variety_id = (SELECT product_variety_id FROM dbo.TShopeeProductVariety WHERE name = 'Matte')
SET @product_status_id = (SELECT product_status_id FROM dbo.TShopeeProductStatus WHERE name = 'In Stock')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'))
EXEC NSP_TShopeeProduct_Insert 
'MYV05G-PTRL-VA001-A01', 'Myvi 1st Generation (M300), 2005 : Petrol Cover', 'Myvi 1st Generation (M300), 2005 : Petrol Cover', 
'MYV05G-PTRL-VA001', 'MYV05G-PTRL-VA001', 
1300, 0,
@product_brand_id, @product_model_id, @product_category_id, @product_type_id, @product_variety_id, @product_status_id, @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product: Myvi 2nd Generation (M600), Standard, 2011 : Petrol Cover', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @product_brand_id = (SELECT product_brand_id FROM dbo.TShopeeProductBrand WHERE name = 'NTL Asia')
SET @product_model_id = (SELECT product_model_id FROM dbo.TShopeeProductModel WHERE name = 'Myvi 2nd Generation (M600), Standard, 2011')
SET @product_category_id = (SELECT product_category_id FROM dbo.TShopeeProductCategory WHERE name = 'Vinyl Wrap')
SET @product_type_id = (SELECT product_type_id FROM dbo.TShopeeProductType WHERE name = 'Petrol Cover')
SET @product_variety_id = (SELECT product_variety_id FROM dbo.TShopeeProductVariety WHERE name = 'Matte')
SET @product_status_id = (SELECT product_status_id FROM dbo.TShopeeProductStatus WHERE name = 'In Stock')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'))
EXEC NSP_TShopeeProduct_Insert 
'MYV11G-PTRL-VA001-A01', 'Myvi 2nd Generation (M600), Standard, 2011 : Petrol Cover', 'Myvi 2nd Generation (M600), Standard, 2011 : Petrol Cover', 
'MYV11G-PTRL-VA001', 'MYV11G-PTRL-VA001', 
1300, 0,
@product_brand_id, @product_model_id, @product_category_id, @product_type_id, @product_variety_id, @product_status_id, @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product: Myvi 3rd Generation (M800), G,X,H,AV, 2018 : Petrol Cover', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @product_brand_id = (SELECT product_brand_id FROM dbo.TShopeeProductBrand WHERE name = 'NTL Asia')
SET @product_model_id = (SELECT product_model_id FROM dbo.TShopeeProductModel WHERE name = 'Myvi 3rd Generation (M800), G,X,H,AV, 2018')
SET @product_category_id = (SELECT product_category_id FROM dbo.TShopeeProductCategory WHERE name = 'Vinyl Wrap')
SET @product_type_id = (SELECT product_type_id FROM dbo.TShopeeProductType WHERE name = 'Petrol Cover')
SET @product_variety_id = (SELECT product_variety_id FROM dbo.TShopeeProductVariety WHERE name = 'Matte')
SET @product_status_id = (SELECT product_status_id FROM dbo.TShopeeProductStatus WHERE name = 'In Stock')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'))
EXEC NSP_TShopeeProduct_Insert 
'MYV18G-PTRL-VA001-A01', 'Myvi 3rd Generation (M800), G,X,H,AV, 2018 : Petrol Cover', 'Myvi 3rd Generation (M800), G,X,H,AV, 2018 : Petrol Cover', 
'MYV18G-PTRL-VA001', 'MYV18G-PTRL-VA001', 
1300, 0,
@product_brand_id, @product_model_id, @product_category_id, @product_type_id, @product_variety_id, @product_status_id, @detail_id

-- Product Component
DECLARE @master_product_id INT;
DECLARE @sub_product_id INT;

EXEC NSP_TShopeeDetail_Insert 'Product Component: Master_product_name, sub_product_name', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @master_product_id = (SELECT product_id FROM dbo.TShopeeProduct WHERE SKU = 'MYV05G-PTRL-VA001')
SET @sub_product_id = (SELECT product_id FROM dbo.TShopeeProduct WHERE SKU = 'CM 01')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductComponent_Insert @master_product_id, @sub_product_id, 1, @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Component: Master_product_name, sub_product_name', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @master_product_id = (SELECT product_id FROM dbo.TShopeeProduct WHERE SKU = 'MYV11G-PTRL-VA001')
SET @sub_product_id = (SELECT product_id FROM dbo.TShopeeProduct WHERE SKU = 'CM 01')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductComponent_Insert @master_product_id, @sub_product_id, 1, @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Component: Master_product_name, sub_product_name', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @master_product_id = (SELECT product_id FROM dbo.TShopeeProduct WHERE SKU = 'MYV18G-PTRL-VA001')
SET @sub_product_id = (SELECT product_id FROM dbo.TShopeeProduct WHERE SKU = 'CM 01')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductComponent_Insert @master_product_id, @sub_product_id, 1, @detail_id

-- Production Status
DECLARE @production_status_id INT;

EXEC NSP_TShopeeDetail_Insert 'Production Status: Complete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductionStatus_Insert 'Complete', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Production Status: Incomplete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductionStatus_Insert 'Incomplete', @detail_id

-- Production
DECLARE @production_id INT;

EXEC NSP_TShopeeDetail_Insert 'Production: Production #1', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @production_status_id = (SELECT production_status_id FROM dbo.TShopeeProductionStatus WHERE name = 'Complete')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProduct_Insert 'Production #1', 'Production #1', 0.92, @production_status_id, @detail_id

-- Production Detail
SET @production_id = (SELECT IDENT_CURRENT('TShopeeProduction'));

EXEC NSP_TShopeeDetail_Insert 'Production Detail: production Title, Product Name', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @product_id = (SELECT product_id FROM dbo.TShopeeProduct WHERE SKU = 'MYV05G-PTRL-VA001')
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductionDetail_Insert '-', '20211001', '20211001', 0, 0.354, 0.264, 10, 3, 7, @production_id, @product_id, @detail_id

-- Product (Package)


-- Product Component

