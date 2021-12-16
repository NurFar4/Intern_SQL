const fs = require('fs');
const path = require('path');

// const model_dir = __dirname + "/../../Shopee Table SQL (Ver 3.0)/Models";
const model_dir = __dirname + "/../Models";

/**
 * List all Files in Directory
 * @param {String} fileDirName 
 * @returns {Array}
 */
function readDirArr(fileDirName) {
    return fs.readdirSync(model_dir);
}

/**
 * Reads File and Convert Data into a String
 * @param {String} fileNameDir 
 * @returns {String}
 */
function readFile(fileNameDir) {
    return fs.readFileSync(fileNameDir, 'utf8');
}

// Stores all Data in SQL File and Concat into a very Large String
const final_str_arr = readDirArr(model_dir).map(fileName => readFile(model_dir + "/" + fileName));

// const final_str_arr = ["production.sql"].map(fileName => readFile(model_dir + "/" + fileName));
// const final_str_arr = ["user.sql"].map(fileName => readFile(model_dir + "/" + fileName));

const final_str = final_str_arr.join("\r\n")
    .split("\r\n")
    .join("\n")
    .replace(/DECIMAL\(10, (\d)\)/g, "DECIMAL(10,$1)")
    .replace(/IDENTITY\(1, 1\)/g, "IDENTITY(1,1)");

module.exports = {
    "sql_str": final_str,
    "readDirArr": readDirArr,
    "readFile": readFile
};