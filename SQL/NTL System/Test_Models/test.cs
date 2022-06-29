string name = "bigtitties";
string tableName = "tblMovie";
string dbName = "test_db";

string ConnectionString;
string query;

DAL dal;
IDataReader rdr;

// Microsoft SQL
ConnectionString = $"Data Source=DESKTOP-QS1MQCK;Initial Catalog={dbName};Integrated Security=True";
dal = new MicrosoftSqlDAL(ConnectionString);

// Insert Data into Microsoft SQL Server
query = $"EXEC NSP_{tableName}_Insert '{name}'";
dal.ExecuteNonQuery(query);

// Get All Data for SQL
query = $"SELECT * FROM {tableName}";
rdr = dal.GetDataReader(query);

Console.WriteLine("Microsoft SQL Server: ");
while (rdr.Read())
{
    Console.WriteLine($"{rdr.GetInt32(0)} {rdr.GetString(1)}");
}

// PostgreSQL
ConnectionString = $"Host=localhost;Username=postgres;Password=postgres;Database={dbName}";
dal = new PostgreSqlDAL(ConnectionString);

// Insert Data into PostgreSQL Server;
query = $"SELECT NSP_{tableName}_Insert('{name}')";
dal.ExecuteNonQuery(query);

// Get All Data for PostgreSQL Server
query = $"SELECT * FROM public.{tableName}";
rdr = dal.GetDataReader(query);

Console.WriteLine("PostgreSQL Server: ");
while (rdr.Read())
{
    Console.WriteLine($"{rdr.GetInt32(0)} {rdr.GetString(1)}");
}

ClsDataDAOImpl dao = new ClsDataDAOImpl();

List<ClsData> testList = dao.getAllClsData(MicrosoftDal, tblName);
testList.ForEach(obj =>
{
    Console.WriteLine(obj.data);
    ClsMovie model = new ClsMovie(obj.data);
    Console.WriteLine(model.ToString());
    Console.WriteLine();

    // Write To Postgres
    ClsData tmpModel = new ClsData(JsonConvert.SerializeObject(model.dataDict));
    dao.addClsData(PostgresDal, tblName, tmpModel);


});
Console.WriteLine("Success");