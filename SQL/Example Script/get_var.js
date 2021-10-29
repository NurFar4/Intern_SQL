let str = `nursing_specialty varchar2(20),
level_Of_Nursing varchar2(17),
staff_id char(5) not null,`;

function get_var(str) {
    let tmp_str = str.split('\n');
    for (let i of tmp_str) {
        let tmp = i.split(' ')[0];
        console.log(tmp);
    }
}

get_var(str);
