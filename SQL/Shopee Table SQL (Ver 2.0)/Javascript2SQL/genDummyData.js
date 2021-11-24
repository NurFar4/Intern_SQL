const sql_js_dict = require("./genSqlStr");
const sql_js_str = sql_js_dict["sql_str"];
// const sql_js_str = `
// DROP TABLE dbo.tmp_product;

// CREATE TABLE dbo.tmp_product(
//     product_id INT DEFAULT(NEXT VALUE FOR tmp_product_idseq) not null,
//     product_name VARCHAR(50),
//     product_quantity INT,
//     product_unit_price DECIMAL(10,2),
//     created_at DATETIME,
//     CONSTRAINT tmp_product_id_pk PRIMARY KEY (product_id)
// );
// `;

const gen_sql_dict = require("./genSqlDict");

/**
 * Key => String: Table Name
 * Value => Array: Table Properties
 */
const sql_dict = gen_sql_dict(sql_js_str);

// Unique DataType: 
// INT, VARCHAR, DECIMAL, DATETIME

// Random Function
const Chance = require("chance");
const chance = new Chance();

/**
 * Generates Random Integer
 * @returns {Integer}
 */
function random_int() {
    return chance.integer({ min: 0, max: 1000 });
}

/**
 * Generates Random Decimal
 * @returns {Number}
 */
function random_decimal() {
    return chance.floating({ min: 0, max: 1000 }).toFixed(2);
}

/**
 * Generates Random String of length 10
 * @returns {String}
 */
function random_str() {
    return chance.string({ length: 10 }).replace(/\'/g, "");
}

/**
 * Generates Random DateTime
 * @returns {Date}
 */
function random_datetime() {
    return `${chance.year()}-${chance.month({ raw: true })["numeric"]}-${18} ${chance.hour()}:${chance.minute()}:${chance.second()}`;
}

/**
 * Generates Random Value based on Data Type
 * @param {String} dateType 
 * @returns {String}
 */
function random_all(dateType) {
    if (dateType.toUpperCase().includes("INT"))
        return random_int();
    else if (dateType.toUpperCase().includes("VARCHAR"))
        return `'${random_str()}'`;
    else if (dateType.toUpperCase().includes("DECIMAL"))
        return random_decimal();
    else if (dateType.toUpperCase().includes("DATETIME"))
        return `'${random_datetime()}'`;
    return "";
}

/**
 * Insert Procedure Name
 * @param {String} table_name 
 * @returns {String}
 */
function insertName(table_name) {
    return `NSP_${table_name}_Insert`;
}

/**
 * Generates Insert Statement From Property Array
 * @param {Array} datatype_arr 
 * @returns {String}
 */
function insertStmt(datatype_arr) {
    return datatype_arr.slice(1).map(prop => random_all(prop)).join(", ");
}

/**
 * Returns a randomly shuffled Array [Implementation of Schwartzian transform](https://stackoverflow.com/questions/2450954/how-to-randomize-shuffle-a-javascript-array)
 * @param {Array} arr 
 * @returns {Array}
 */
function random_shuffle(arr) {
    return arr.map((value) => ({ value, sort: Math.random() }))
        .sort((a, b) => a.sort - b.sort)
        .map(({ value }) => value);
}

// // Loop Through SQL Dict
// for (let key in sql_dict) {
//     let table_name = key, table_prop = sql_dict[table_name], datatype_arr = table_prop.map(x => x.split(" ")[1]);
//     [...Array(1)].forEach(_ => {
//         console.log(`EXEC ${insertName(table_name)} ${insertStmt(datatype_arr)};`);
//     });
// }

let table_name = "TShopeeProduct", table_prop = sql_dict[table_name], datatype_arr = table_prop.map(x => x.split(" ")[1]);
table_prop.map(x => x.split(" ")[0]).forEach(datatype => {
    console.log(`$("input[name='${datatype}']").val("");`);
});

// // Dummy Data => TShopeeProductionDetail

// table_name = "TShopeeProductionDetail";

// sword_type = ["Wooden", "Iron", "Steel", "Gold", "Diamond"];

// arr = [];

// for (let ind = 0; ind < 5; ind++) {
//     let tmp_size = Math.random() * sword_type.length;
//     for (let j = 0; j < tmp_size; j++) {
//         let type = sword_type[j],
//             tmp_arr = [
//                 `'${type} Sword'`,
//                 `'${random_datetime()}'`,
//                 `'${random_datetime()}'`,
//                 random_int(),
//                 ind + 1,
//                 `'Swo/${type.slice(0, 3)}'`
//             ];
//         arr.push(`EXEC ${insertName(table_name)} ${tmp_arr.join(", ")};`);
//     }
// }

// // SQL Statements to Execute
// console.log(`DELETE FROM ${table_name};`);
// console.log(random_shuffle(arr).join("\n"));

// // Dummy Data => TShopeeProduct

// table_name = "TShopeeProduct";

// table_name_2 = "TShopeeStockItem";

// arr = [];

// sword_variety = ["Wooden", "Iron", "Steel", "Gold", "Diamond"],
//     sword_brand = ["ArctiBlade", "EvanAxe", "Shinyaxe"],
//     product_type = "Sword";

// for (let ind = 0; ind < sword_variety.length; ind++) {
//     let type = product_type, variety = sword_variety[ind], brand = sword_brand[Math.floor(Math.random() * 3)];

//     let tmp_arr = [
//         `'${chance.integer({ min: 100000000, max: 999999999 })}'`,
//         `'${type} ${variety}'`,
//         `'A ${type} that is made out of ${variety}'`,
//         `'${type.slice(0, 3)}/${variety.slice(0, 3)}'`,
//         `'${type.slice(0, 3)}/${variety.slice(0, 3)}2'`,
//         random_decimal(),
//         random_decimal(),
//         `'${brand}'`,
//         `'${type}'`,
//         `'${variety}'`
//     ];

//     arr.push(`EXEC ${insertName(table_name)} ${tmp_arr.join(", ")};`);

//     let tmp_arr_2 = [
//         `'${type} ${variety}'`,
//         `'A ${type} that is made out of ${variety}'`,
//         0,
//         `'${type.slice(0, 3)}/${variety.slice(0, 3)}'`,
//         1
//     ]

//     arr.push(`EXEC ${insertName(table_name_2)} ${tmp_arr_2.join(", ")};`);
// }

// console.log(`DELETE FROM ${table_name};`);
// console.log(`DELETE FROM ${table_name_2};`)
// console.log(random_shuffle(arr).join("\n"));
