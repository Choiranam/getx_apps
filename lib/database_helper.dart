import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cart_items.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE cart(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            price REAL
          )
        ''');
      },
      version: 1,
    );
  }

  Future<void> insertItem(Map<String, dynamic> item) async {
    final db = await database;
    await db!.insert('cart', item);
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await database;
    return await db!.query('cart');
  }

  Future<void> deleteItem(int id) async {
    final db = await database;
    await db!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }
}
