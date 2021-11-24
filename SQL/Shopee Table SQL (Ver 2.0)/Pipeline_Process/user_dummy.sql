DELETE FROM TShopeeUser;
DELETE FROM TShopeeUserRole;

DECLARE @detail_id INT;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));

EXEC NSP_TShopeeUser_Insert 'admin', 'admin', 'admin@gmail.com';
EXEC NSP_TShopeeUser_Insert 'user', 'user', 'user@gmail.com';
EXEC NSP_TShopeeUser_Insert 'txe1', 'arf11234', 'txen2000@gmail.com';

EXEC NSP_TShopeeUserRole_Insert 'user', 'User';
EXEC NSP_TShopeeUserRole_Insert 'admin', 'Admin';
EXEC NSP_TShopeeUserRole_Insert 'txe1', 'Admin';