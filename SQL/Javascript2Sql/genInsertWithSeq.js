const str = `buyer_id INT,
buyer_username VARCHAR(100),
buyer_name VARCHAR(100),
buyer_mobile_phone VARCHAR(20),`;

const table_name = "TShopeeBuyer";

function new_arr(str) {
    return str.slice(0, -1).split(",\n");
}

const arr = new_arr(str);

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

console.log(procedure_insert_full(table_name, arr));