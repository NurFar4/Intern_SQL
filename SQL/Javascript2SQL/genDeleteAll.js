const gen_sql_str = require("./genSqlStr");

// Generate Sql Statement String
const path = require('path');
let fileNameDir = path.join(__dirname, '..', 'NTL System', 'Models');
const sql_js_str = gen_sql_str(fileNameDir);

// Generate Dictionary
const gen_sql_dict = require("./genSqlDict");

// Declare Variables to be used
const sql_dict = gen_sql_dict(sql_js_str);

const table_name_arr = Object.keys(sql_dict);

table_name_arr.forEach(table_name => {
    console.log(`DROP TABLE ${table_name};`);
});