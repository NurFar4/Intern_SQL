DECLARE @dt datetime = GETDATE();
DECLARE @detail_id INT;

EXEC NSP_TShopeeDetail_Insert 'Complete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeInvoiceStatus_Insert 'Complete', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Incomplete', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeInvoiceStatus_Insert 'Incomplete', @detail_id

EXEC NSP_TShopeeDetail_Insert 'Packaging', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));
EXEC NSP_TShopeeInvoiceStatus_Insert 'Packaging', @detail_id