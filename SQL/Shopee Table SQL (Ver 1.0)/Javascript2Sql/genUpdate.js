const str = `buyer_id INT,
buyer_username VARCHAR(100),
buyer_name VARCHAR(100),
buyer_mobile_phone VARCHAR(20),`;

const table_name = "TShopeeBuyer";

function new_arr(str) {
    return str.slice(0, -1).split(",\n");
}

const arr = new_arr(str);

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
    return `
If exists (Select * from sysobjects where ID = Object_id('${procedure_update(table_name)}') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
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

console.log(procedure_update_full(table_name, arr));