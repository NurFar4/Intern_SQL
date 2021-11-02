let arr = ["platform", "customer", "order",
    "order_status", "order_item", "order_item_status",
    "invoice", "invoice_status", "payment_method"];

function gen_table_str(table_name) {
    let tmp_str = remove_underscore(table_name).split(" ").map(x => capitalize(x)).join("");
    return `
DROP TABLE dbo.TShopee${tmp_str};

CREATE TABLE dbo.TShopee${tmp_str}(
    ${table_name}_id INT DEFAULT(NEXT VALUE FOR ${table_name}_idseq) not null,
    CONSTRAINT ${table_name}_id_pk PRIMARY KEY(${table_name}_id)
);`;
}

function capitalize(str) {
    return str.charAt(0).toUpperCase() + str.slice(1);
}

function remove_underscore(str) {
    return str.replace(/_/g, " ");
}

arr.forEach(table_name => console.log(gen_table_str(table_name)));

