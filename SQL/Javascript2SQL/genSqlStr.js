const fs = require('fs');
const path = require('path');

/**
 * List all Files in Directory
 * @param {String} fileNameDir
 * @returns {Array}
 */
function readDirArr(fileNameDir) {
    return fs.readdirSync(fileNameDir);
}

/**
 * Reads File and Convert Data into a String
 * @param {String} fileNameDir 
 * @returns {String}
 */
function readFile(fileNameDir) {
    return fs.readFileSync(fileNameDir, 'utf8');
}

/**
 * Stores all Data in SQL File and Concat into a very Large String
 * @param {String} fileNameDir 
 * @returns {String}
 */
function genSqlStr(fileNameDir) {
    const final_str_arr = readDirArr(fileNameDir).map(fileName => readFile(path.join(fileNameDir, fileName)));
    return final_str_arr.join("\r\n")
    .split("\r\n")
    .join("\n")
    .replace(/DECIMAL\(10, (\d)\)/g, "DECIMAL(10,$1)")
    .replace(/IDENTITY\(1, 1\)/g, "IDENTITY(1,1)");
}

module.exports = function (fileNameDir) {
    return genSqlStr(fileNameDir);
};