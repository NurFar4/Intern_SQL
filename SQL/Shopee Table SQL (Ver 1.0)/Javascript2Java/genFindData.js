function new_arr(str){
    return str.slice(0, -1).split(";\n");
}

function procedure_select_by(table_name){
    return `NSP_${table_name}_SelectByPK`;
}

function capitalize(str) {
    return str.charAt(0).toUpperCase() + str.slice(1);
}

function remove_underscore(str){
    return str.replace(/_/g, " ");
}

function procedure_str(arr) {
    return arr.map(tmp_str => {
		let tmp_arr = tmp_str.split(" ");
		let data_type = tmp_arr[1], var_name = tmp_arr[2];
		return `obj.set${capitalize(var_name)}(rst.get${capitalize(data_type)}("${var_name}"))`;
	}).join("; ") + "; ";
}

function procedure_select_by_outer(table_name, arr) {
    let data_type = arr[0].split(" ")[1];
    let pk_str = arr[0].split(" ")[2];
    let clsName = "Cls" + table_name.split("TShopee")[1];
    return `ResultSet rst = null; ${clsName} obj = null; Connection conn = fac.createConnection(); try { PreparedStatement stmt = conn.prepareStatement("EXEC dbo.${procedure_select_by(table_name)} ?"); stmt.set${capitalize(data_type)}(1, ${pk_str}); rst = stmt.executeQuery(); if (!rst.next()) return null; else { obj = new ${clsName}(); ${procedure_str(arr)} System.out.println(String.format("Successfully retrieve product with ${capitalize(remove_underscore(pk_str))} %s", ${pk_str})); } } catch (SQLException e) { e.printStackTrace(); } return obj;`.replace(/; /g, ';\n');
}

// let java_dict = {
//     "TShopeeBuyer":`private int buyer_id;
// 	private String buyer_username;
// 	private String buyer_name;
// 	private String buyer_mobile_phone;`,
//     "TShopeeCarrier":`private int carrier_id;
// 	private String carrier_name;`,
//     "TShopeeOrder":`private String order_id;
// 	private boolean refund_status;
// 	private String voucher_code;
// 	private String payment_method;
// 	private String purchase_date_time;
// 	private double extra_charges;
// 	private double order_income;
// 	private int buyer_id;
// 	private int shipping_detail_id;
// 	private int order_transaction_id;`,
//     "TShopeeOrder":`private String order_id;
// 	private boolean refund_status;
// 	private String voucher_code;
// 	private String payment_method;
// 	private String purchase_date_time;
// 	private double extra_charges;
// 	private double order_income;
// 	private int buyer_id;
// 	private int shipping_detail_id;
// 	private int order_transaction_id;`,
//     "TShopeeOrderDetail":`private int order_transaction_id;
// 	private String order_id;
// 	private int product_transaction_id;
// 	private int product_quantity;
// 	private double sub_total;`,
//     "TShopeeProduct":`private int product_transaction_id;
// 	private String product_id;
// 	private String product_name;
// 	private String product_variety;
// 	private int product_stock_quantity;
// 	private double product_unit_price;`,
//     "TShopeeShippingDetail":`private int shipping_detail_id;
// 	private String tracking_id;
// 	private String shipping_address;
// 	private String shipping_status;
// 	private double shipping_fee;
// 	private String order_id;
// 	private int carrier_id;`
// }

let java_dict = {
	"TShopeeOrderDetail":`private int order_transaction_id;
	private String order_id;
	private int product_transaction_id;
	private int product_quantity;
	private double sub_total;`,
    "TShopeeProduct":`private int product_transaction_id;
	private String product_id;
	private String product_name;
	private String product_variety;
	private int product_stock_quantity;
	private double product_unit_price;`
};

for(let key in java_dict){
    let table_name = key;
    let procedure_select_by = java_dict[table_name];
    let arr = new_arr(procedure_select_by);
    console.log(procedure_select_by_outer(table_name, arr));
    console.log();
}