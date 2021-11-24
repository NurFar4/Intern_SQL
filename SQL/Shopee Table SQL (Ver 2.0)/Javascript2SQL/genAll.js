// Concat SQL Code into Javascript String

const sql_js_dict = require("./genSqlStr");
const sql_js_str = sql_js_dict["sql_str"];
// const sql_js_str = `
// -- Product Table

// -- We don't use ID, when we can create new object in input
// DROP TABLE dbo.TShopeeProduct;

// CREATE TABLE dbo.TShopeeProduct(
//     product_id INT IDENTITY(1, 1) not null,
//     product_code VARCHAR(20),
//     name VARCHAR(50),
//     description VARCHAR(max),
//     SKU VARCHAR(20),
//     SKU2 VARCHAR(20),
//     buy_price DECIMAL(10, 2),
//     sell_price DECIMAL(10, 2),
//     product_brand VARCHAR(50),
//     product_type VARCHAR(50),
//     product_variety VARCHAR(50),
//     detail_id INT,
//     CONSTRAINT product_id_pk PRIMARY KEY(product_id)
// );
// `;

// Generate Dictionary
const gen_sql_dict = require("./genSqlDict");

// Function to generate procedure
const gen_select_all = require("./genSelectAll");
const gen_select_by_pk = require("./genSelectByPk");
const gen_insert = require("./genInsert");
const gen_update = require("./genUpdate");
const gen_delete = require("./genDelete");

// Declare Variables to be used
const sql_dict = gen_sql_dict(sql_js_str);
// const func_arr = [gen_select_all, gen_select_by_pk, gen_insert, gen_update, gen_delete];
const func_arr = [gen_insert, gen_update, gen_delete];
const table_arr = sql_js_str.match(/CREATE TABLE (.|\n)+?\);/g);
// const comment_arr = ["Select All", "Select By PK", "Insert New Record", "Update Existing Record", "Delete Record"]
//     .map(x => `Stored Procedure: ${x}`);
const comment_arr = ["Insert New Record", "Update Existing Record", "Delete Record"].map(x => `Stored Procedure: ${x}`);

// Lambda
f = x => {
    return x.split("TShopee")[1].replace(/([a-z])([A-Z])/g, '$1 $2');;
};

for (let ind in Object.keys(sql_dict)) {
    let key = Object.keys(sql_dict)[ind];
    let table_stmt = table_arr[ind];
    let table_name = key;
    let arr = sql_dict[table_name];

    console.log(`DELETE FROM dbo.${table_name};`);

    // console.log(table_stmt);

    // func_arr.forEach((func, ind) => {

    //     // Comment Before Each procedure
    //     console.log(`\n-- ${comment_arr[ind]}`)

    //     let str = func(table_name, arr);

    //     // Remove Tab Spaces
    //     console.log(str.replace(/\n[ ]{4,}/g, "\n"));
    // });

    // console.log();
}