const fs = require('fs');
const path = require('path');

const model_dir = __dirname + "/../Models";

/**
 * List all Files in Directory
 * @param {string} fileDirName 
 * @returns {Array}
 */
function readDirArr(fileDirName){
    return fs.readdirSync(model_dir);
}

/**
 * Reads File and Convert Data into a String
 * @param {string} fileNameDir 
 * @returns {string}
 */
function readFile(fileNameDir){
    return fs.readFileSync(fileNameDir, 'utf8');
}

// Stores all Data in SQL File and Concat into a very Large String
const final_str_arr = readDirArr(model_dir).map(fileName => readFile(model_dir + "/" + fileName));

const final_str = final_str_arr.join("\r\n").split("\r\n").join("\n").replace(/DECIMAL\(10, 2\)/g, "DECIMAL(10,2)");

module.exports = final_str;