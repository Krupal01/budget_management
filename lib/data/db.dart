import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class BMDatabase {
  static final BMDatabase _instance = BMDatabase._();
  static Database? _database;

  BMDatabase._();

  factory BMDatabase() {
    return _instance;
  }

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await init();

    return _database;
  }

  Future<Database> init() async {
    String dbPath = join(await getDatabasesPath(), 'bm_database.db');
    var database = openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE user(
        user_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_name TEXT,
        mobile TEXT,
        password TEXT,
        pay_price REAL,
        claim_price REAL)
        ''');

        db.execute('''
        CREATE TABLE participants(
        participant_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        name TEXT,
        mobile TEXT,
        pay_price REAL,
        claim_price REAL)
        ''');

        db.execute('''
        CREATE TABLE transactions(
        transaction_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        reason TEXT,
        price REAL,
        date TEXT,
        participants TEXT)
        ''');


        },
      onUpgrade: (db, oldVersion, newVersion) {},
    );
    return database;
  }
}
