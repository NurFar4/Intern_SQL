DELETE FROM TShopeeDetail;
DELETE FROM TShopeeUser;
DELETE FROM TShopeeUserRole;
DELETE FROM TShopeePlatform;
DELETE FROM TShopeeCustomer;        
DELETE FROM TShopeeOrder;
DELETE FROM TShopeeOrderStatus;     
DELETE FROM TShopeeOrderItem;       
DELETE FROM TShopeeOrderItemStatus; 
DELETE FROM TShopeeInvoice;
DELETE FROM TShopeeInvoiceStatus;   
DELETE FROM TShopeePaymentMethod;
DELETE FROM TShopeeProduction;
DELETE FROM TShopeeProductionStatus;
DELETE FROM TShopeeProductionDetail;
DELETE FROM TShopeeStockWarehouse;
DELETE FROM TShopeeStockItem;
DELETE FROM TShopeeProduct;
DELETE FROM TShopeeProductBrand;
DELETE FROM TShopeeProductType;
DELETE FROM TShopeeProductVariety;
DELETE FROM TShopeeDetail;
DELETE FROM TShopeeShipment;
DELETE FROM TShopeeCarrier;
DELETE FROM TShopeeShipmentStatus;

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

-- Product Brand
EXEC NSP_TShopeeDetail_Insert 'Product Brand: NTL Asia', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductBrand_Insert 'NTL Asia', @detail_id

-- Product Type
EXEC NSP_TShopeeDetail_Insert 'Product Type: Car Vehicle Sticker', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Car Vehicle Sticker', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Type: Bubble Wrap', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Bubble Wrap', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Type: Plastic Bag', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductType_Insert 'Plastic Bag', @detail_id

-- Product Variety
EXEC NSP_TShopeeDetail_Insert 'Product Variety: Normal', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Normal', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Product Variety: Matte Black,Stripe 152cm x 50cm', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductVariety_Insert 'Matte Black,Stripe 152cm x 50cm', @detail_id

-- Production Status
EXEC NSP_TShopeeDetail_Insert 'Production Status: Complete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductionStatus_Insert 'Complete', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Production Status: Incomplete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeProductionStatus_Insert 'Incomplete', @detail_id

-- Stock Warehouse
EXEC NSP_TShopeeDetail_Insert 'Stock Warehouse: VendLah! (HQ)', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeStockWarehouse_Insert 'VendLah! (HQ)', 'ivd.sales@dgb.com.my', '03-9078 3220', 'No 8 Jalan Serendah 26/41', 'Sekitar 26', 'Shah Alam', 'Selangor', 40400, 'Malaysia', @detail_id

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