import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseProvider {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    await _initDatabase();
    return _database!;
  }

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $_trackTable ('
            '$_idColumn integer PRIMARY KEY AUTOINCREMENT,'
            '$_nameColumn string,'
            '$_albumId integer,'
            ');');
      },
      version: 2,
    );
  }
}

const String _databaseName = 'musify.db';

const String _idColumn = 'id';

const String _trackTable = 'tracks';
const String _nameColumn = 'name';
const String _albumId = 'albumId';
