function new_arr(str){
    return str.slice(0, -1).split(";\n");
}

function procedure_insert(table_name){
    return `NSP_${table_name}_Insert`;
}

function capitalize(str) {
    return str.charAt(0).toUpperCase() + str.slice(1);
}

function remove_underscore(str){
    return str.replace(/_/g, " ");
}

function procedure_insert_inner(arr) {
    return arr.slice(1).map((elmnt, ind) => {
        let tmp_arr = elmnt.split(" "), data_type = tmp_arr[1], var_name = tmp_arr[2];
        return `stmt.set${capitalize(data_type)}(${+ind + 1}, cb.get${capitalize(var_name)}())`;
    }).join("; ") + "; ";
}

function procedure_update_inner(arr) {
    return arr.map((elmnt, ind) => {
        let tmp_arr = elmnt.split(" "), data_type = tmp_arr[1], var_name = tmp_arr[2];
        return `stmt.set${capitalize(data_type)}(${+ind + 1}, cb.get${capitalize(var_name)}())`;
    }).join("; ") + "; ";
}

function procedure_str_2(tmp_str, n){
    return `EXEC ${tmp_str} ${("?, ").repeat(n).slice(0, -2)}`;
}

function procedure_insert_outer(table_name, arr) {
    let pk_str = arr[0].split(" ")[2];
    return `Connection conn = fac.createConnection(); try { PreparedStatement stmt = conn.prepareStatement("${procedure_str_2(procedure_insert(table_name), arr.length - 1)}"); ${procedure_insert_inner(arr)} stmt.executeUpdate(); System.out.println("Successfully added a new record into the table ${table_name}"); } catch (Exception e) { e.printStackTrace(); }`.replace(/; /g, ';\n');
}

function procedure_insert_outer_2(table_name, arr) {
    let pk_str = arr[0].split(" ")[2];
    return `Connection conn = fac.createConnection(); try { PreparedStatement stmt = conn.prepareStatement("${procedure_str_2(procedure_insert(table_name), arr.length - 1)}"); ${procedure_update_inner(arr)} stmt.executeUpdate(); System.out.println("Successfully added a new record into the table ${table_name}"); } catch (Exception e) { e.printStackTrace(); }`.replace(/; /g, ';\n');
}

let java_dict = {
    "TShopeeBuyer":`private int buyer_id;
	private String buyer_username;
	private String buyer_name;
	private String buyer_mobile_phone;`,
    "TShopeeCarrier":`private int carrier_id;
	private String carrier_name;`,
    "TShopeeOrder":`private String order_id;
	private boolean refund_status;
	private String voucher_code;
	private String payment_method;
	private String purchase_date_time;
	private double extra_charges;
	private double order_income;
	private int buyer_id;
	private int shipping_detail_id;
	private int order_transaction_id;`,
    "TShopeeOrder":`private String order_id;
	private boolean refund_status;
	private String voucher_code;
	private String payment_method;
	private String purchase_date_time;
	private double extra_charges;
	private double order_income;
	private int buyer_id;
	private int shipping_detail_id;
	private int order_transaction_id;`,
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
	private double product_unit_price;`,
    "TShopeeShippingDetail":`private int shipping_detail_id;
	private String tracking_id;
	private String shipping_address;
	private String shipping_status;
	private double shipping_fee;
	private String order_id;
	private int carrier_id;`
}

// for(let key in java_dict){
//     let table_name = key;
//     let procedure_insert = java_dict[table_name];
//     let clsName = "Cls" + table_name.split("TShopee")[1];
//     let arr = new_arr(procedure_insert);
//     console.log(procedure_insert_outer(table_name, arr));
//     console.log();
// }

let tmp_dict = {
    "TShopeeOrder":`private String order_id;
	private boolean refund_status;
	private String voucher_code;
	private String payment_method;
	private String purchase_date_time;
	private double extra_charges;
	private double order_income;
	private int buyer_id;
	private int shipping_detail_id;
	private int order_transaction_id;`
}

for(let key in tmp_dict){
    let table_name = key;
    let java_str = tmp_dict[table_name];
    let clsName = "Cls" + table_name.split("TShopee")[1];
    let arr = new_arr(java_str);
    console.log(procedure_insert_outer_2(table_name, arr));
    console.log();
}