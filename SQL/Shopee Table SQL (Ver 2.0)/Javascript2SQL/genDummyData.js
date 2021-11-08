const sql_js_str = require("./genSqlStr");
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
        return `'${random_str()} ${random_str()} ${random_str()}'`;
    else if (dateType.toUpperCase().includes("DECIMAL"))
        return random_decimal();
    else if (dateType.toUpperCase().includes("DATETIME"))
        return `'${random_datetime()}'`;
    return "";
}

/**
 * Insert Procedure Name
 * @param {string} table_name 
 * @returns string
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

// 5. Loop Through SQL Dict
for (let key in sql_dict) {
    let table_name = key, table_prop = sql_dict[key], datatype_arr = table_prop.map(x => x.split(" ")[1]);
    [...Array(5)].forEach(_ => {
        console.log(`EXEC ${insertName(table_name)} ${insertStmt(datatype_arr)};`);
    });
    console.log();
}

