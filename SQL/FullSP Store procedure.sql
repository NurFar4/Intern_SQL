If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeBuyer_SelectByPK') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeBuyer_SelectByPK
go

Create Procedure NSP_TShopeeBuyer_SelectByPK
(
	@buyer_id as Integer

)
as
	Select * 
	From [TShopeeBuyer] with (nolock)
	 Where 1=1
	 And [buyer_id] = @buyer_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeBuyer_SelectAll') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeBuyer_SelectAll
go

Create Procedure NSP_TShopeeBuyer_SelectAll
(
	@buyer_id as Integer

)
as
	Select * 
	From [TShopeeBuyer] with (nolock)
	Where 1=1
	and case when @buyer_id = -1 then @buyer_id else [buyer_id] end = @buyer_id 
	Order by [buyer_id]
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeBuyer_insert') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeBuyer_Insert
go

Create Procedure NSP_TShopeeBuyer_Insert
(
	@buyer_id as Integer,
	@buyer_username as varchar(100),
	@buyer_name as varchar(100),
	@buyer_mobile_phone as varchar(20)

)
as
	Insert into  [TShopeeBuyer]
	(
		[buyer_id],[buyer_username],[buyer_name],[buyer_mobile_phone]
	)
	Values
	(
		NEXT VALUE FOR buyer_idseq,@buyer_username,@buyer_name,@buyer_mobile_phone
	)
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeBuyer_Update') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeBuyer_Update
go

Create Procedure NSP_TShopeeBuyer_Update
(
	@buyer_id as Integer,
	@buyer_username as varchar(100),
	@buyer_name as varchar(100),
	@buyer_mobile_phone as varchar(20)

)
as
	Update  [TShopeeBuyer] Set 
		[buyer_username] = @buyer_username , 
		[buyer_name] = @buyer_name , 
		[buyer_mobile_phone] = @buyer_mobile_phone 
	 Where 1=1
	 And [buyer_id] = @buyer_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeBuyer_Delete') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeBuyer_Delete
go

Create Procedure NSP_TShopeeBuyer_Delete
(
	@buyer_id as Integer

)
as
	Delete  [TShopeeBuyer]
	 Where 1=1
	 And [buyer_id] = @buyer_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeCarrier_SelectByPK') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeCarrier_SelectByPK
go

Create Procedure NSP_TShopeeCarrier_SelectByPK
(
	@carrier_id as Integer

)
as
	Select * 
	From [TShopeeCarrier] with (nolock)
	 Where 1=1
	 And [carrier_id] = @carrier_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeCarrier_SelectAll') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeCarrier_SelectAll
go

Create Procedure NSP_TShopeeCarrier_SelectAll
(
	@carrier_id as Integer

)
as
	Select * 
	From [TShopeeCarrier] with (nolock)
	Where 1=1
	and case when @carrier_id = -1 then @carrier_id else [carrier_id] end = @carrier_id 
	Order by [carrier_id]
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeCarrier_insert') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeCarrier_Insert
go

Create Procedure NSP_TShopeeCarrier_Insert
(
	@carrier_id as Integer,
	@carrier_name as varchar(100)

)
as
	Insert into  [TShopeeCarrier]
	(
		[carrier_id],[carrier_name]
	)
	Values
	(
		@carrier_id,@carrier_name
	)
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeCarrier_Update') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeCarrier_Update
go

Create Procedure NSP_TShopeeCarrier_Update
(
	@carrier_id as Integer,
	@carrier_name as varchar(100)

)
as
	Update  [TShopeeCarrier] Set 
		[carrier_name] = @carrier_name 
	 Where 1=1
	 And [carrier_id] = @carrier_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeCarrier_Delete') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeCarrier_Delete
go

Create Procedure NSP_TShopeeCarrier_Delete
(
	@carrier_id as Integer

)
as
	Delete  [TShopeeCarrier]
	 Where 1=1
	 And [carrier_id] = @carrier_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeOrder_SelectByPK') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeOrder_SelectByPK
go

Create Procedure NSP_TShopeeOrder_SelectByPK
(
	@order_id as varchar(50)

)
as
	Select * 
	From [TShopeeOrder] with (nolock)
	 Where 1=1
	 And [order_id] = @order_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeOrder_SelectAll') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeOrder_SelectAll
go

Create Procedure NSP_TShopeeOrder_SelectAll
(
	@order_id as varchar(50)

)
as
	Select * 
	From [TShopeeOrder] with (nolock)
	Where 1=1
	and case when rtrim(@order_id) = '' then rtrim(@order_id) else [order_id] end like rtrim(@order_id) + '%'
	Order by [order_id]
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeOrder_insert') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeOrder_Insert
go

Create Procedure NSP_TShopeeOrder_Insert
(
	@order_id as varchar(50),
	@refund_status as varchar(10),
	@payment_method as varchar(50),
	@voucher_code as varchar(50),
	@extra_charges as decimal (18,4),
	@order_income as decimal (18,4),
	@purchase_date_time as nvarchar (50),
	@buyer_id as Integer,
	@order_transaction_no as Integer,
	@shipping_detail_id as Integer

)
as
	Insert into  [TShopeeOrder]
	(
		[order_id],[refund_status],[payment_method],[voucher_code],[extra_charges],[order_income],[purchase_date_time],[buyer_id],[order_transaction_no],[shipping_detail_id]
	)
	Values
	(
		@order_id,@refund_status,@payment_method,@voucher_code,@extra_charges,@order_income,@purchase_date_time,@buyer_id,@order_transaction_no,@shipping_detail_id
	)
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeOrder_Update') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeOrder_Update
go

Create Procedure NSP_TShopeeOrder_Update
(
	@order_id as varchar(50),
	@refund_status as varchar(10),
	@payment_method as varchar(50),
	@voucher_code as varchar(50),
	@extra_charges as decimal (18,4),
	@order_income as decimal (18,4),
	@purchase_date_time as nvarchar (50),
	@buyer_id as Integer,
	@order_transaction_no as Integer,
	@shipping_detail_id as Integer

)
as
	Update  [TShopeeOrder] Set 
		[refund_status] = @refund_status , 
		[payment_method] = @payment_method , 
		[voucher_code] = @voucher_code , 
		[extra_charges] = @extra_charges , 
		[order_income] = @order_income , 
		[purchase_date_time] = @purchase_date_time , 
		[buyer_id] = @buyer_id , 
		[order_transaction_no] = @order_transaction_no , 
		[shipping_detail_id] = @shipping_detail_id 
	 Where 1=1
	 And [order_id] = @order_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeOrder_Delete') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeOrder_Delete
go

Create Procedure NSP_TShopeeOrder_Delete
(
	@order_id as varchar(50)

)
as
	Delete  [TShopeeOrder]
	 Where 1=1
	 And [order_id] = @order_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeProduct_SelectByPK') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeProduct_SelectByPK
go

Create Procedure NSP_TShopeeProduct_SelectByPK
(
	@product_transaction_id as Integer

)
as
	Select * 
	From [TShopeeProduct] with (nolock)
	 Where 1=1
	 And [product_transaction_id] = @product_transaction_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeProduct_SelectAll') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeProduct_SelectAll
go

Create Procedure NSP_TShopeeProduct_SelectAll
(
	@product_transaction_id as Integer

)
as
	Select * 
	From [TShopeeProduct] with (nolock)
	Where 1=1
	and case when @product_transaction_id = -1 then @product_transaction_id else [product_transaction_id] end = @product_transaction_id 
	Order by [product_transaction_id]
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeProduct_insert') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeProduct_Insert
go

Create Procedure NSP_TShopeeProduct_Insert
(
	@product_id as varchar(20),
	@product_name as varchar(max),
	@product_variety as varchar(max),
	@product_quantity as Integer,
	@product_unit_price as decimal (18,4)

)
as
	Insert into  [TShopeeProduct]
	(
		[product_transaction_id],[product_id],[product_name],[product_variety],[product_quantity],[product_unit_price]
	)
	Values
	(
		NEXT VALUE FOR product_transacseq ,@product_id,@product_name,@product_variety,@product_quantity,@product_unit_price
	)
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeProduct_Update') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeProduct_Update
go

Create Procedure NSP_TShopeeProduct_Update
(
	@product_transaction_id as Integer,
	@product_id as varchar(20),
	@product_name as varchar(max),
	@product_variety as varchar(max),
	@product_quantity as Integer,
	@product_unit_price as decimal (18,4)

)
as
	Update  [TShopeeProduct] Set 
		[product_id] = @product_id , 
		[product_name] = @product_name , 
		[product_variety] = @product_variety , 
		[product_quantity] = @product_quantity , 
		[product_unit_price] = @product_unit_price 
	 Where 1=1
	 And [product_transaction_id] = @product_transaction_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeProduct_Delete') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeProduct_Delete
go

Create Procedure NSP_TShopeeProduct_Delete
(
	@product_transaction_id as Integer

)
as
	Delete  [TShopeeProduct]
	 Where 1=1
	 And [product_transaction_id] = @product_transaction_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeShippingDetail_SelectByPK') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeShippingDetail_SelectByPK
go

Create Procedure NSP_TShopeeShippingDetail_SelectByPK
(
	@shipping_detail_id as Integer

)
as
	Select * 
	From [TShopeeShippingDetail] with (nolock)
	 Where 1=1
	 And [shipping_detail_id] = @shipping_detail_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeShippingDetail_SelectAll') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeShippingDetail_SelectAll
go

Create Procedure NSP_TShopeeShippingDetail_SelectAll
(
	@shipping_detail_id as Integer

)
as
	Select * 
	From [TShopeeShippingDetail] with (nolock)
	Where 1=1
	and case when @shipping_detail_id = -1 then @shipping_detail_id else [shipping_detail_id] end = @shipping_detail_id 
	Order by [shipping_detail_id]
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeShippingDetail_insert') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeShippingDetail_Insert
go

Create Procedure NSP_TShopeeShippingDetail_Insert
(
	@shipping_detail_id as Integer,
	@tracking_id as varchar(20),
	@shipping_fee as decimal (18,4),
	@shipping_address as varchar(max),
	@shipping_status as varchar(100),
	@order_id as varchar(100),
	@carrier_id as Integer

)
as
	Insert into  [TShopeeShippingDetail]
	(
		[shipping_detail_id],[tracking_id],[shipping_fee],[shipping_address],[shipping_status],[order_id],[carrier_id]
	)
	Values
	(
		@shipping_detail_id,@tracking_id,@shipping_fee,@shipping_address,@shipping_status,@order_id,@carrier_id
	)
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeShippingDetail_Update') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeShippingDetail_Update
go

Create Procedure NSP_TShopeeShippingDetail_Update
(
	@shipping_detail_id as Integer,
	@tracking_id as varchar(20),
	@shipping_fee as decimal (18,4),
	@shipping_address as varchar(max),
	@shipping_status as varchar(100),
	@order_id as varchar(100),
	@carrier_id as Integer

)
as
	Update  [TShopeeShippingDetail] Set 
		[tracking_id] = @tracking_id , 
		[shipping_fee] = @shipping_fee , 
		[shipping_address] = @shipping_address , 
		[shipping_status] = @shipping_status , 
		[order_id] = @order_id , 
		[carrier_id] = @carrier_id 
	 Where 1=1
	 And [shipping_detail_id] = @shipping_detail_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeShippingDetail_Delete') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeShippingDetail_Delete
go

Create Procedure NSP_TShopeeShippingDetail_Delete
(
	@shipping_detail_id as Integer

)
as
	Delete  [TShopeeShippingDetail]
	 Where 1=1
	 And [shipping_detail_id] = @shipping_detail_id
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeOrderDetail_SelectByPK') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeOrderDetail_SelectByPK
go

Create Procedure NSP_TShopeeOrderDetail_SelectByPK
(
	@order_transaction_no as Integer

)
as
	Select * 
	From [TShopeeOrderDetail] with (nolock)
	 Where 1=1
	 And [order_transaction_no] = @order_transaction_no
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeOrderDetail_SelectAll') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeOrderDetail_SelectAll
go

Create Procedure NSP_TShopeeOrderDetail_SelectAll
(
	@order_transaction_no as Integer

)
as
	Select * 
	From [TShopeeOrderDetail] with (nolock)
	Where 1=1
	and case when @order_transaction_no = -1 then @order_transaction_no else [order_transaction_no] end = @order_transaction_no 
	Order by [order_transaction_no]
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeOrderDetail_insert') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeOrderDetail_Insert
go

Create Procedure NSP_TShopeeOrderDetail_Insert
(
	@order_transaction_no as Integer,
	@order_id as varchar(50),
	@product_id as varchar(20)

)
as
	Insert into  [TShopeeOrderDetail]
	(
		[order_transaction_no],[order_id],[product_id]
	)
	Values
	(
		@order_transaction_no,@order_id,@product_id
	)
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeOrderDetail_Update') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeOrderDetail_Update
go

Create Procedure NSP_TShopeeOrderDetail_Update
(
	@order_transaction_no as Integer,
	@order_id as varchar(50),
	@product_id as varchar(20)

)
as
	Update  [TShopeeOrderDetail] Set 
		[order_id] = @order_id , 
		[product_id] = @product_id 
	 Where 1=1
	 And [order_transaction_no] = @order_transaction_no
go

If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeOrderDetail_Delete') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure NSP_TShopeeOrderDetail_Delete
go

Create Procedure NSP_TShopeeOrderDetail_Delete
(
	@order_transaction_no as Integer

)
as
	Delete  [TShopeeOrderDetail]
	 Where 1=1
	 And [order_transaction_no] = @order_transaction_no
go


