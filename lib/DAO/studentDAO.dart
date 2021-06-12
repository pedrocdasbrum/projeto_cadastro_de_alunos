import 'package:sqflite/sqflite.dart';

class StudentDAO {
  static const _databaseName = "database.db";
  static late Database database;

  static Future<Database> _getConnection() async {
    String databasePath = await getDatabasesPath();
    String path = "$databasePath $_databaseName";
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE studants (registration INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,email TEXT)");
      },
    );
    return database;
  }

  static Future<int> insertRecord(
      String table, Map<String, dynamic> data) async {
    database = await StudentDAO._getConnection();
    int result = await database.insert(table, data);
    return result;
  }

  static Future<List<Map<String, dynamic>>> listRecords(String table) async {
    database = await StudentDAO._getConnection();
    
    List<Map<String, dynamic>> data = await database.query(table);
    return data;
  }
}
