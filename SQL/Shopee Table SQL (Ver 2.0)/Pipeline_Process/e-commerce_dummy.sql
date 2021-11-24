-- 1. Create New Platform
-- 2. Create Customer
-- 3. Create Order

DELETE FROM TShopeePlatform;
DELETE FROM TShopeeCustomer;        
DELETE FROM TShopeeOrder;
DELETE FROM TShopeeOrderStatus;     
DELETE FROM TShopeeOrderItem;       
DELETE FROM TShopeeOrderItemStatus; 
DELETE FROM TShopeeInvoice;
DELETE FROM TShopeeInvoiceStatus;   
DELETE FROM TShopeePaymentMethod;

DECLARE @detail_id INT;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));