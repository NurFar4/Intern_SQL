let sql_dict = {
    "TShopeeBuyer": `buyer_id INT,
    buyer_username VARCHAR(100),
    buyer_name VARCHAR(100),
    buyer_mobile_phone VARCHAR(20),`
}

function new_arr(str) {
    return str.slice(0, -1).split(",\n");
}

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

for(let key in sql_dict){
    let str = sql_dict[key], table_name = key, arr = new_arr(str);
    console.log(procedure_select_by_full(table_name, arr));
}