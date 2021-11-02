// let sql_dict = {
//     "TShopeeBuyer": `buyer_id INT,
// buyer_username VARCHAR(100),
// buyer_name VARCHAR(100),
// buyer_mobile_phone VARCHAR(20),`,
//     "TShopeeCarrier": `carrier_id INT,
// carrier_name VARCHAR(100),`,
//     "TShopeeOrderDetail": `order_transaction_id INT,
// order_id VARCHAR(50) not null,
// product_transaction_id INT,
// product_quantity INT,
// sub_total DECIMAL(10,2),`,
//     "TShopeeProduct": `product_transaction_id INT,
// product_id VARCHAR(20) not null,
// product_name VARCHAR(max) not null,
// product_variety VARCHAR(max),
// product_stock_quantity INT,
// product_unit_price DECIMAL(10,2),`,
//     "TShopeeShippingDetail": `shipping_detail_id INT,
// tracking_id VARCHAR(20),
// shipping_address VARCHAR(max),
// shipping_status VARCHAR(100),
// shipping_fee DECIMAL(10,2),
// order_id VARCHAR(100),
// carrier_id INT,`,
//     "TShopeeOrder": `order_id VARCHAR(50),
// refund_status VARCHAR(10),
// voucher_code VARCHAR(50),
// payment_method VARCHAR(50),
// purchase_date_time DATETIME,
// extra_charges DECIMAL(10,2),
// order_income DECIMAL(10,2),
// buyer_id INT,
// shipping_detail_id INT,
// order_transaction_id INT,`
// };

let sql_dict = {
    "tmp_product": `product_id INT,
product_name VARCHAR(50),
product_quantity INT,
product_unit_price DECIMAL(10,2),
created_at DATETIME,`
};

// Select All

function procedure_select_all(table_name){
    return `NSP_${table_name}_SelectAll`;
}

function procedure_select_all_full(table_name, arr){

    let pk_str = arr[0].split(" ")[0], data_type = arr[0].split(" ")[1];

    return `If exists (Select * from sysobjects where ID = Object_id('${procedure_select_all(table_name)}') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop procedure ${procedure_select_all(table_name)}
    go
    
    Create Procedure ${procedure_select_all(table_name)}
    (
        @${pk_str} as ${data_type}
    
    )
    as
        Select * 
        From [${table_name}] with (nolock)
        Where 1=1
        and case when @${pk_str} = -1 then @${pk_str} else [${pk_str}] end = @${pk_str} 
        Order by [${pk_str}]
    go`;
}

// Select By ID

function procedure_select_by(table_name){
    return `NSP_${table_name}_SelectByPK`;
}

function procedure_select_by_full(table_name, arr){

    let pk_str = arr[0].split(" ")[0], data_type = arr[0].split(" ")[1];

    return `If exists (Select * from sysobjects where ID = Object_id('${procedure_select_by(table_name)}') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop procedure ${procedure_select_by(table_name)}
    go
    Create Procedure ${procedure_select_by(table_name)}
    (
        @${pk_str} as ${data_type}
    )
    as
        Select * 
        From [${table_name}] with (nolock)
        Where 1=1
        And [${pk_str}] = @${pk_str}
    go`;
}

// Insert

function procedure_insert(table_name) {
    return `NSP_${table_name}_Insert`;
}

function procedure_insert_2(arr) {
    return arr.slice(1).map(tmp_str => {
        let tmp_arr = tmp_str.split(" ");
        return `@${tmp_arr[0]} as ${tmp_arr[1]}`
    }).join(", ");
}

function procedure_insert_3(arr) {
    return arr.map(tmp_str => `[${tmp_str.split(" ")[0]}]`).join(", ");
}

function procedure_insert_4(pk_str, arr) {
    return `NEXT VALUE FOR ${pk_str}seq, ` + arr.slice(1).map(tmp_str => `@${tmp_str.split(" ")[0]}`).join(", ");
}

function procedure_insert_full(table_name, arr) {
    let pk_str = arr[0].split(" ")[0];
    return `If exists (Select * from sysobjects where ID = Object_id('${procedure_insert(table_name)}') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop procedure ${procedure_insert(table_name)}
    go
    
    Create Procedure ${procedure_insert(table_name)}
    (
        ${procedure_insert_2(arr)}
    )
    as
    Insert into  [${table_name}]
	(
		${procedure_insert_3(arr)}
	)
	Values
	(
		${procedure_insert_4(pk_str, arr)}
	)
    go`;
}

// Update

function procedure_update(table_name) {
    return `NSP_${table_name}_Update`;
}

function procedure_update_2(arr){
    return arr.map(tmp_str => {
        let tmp_arr = tmp_str.split(" ");
        return `@${tmp_arr[0]} as ${tmp_arr[1]}`
    }).join(", ");
}

function procedure_update_3(arr){
    return arr.slice(1).map(x => x.split(" ")[0]).map(x => `[${x}] = @${x}`).join(", ");
}

function procedure_update_full(table_name, arr){
    let pk_str = arr[0].split(" ")[0];
    return `If exists (Select * from sysobjects where ID = Object_id('${procedure_update(table_name)}') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop procedure ${procedure_update(table_name)}
    go
    
    Create Procedure ${procedure_update(table_name)}
    (
        ${procedure_update_2(arr)}
    )
    as
    Update  [${table_name}] Set 
		${procedure_update_3(arr)}
	Where 1=1
	And [${pk_str}] = @${pk_str}
    go`;
}

// Delete

function procedure_delete(table_name) {
    return `NSP_${table_name}_Delete`;
}

function procedure_delete_full(table_name, arr){
    let pk_str = arr[0].split(" ")[0], data_type = arr[0].split(" ")[1];

    return `If exists (Select * from sysobjects where ID = Object_id('${procedure_delete(table_name)}') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop procedure ${procedure_delete(table_name)}
    go
    
    Create Procedure ${procedure_delete(table_name)}
    (
        @${pk_str} as ${data_type}
    )
    as
    Delete [${table_name}]
    Where 1=1
    And [${pk_str}] = @${pk_str}
    go`;
}
// Generate Everything

function new_arr(str) {
    return str.slice(0, -1).split(",\n");
}

for(let key in sql_dict){
    let str = sql_dict[key], table_name = key, arr = new_arr(str);

    // Select All
    console.log(procedure_select_all_full(table_name, arr));

    // Select By PK
    console.log(procedure_select_by_full(table_name, arr));

    // Insert
    console.log(procedure_insert_full(table_name, arr));

    // Update
    console.log(procedure_update_full(table_name, arr));

    // Delete
    console.log(procedure_delete_full(table_name, arr));
}