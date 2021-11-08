const sql_js_dict = require("./genSqlStr");
const model_dir = __dirname + "/../Models";

// Functions for Reading File
const readDirArr = sql_js_dict["readDirArr"];
const readFile = sql_js_dict["readFile"];

let sql_dict = {};

function capitalize(str){
    return str.slice(0, 1).toUpperCase() + str.slice(1);
}

readDirArr(model_dir).forEach(fileName => {
    let tmp_str = readFile(model_dir + "/" + fileName)
        .split("\r\n")
        .join("\n")
        .replace(/DECIMAL\(10, 2\)/g, "DECIMAL(10,2)")
        .replace(/IDENTITY\(1, 1\)/g, "IDENTITY(1,1)")
        .match(/CREATE TABLE (.|\n)+?\);/g)
        .join("\n");

    let regEx = /dbo.TShopee(.*)[\(;]/g;
    
    let tmp_arr = [];
    let match = regEx.exec(tmp_str);
    while (match != null) {
        tmp_arr.push(match[1])
        match = regEx.exec(tmp_str);
    }

    tmp_arr.sort();
    tmp_arr = tmp_arr.map(str => str.match(/[A-Z][a-z]+/g).join(" "))


    sql_dict[fileName.slice(0, -4)] = tmp_arr;

    let tableName = fileName.slice(0, -4);

    console.log(`{"${capitalize(tableName)}", new List<string>(){"${tmp_arr.join("\", \"")}"}}, `);
});