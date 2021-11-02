const str = `buyer_id INT,
buyer_username VARCHAR(100),
buyer_name VARCHAR(100),
buyer_mobile_phone VARCHAR(20),`;

const table_name = "TShopeeBuyer";

function new_arr(str) {
    return str.slice(0, -1).split(",\n");
}

const arr = new_arr(str);

function procedure_select_all(table_name){
    return `NSP_${table_name}_SelectAll`;
}

function procedure_select_all_full(table_name, arr){

    let pk_str = arr[0].split(" ")[0], data_type = arr[0].split(" ")[1];

    return ``;
}

console.log(procedure_select_all_full(table_name, arr));