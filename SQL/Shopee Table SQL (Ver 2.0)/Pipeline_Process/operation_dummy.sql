DELETE FROM TShopeeOperation;       
DELETE FROM TShopeeTableCategory;   
DELETE FROM TShopeeDetail;

DECLARE @dt datetime = GETDATE();
EXEC NSP_TShopeeDetail_Insert 'Default', 'Created by default when database is initialized', 'admin', @dt, 'admin', @dt; 