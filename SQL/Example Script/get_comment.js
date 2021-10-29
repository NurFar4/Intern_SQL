function func(str, num){
    let arr = str.split('\n');
    let new_arr = [];
    let ind = num;
    for(let i of arr) console.log(`/*${ind++}. ${i} */`);
}

let str = `/* Query 3 */`;

function generate_statement(str, start_ind, end_ind){
    for(let i = start_ind; i <= end_ind; i++) console.log(`/* ${str} ${i} */`);
}

generate_statement('Function', 1, 5);