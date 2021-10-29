function split_value(str) {
    let flag = false, tmp_str = "", supreme_flag = false;
    for (let k in str) {
        let deno = str[k] + str[parseInt(k) + 1];
        if (deno == "to") supreme_flag = true;
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