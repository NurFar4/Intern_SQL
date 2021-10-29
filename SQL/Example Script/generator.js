//1. Type the array with the following attribute names into its respective array
//2. Generate create table based on the first split [0]
//3. first attribute is primary key, therefore it will have datatype number
//4. rest of the attribute will have the attribute varchar(255)
//5. Minute details shall be left for xiao bao
//6. Do Constraints after I shut khor tsu ming  up

let database_table = {
    "staff": ["id", "fname", "lname", "ssn", "dob", "gender", "phoneNo", "email", "hireDate", "position", "addressLine", "City", "postCode", "country", "salary"],
    "department": ["id", "name", "description"],
    "ward" : ["id", "type", "_NumOfBed_per_ward", "_Available_Bed_Num", "floor"],
    "bed" : ["Number", "Type"],
    "admission" : ["id", "date", "time", "fee", "_discharge_date", "_discharge_time"],
    "patient" : ["id", "fname", "lname", "ssn", "dob", "gender", "phoneNo", "email", "addressLine", "City", "postCode", "country"],
    "bill" : ["id", "date", "totalAmount"],
    "consultation": ["id", "date", "time"],
    "report":["id", "_medical_disease", "_PatMed_Quantity"],
    "medicine": ["id", "name", "description", "manufacturer", "dosage", "_quantityInStock", "unitPrice"],
    "service" : ["id", "name", "description", "charge"],
    "facility" : ["id", "name", "description", "quantity", "floor"]
}

function generate_sql_create(str, arr){
    let body_str = `${str}_${arr[0]} NUMBER(6) CONSTRAINTS ${str}_${arr[0]}_nn NOT NULL,\n`;
    for(let i = 1; i < arr.length; i++)
        body_str += (arr[i][0] === '_') ? `${arr[i].substring(1, arr[i].length)} VARCHAR2(255) CONSTRAINTS ${str}_${arr[i]}_nn NOT NULL,\n` : `${str}_${arr[i]} VARCHAR2(255) CONSTRAINTS ${str}_${arr[i]}_nn NOT NULL,\n`;
    body_str = body_str.substring(0, body_str.length - 2);
    return `CREATE TABLE ${str} (
        ${body_str}
    );`;
}

function generate_sql_drop(str){
    return `DROP TABLE ${str} CASCADE CONSTRAINT;`;
}

for(let i of Object.keys(database_table)){
    console.log(`-- Creating ${i.toUpperCase()} table`);
    console.log(generate_sql_create(i, database_table[i]));
    // console.log(generate_sql_drop(i));
}