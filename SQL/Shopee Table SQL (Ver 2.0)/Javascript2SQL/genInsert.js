/**
 * Insert Procedure Name
 * @param {string} table_name 
 * @returns string
 */
function insertName(table_name) {
    return `NSP_${table_name}_Insert`;
}

/**
 * Generates String for Procedure parameters
 * @param {Array} arr 
 * @returns string
 */
function paramArr(arr) {
    return arr.map(tmp_str => {
        let tmp_arr = tmp_str.split(" ");
        return `@${tmp_arr[0]} as ${tmp_arr[1]}`
    }).join(", ");
}

/**
 * Generates String for Procedure Statement
 * @param {Array} arr 
 * @returns string
 */
function paramStmt(arr) {
    return arr.map(tmp_str => `[${tmp_str.split(" ")[0]}]`).join(", ");
}

/**
 * Generates String for Procedure Values Statement
 * @param {string} pk_str 
 * @param {string} arr 
 * @returns string
 */
function valArr(arr) {
    return arr.map(tmp_str => `@${tmp_str.split(" ")[0]}`).join(", ");
}

/**
 * Insert Procedure
 * @param {string} table_name 
 * @param {Array} arr 
 * @returns string
 */
function insertProc(table_name, arr) {
    let pk_str = arr[0].split(" ")[0];
    return `
    If exists (Select * from sysobjects where ID = Object_id('${insertName(table_name)}') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop procedure ${insertName(table_name)}
    go
    Create Procedure ${insertName(table_name)}
    ( ${paramArr(arr)} )
    as
    Insert into  [${table_name}]
    ( ${paramStmt(arr)} )
    Values
    ( ${valArr(arr)} )
    go`;
}

module.exports = function(table_name, arr){
    return insertProc(table_name, arr.slice(1));
}