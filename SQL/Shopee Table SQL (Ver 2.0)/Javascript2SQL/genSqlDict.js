/**
 * Generates SQL Dictonary
 * @param {string} str 
 * @returns object
 */
function table_dict(str) {
    /**
     * Key => Table Name
     * Value => List of String ({Param_Name} {Param_DataType})
     */
    let final_dict = {};

    // Capture all text within Create Table Script
    let arr = str.match(/CREATE TABLE (.|\n)+?\);/g);

    // Remove Tab Space To only 1 whitespace
    arr = arr.map(x => x.replace(/[ ]+/g, " "));

    arr.forEach(str => {
        let tmp_arr = str.split("\n");

        // Extract Table name from String format `CREATE TABLE dbo.{table_name}`
        let table_name = tmp_arr[0].slice("CREATE TABLE ".length + 4, -1);

        // Retain only Parameter Variables
        // Then, Remove 1st whitespace character and last comma character
        // Then, For Each Parameter, only Retain Parameter Name and Parameter DataType
        let param_arr = tmp_arr.slice(1, -2)
            .map(x => x.slice(1, -1))
            .map(x => x.split(" ").slice(0, 2).join(" "));

        final_dict[table_name] = param_arr;
    });

    return final_dict;
}

module.exports = function(str){
    return table_dict(str);
}
