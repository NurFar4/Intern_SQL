DECLARE @dt datetime = GETDATE();
DECLARE @detail_id INT;

-- Insert Status
EXEC NSP_TNtlDetail_Insert 'Unit: Default', '', 'Admin', @dt, 'Admin', @dt;
SET @detail_id = (SELECT IDENT_CURRENT('TNtlDetail'));
EXEC NSP_TNtlUnit_Insert 

