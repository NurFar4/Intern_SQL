function addSpacingBeforeCapital(str) {
    return str.replace(/([A-Z])/g, ' $1').trim();
}

function checkLastS(str) {
    return (str.at(-1) === 's') ? str.slice(0, -1) : str;
}

function genPropString(prop) {
    return prop.map((x, ind) => (ind > 0) ? `modelItem.${x} = item.${x};` : `modelItem.${x} = item.${x};`).join("\n");
}

function genInsert(tableType, tableName, prop) {
    return `
    public static void ${tableName}Insert(${tableType}${checkLastS(tableName)} item, string username)
    {
        DetailInsert($"${tableName}: {item.${prop[1]}}", "", username, username);
        item.detail_id = GetID("${tableType}Detail");

        db.NSP_${tableType}${tableName}_Insert(${prop.slice(1).map(x => `item.${x}`).join(", ")});
        db.SaveChanges();
    }`.replace(/[ ]{2,}/g, "");
}

function genUpdate(tableType, tableName, prop) {
    return `
    public static void ${tableName}Update(${tableType}${checkLastS(tableName)} item, string username)
    {
        var modelItem = db.${tableType}${checkLastS(tableName)}s.Find(item.id);

        item.detail_id = (int) modelItem.detail_id;
        ${tableType}Detail detail = db.${tableType}Details.FirstOrDefault(it => it.id == item.detail_id);
        detail.name = $"${tableName}: {item.${prop[1]}}";

        DetailUpdate(detail.id, detail.name, detail.remark, detail.created_by, detail.created_date, username);

        db.NSP_${tableType}${tableName}_Update(${prop.map(x => `item.${x}`).join(", ")});
        db.SaveChanges();
    }`.replace(/[ ]{2,}/g, "");
}

function genDelete(tableType, tableName) {
    return `
    public static void ${tableName}Delete(int id)
    {
        var modelItem = db.${tableType}${checkLastS(tableName)}s.Find(id);

        int detail_id = (int) modelItem.detail_id;
        DetailDelete(detail_id);

        db.NSP_${tableType}${tableName}_Delete(id);
        db.SaveChanges();
    }`.replace(/[ ]{2,}/g, "");
}

function genParameter(tableName, prop) {
    return prop.map(x => `item.${x} = (item.${x} == null) ? "${tableName}_${x}" : item.${x};`).join("\n");
}

let str = `
-- Team Table
DROP TABLE dbo.THelpDeskTeam;

CREATE TABLE dbo.THelpDeskTeam(
    id INT IDENTITY(1, 1) not null,
    name VARCHAR(100),
    team_member_id INT,
    status_id INT,
    remark VARCHAR(max),
    created_by VARCHAR(100),
    created_date DATETIME,
    last_updated_by VARCHAR(100),
    last_updated_date DATETIME,
    CONSTRAINT team_id_pk PRIMARY KEY (id)
);
`;

let table_stmt_arr = str.match(/CREATE(.|\n)+?\);/g);

table_stmt_arr.forEach(table_stmt => {
    let table = table_stmt.replace(/CREATE.*dbo\.(.*)\((.*|\n)*\);/, "$1");

    // Remove "TNtl"
    // Remove "THelpDesk"
    let tableName = table.replace(/(T(Ntl|HelpDesk))(.*)(.*)/g, "$3");

    let tableType = table.replace(/(T(Ntl|HelpDesk))(.*)(.*)/g, "$1");
    
    let prop = table_stmt.match(/\s([a-z_]*).*,\n/g);

    prop = prop.map(x => x.replace(/(\n|[ ]+)/g, " "));

    prop = prop.map(x => x.trimStart());

    prop = prop.map(x => x.split(" ")[0]);

    console.log(genInsert(tableType, tableName, prop));
    console.log(genUpdate(tableType, tableName, prop));
    console.log(genDelete(tableType, tableName));
    // console.log(prop.map(x => `${tableName.toLowerCase()}.${x} = "";`).join("\n"));
});
