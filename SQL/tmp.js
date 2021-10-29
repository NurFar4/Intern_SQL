// let str = `order_id VARCHAR(50) not null,
// order_status VARCHAR(20),
// payment_method VARCHAR(50),
// voucher_code VARCHAR(50),
// buyer_username VARCHAR(100) not null,
// buyer_name VARCHAR(100),
// buyer_mobile_phone VARCHAR(12) not null,
// product_name VARCHAR(100) not null,
// carrier_name VARCHAR(100),
// tracking_id VARCHAR(20),
// shipping_address VARCHAR(100),
// refund_status VARCHAR(10)`;

// let arr = str.split(",").map(x => x.split(" ")[0]);

// tmp_arr = arr.slice(1).map(x => x.slice(1));

// arr = [arr[0], ...tmp_arr];

// // for(let str of arr){
// //     console.log(`obj.set${capitalize(str)}(rst.getString("${str}"));`);
// // }

// function capitalize(str) {
//     return str.charAt(0).toUpperCase() + str.slice(1);
// }

// arr = ["product_quantity"];
// // for(let str of arr){
// //     console.log(`obj.set${capitalize(str)}(rst.getInt("${str}"));`);
// // }

// str2 = `product_unit_price DECIMAL(10, 2),
// product_sub_total DECIMAL(10, 2),
// shipping_fee DECIMAL(10, 2),
// extra_fee DECIMAL(10, 2),
// order_income DECIMAL(10, 2)`;

// arr = str2.split(",").map(x => x.split(" ")[0]).filter(x => x.length > 0);

// tmp_arr = arr.slice(1).map(x => x.slice(1));

// arr = [arr[0], ...tmp_arr];

// for(let str of arr){
//     console.log(`obj.set${capitalize(str)}(rst.getDouble("${str}"));`);
// }

function capitalize(str) {
    return str.charAt(0).toUpperCase() + str.slice(1);
}

let attribute_str = `order_transaction_no INT DEFAULT(NEXT VALUE FOR order_transacseq) not null,
order_id VARCHAR(50) not null,
product_id VARCHAR(20) not null,`;

let option_arr = ["String"];

let attribute_arr = attribute_str.split(",\n").map(x => x.split(" ")[0] + " = ?").slice(1);

let primary_key = "order_transaction_no";

console.log(attribute_arr.length + 1);

console.log(`UPDATE %s SET ${attribute_arr.join(", ")} WHERE ${primary_key} = ?`);

let final_str = "";
for(let ind in attribute_arr){
    let num = (ind < 5) ? 0 : (ind == 5) ? 1 : 2;
    final_str += `stmt.set${option_arr[num]}(${+ind+1}, cod.get${capitalize(attribute_arr[ind].split(" ")[0])}());\n`;
}
// final_str += `stmt.setInt(${attribute_arr.length + 1}, cd.getOrder_transaction_no());\n`;
final_str += `stmt.setInt(${attribute_arr.length + 1}, cod.get${capitalize(primary_key)}());\n`
final_str += "stmt.executeUpdate();\n";
console.log(final_str);

// UPDATE
//     dbo.shopee_order_detail
// SET
//     product_quantity = 16
// WHERE
//     order_id = '210826JW8FCH49';