import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// Opens the local SQLite database and creates its tables.
class DatabaseService {
  /// Database file in the app documents directory.
  static const String _fileName = 'todo_app.db';

  Future<Database>? _database;

  /// Returns the open database, opening it on first access.
  Future<Database> get database => _database ??= _open();

  Future<Database> _open() async {
    final dir = await getApplicationDocumentsDirectory();
    return openDatabase(
      join(dir.path, _fileName),
      version: 1,
      onCreate: _onCreate,
    );
  }

  /// Creates the tables and the single settings row with default values.
  ///
  /// Runs only once, when the database file does not exist yet.
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
        id TEXT PRIMARY KEY,
        text TEXT NOT NULL,
        isCompleted INTEGER NOT NULL DEFAULT 0
      )
    ''');
    await db.execute('''
      CREATE TABLE settings (
        id INTEGER PRIMARY KEY CHECK (id = 1),
        isDarkMode INTEGER NOT NULL,
        askForDeletionConfirmation INTEGER NOT NULL
      )
    ''');
    await db.insert('settings', {
      'id': 1,
      'isDarkMode': 0,
      'askForDeletionConfirmation': 1,
    });
  }
}
