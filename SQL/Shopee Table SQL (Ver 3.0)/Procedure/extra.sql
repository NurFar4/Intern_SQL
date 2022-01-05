DROP TABLE dbo.TShopeeUser;
CREATE TABLE dbo.TShopeeUser(
    user_id INT IDENTITY(1, 1),
    username VARCHAR(max),
    password VARCHAR(max),
    email VARCHAR(max),
    CONSTRAINT user_id_pk PRIMARY KEY (user_id)
);

-- Stored Procedure: Insert New Record
If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeUser_Insert') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeUser_Insert
go
Create Procedure NSP_TShopeeUser_Insert
( @username as VARCHAR(max), @password as VARCHAR(max), @email as VARCHAR(max) )
as
Insert into  [TShopeeUser]
( [username], [password], [email] )
Values
( @username, HASHBYTES('SHA2_256', @password), @email )
go

-- Stored Procedure: Update Existing Record
If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeUser_Update') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeUser_Update
go
Create Procedure NSP_TShopeeUser_Update
( @user_id as INT, @username as VARCHAR(max), @password as VARCHAR(max), @email as VARCHAR(max) )
as
Update [TShopeeUser]
Set [username] = @username, [password] = HASHBYTES('SHA2_256', @password), [email] = @email
Where 1=1
And [user_id] = @user_id
go

-- Stored Procedure: Delete Record
If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeUser_Delete') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeUser_Delete
go
Create Procedure NSP_TShopeeUser_Delete
( @user_id as INT )
as
Delete [TShopeeUser]
Where 1=1
And [user_id] = @user_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeUser_CheckPassword') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeUser_CheckPassword
go
Create Procedure NSP_TShopeeUser_CheckPassword
( @usr as VARCHAR(max), @pwd as VARCHAR(max) )
as
SELECT *
FROM dbo.TShopeeUser
WHERE 1=1
AND username = @usr
AND password = HASHBYTES('SHA2_256', @pwd)
go