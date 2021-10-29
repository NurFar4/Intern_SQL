const str = `buyer_id INT,
buyer_username VARCHAR(100),
buyer_name VARCHAR(100),
buyer_mobile_phone VARCHAR(20),`;

const table_name = "TShopeeBuyer";

function new_arr(str) {
    return str.slice(0, -1).split(",\n");
}

const arr = new_arr(str);

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