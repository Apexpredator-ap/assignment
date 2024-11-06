import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'user_database.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT UNIQUE,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<int> registerUser(User user) async {
    final db = await database;
    try {
      return await db.insert('users', user.toMap());
    } catch (e) {
      return -1; // Error code for duplicate email or other issue
    }
  }

  Future<User?> loginUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (users.isNotEmpty) {
      return User(
        id: users.first['id'],
        name: users.first['name'],
        email: users.first['email'],
        password: users.first['password'],
      );
    }
    return null;
  }
}
