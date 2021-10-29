function get_value(str, const_str) {
    let tmp_str = str.split('\n');
    for (let i of tmp_str) {
        let tmp_str_2 = i.substr(const_str.length);
        tmp_str_2 = tmp_str_2.substr(0, tmp_str_2.length - 2);
        console.log(tmp_str_2);
        split_value(tmp_str_2);
        let tmp_arr = tmp_str_2.split(',');
        console.log("=".repeat(48));
    }
}

function split_value(str) {
    let flag = false, tmp_str = "", supreme_flag = false;
    for (let k in str) {
        let deno = str[k] + str[parseInt(k) + 1] + str[parseInt(k) + 2];
        if (deno == "to_") supreme_flag = true;
        if (supreme_flag) {
            tmp_str += str[k];
            if (str[k] == ')') {
                console.log(tmp_str);
                tmp_str = "";
                supreme_flag = false;
            }
        } else {
            if (str[k] == `'`) flag = !flag;
            if (flag) tmp_str += str[k];
            if (!flag && tmp_str !== "") {
                tmp_str = tmp_str.substr(1);
                console.log(tmp_str);
                tmp_str = "";
            }
        }
    }
}

function get_value_2(str, const_str) {
    let tmp_str = str.split('\n');
    for (let i of tmp_str) {
        let tmp_str_2 = i.substr(const_str.length);
        tmp_str_2 = tmp_str_2.substr(0, tmp_str_2.length - 2);
        let tmp_arr = tmp_str_2.split(',');
        console.log(tmp_arr);
    }
}

let str = `Insert into Bill values('B1001', to_date('02/22/2021', 'MM/DD/YYYY'), 1185.00, 'Completed', 'AXA Medical Insurance', 'Credit Card', 'R1001', 'AD1001', 'P1001');
Insert into Bill values('B1002', to_date('02/25/2021', 'MM/DD/YYYY'), 821.12, 'Pending', 'Great Eastern Health Insurance', 'Online Banking', 'R1002', 'AD1002', 'P1002');
Insert into Bill values('B1003', '', 566.00, 'Declined', 'Great Eastern Health Insurance', 'e-Wallet', 'R1003', 'AD1003', 'P1003');
Insert into Bill values('B1004', to_date('03/01/2021', 'MM/DD/YYYY'), 2885.00, 'Completed', 'No insurance found', 'Debit Card', 'R1004', 'AD1004', 'P1004');
Insert into Bill values('B1005', '', 1680.00, 'Declined', 'No insurance found', 'Credit Card', 'R1005', 'AD1005', 'P1005');
Insert into Bill values('B1006', to_date('02/23/2021', 'MM/DD/YYYY'), 311.12, 'Completed', 'Great Eastern Health Insurance', 'e-Wallet', 'R1006', 'AD1006', 'P1006');
Insert into Bill values('B1007', to_date('03/08/2021', 'MM/DD/YYYY'), 1140.00, 'Pending', 'No insurance found', 'Credit Card', 'R1007', 'AD1007', 'P1007');
Insert into Bill values('B1008', to_date('03/13/2021', 'MM/DD/YYYY'), 997.00, 'Pending', 'AXA Medical Insurance', 'Credit Card', 'R1008', 'AD1008', 'P1008');
Insert into Bill values('B1009', to_date('03/10/2021', 'MM/DD/YYYY'), 294.00, 'Completed', 'Great Eastern Health Insurance', 'Cash', 'R1009', 'AD1009', 'P1009');
Insert into Bill values('B1010', '', 1140.00, 'Declined', 'AXA Medical Insurance', 'Dedit Card', 'R1010', 'AD1010', 'P1010');`;
let const_str = 'Insert into Bill values(';
get_value(str, const_str);

// get_value(str, const_str);

// let tmp_str = str.split('\n');
// for (let i of tmp_str) {
//     let tmp_str_2 = i.substr(const_str.length);
//     tmp_str_2 = tmp_str_2.substr(0, tmp_str_2.length - 2);
//     console.log(tmp_str_2);
//     let tmp_arr = tmp_str_2.split(',');
//     console.log(tmp_arr[tmp_arr.length - 5].substr(1));
//     console.log(tmp_arr[tmp_arr.length - 2].substr(1));
//     console.log("=".repeat(48));
// }
