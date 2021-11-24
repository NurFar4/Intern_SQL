const sql_js_dict = require("./genSqlStr");
const sql_js_str = sql_js_dict["sql_str"];

// Generate Dictionary
const gen_sql_dict = require("./genSqlDict");

// Declare Variables to be used
const sql_dict = gen_sql_dict(sql_js_str);

const table_name_arr = Object.keys(sql_dict);

table_name_arr.forEach(table_name => {
    console.log(`DROP TABLE ${table_name};`);
});