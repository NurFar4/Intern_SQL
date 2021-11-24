DELETE FROM TShopeeShipment;
DELETE FROM TShopeeCarrier;
DELETE FROM TShopeeShipmentStatus;

DECLARE @detail_id INT;
SET @detail_id = (SELECT IDENT_CURRENT('TShopeeDetail'));