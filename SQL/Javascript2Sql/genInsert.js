// let sql_dict = {"TShopeeOrder": `order_id VARCHAR(50),
// refund_status VARCHAR(10),
// voucher_code VARCHAR(50),
// payment_method VARCHAR(50),
// purchase_date_time DATETIME,
// extra_charges DECIMAL(10,2),
// order_income DECIMAL(10,2),
// buyer_id INT,
// shipping_detail_id INT,
// order_transaction_id INT,`};

let sql_dict = {
    "tmp_product": `product_id INT,
product_name VARCHAR(50),
product_quantity INT,
product_unit_price DECIMAL(10,2),
created_at DATETIME,`
};

function new_arr(str) {
    return str.slice(0, -1).split(",\n");
}

function procedure_insert(table_name) {
    return `NSP_${table_name}_Insert`;
}

function procedure_update_2(arr){
    return arr.map(tmp_str => {
        let tmp_arr = tmp_str.split(" ");
        return `@${tmp_arr[0]} as ${tmp_arr[1]}`
    }).join(", ");
}

function procedure_insert_3(arr) {
    return arr.map(tmp_str => `[${tmp_str.split(" ")[0]}]`).join(", ");
}

function procedure_insert_5(pk_str, arr) {
    return arr.map(tmp_str => `@${tmp_str.split(" ")[0]}`).join(", ");
}

function procedure_insert_full_1(table_name, arr) {
    let pk_str = arr[0].split(" ")[0];
    return `If exists (Select * from sysobjects where ID = Object_id('${procedure_insert(table_name)}') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop procedure ${procedure_insert(table_name)}
    go
    
    Create Procedure ${procedure_insert(table_name)}
    (
        ${procedure_update_2(arr)}
    )
    as
    Insert into  [${table_name}]
	(
		${procedure_insert_3(arr)}
	)
	Values
	(
		${procedure_insert_5(pk_str, arr)}
	)
    go`;
}

for(let key in sql_dict){
    let table_name = key;
    let str = sql_dict[key];
    let arr = new_arr(str);
    console.log(arr);

    console.log(procedure_insert_full_1(table_name, arr));
}