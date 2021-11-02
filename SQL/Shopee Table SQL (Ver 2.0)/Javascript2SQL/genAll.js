// Concat SQL Code into Javascript String
const sql_js_str = require("./genSqlStr");

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
const func_arr = [gen_select_all, gen_select_by_pk, gen_insert, gen_update, gen_delete];
const table_arr = sql_js_str.match(/CREATE TABLE (.|\n)+?\);/g);

for (let ind in Object.keys(sql_dict)) {
    let key = Object.keys(sql_dict)[ind];
    let table_stmt = table_arr[ind];
    let table_name = key
    let arr = sql_dict[key];

    console.log(table_stmt);

    func_arr.forEach(func => {
        let str = func(table_name, arr);

        // Remove Tab Spaces
        console.log(str.replace(/\n[ ]{4,}/g, "\n"));
    });
}