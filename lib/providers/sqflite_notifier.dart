import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';
import 'package:i12_into_012/services/database_service.dart';
import 'package:uuid/uuid.dart';

/// Manages the [AppState] and stores every change in a local SQLite database.
///
/// Works pessimistically: the database is written first and the [state]
/// only changes after the write succeeded.
class SqfliteNotifier extends AppStateNotifier {
  static const Uuid _uuid = Uuid();

  /// Opens the database that holds the todos and settings.
  final DatabaseService _db = DatabaseService();

  /// Creates the default [AppState] and starts loading the saved one.
  @override
  AppState build() {
    loadState();
    return const AppState(
      todos: [],
      isDarkMode: false,
      askForDeletionConfirmation: true,
    );
  }

  /// Adds a new todo with the given [text].
  @override
  Future<Todo?> addTodo(String text) async {
    if (text.trim().isEmpty) return null;
    final newTodo = Todo(
      id: _uuid.v4(),
      text: text.trim(),
    );
    final db = await _db.database;
    await db.insert('todos', _todoToRow(newTodo));
    state = state.copyWith(todos: [...state.todos, newTodo]);
    return newTodo;
  }

  /// Toggles the completion status of the given [todo].
  @override
  Future<Todo?> toggleTodo(Todo todo) async {
    final newTodo = todo.copyWith(isCompleted: !todo.isCompleted);
    final db = await _db.database;
    final count = await db.update(
      'todos',
      {'isCompleted': _toInt(newTodo.isCompleted)},
      where: 'id = ?',
      whereArgs: [todo.id],
    );
    if (count == 0) return null;
    state = state.copyWith(
      todos: state.todos.map((t) => t.id == todo.id ? newTodo : t).toList(),
    );
    return newTodo;
  }

  /// Deletes the todos with the given [ids] from the list.
  @override
  Future<int> deleteTodos(Set<String> ids) async {
    if (ids.isEmpty) return 0;
    final placeholders = List.filled(ids.length, '?').join(', ');
    final db = await _db.database;
    final count = await db.delete(
      'todos',
      where: 'id IN ($placeholders)',
      whereArgs: ids.toList(),
    );
    state = state.copyWith(
      todos: state.todos.where((todo) => !ids.contains(todo.id)).toList(),
    );
    return count;
  }

  /// Switches between light and dark theme.
  @override
  Future<bool?> toggleDarkMode() async {
    final value = !state.isDarkMode;
    await _updateSetting('isDarkMode', value);
    state = state.copyWith(isDarkMode: value);
    return value;
  }

  /// Toggles whether the user is asked to confirm before deleting a todo.
  @override
  Future<bool?> toggleDeletionConfirmation() async {
    final value = !state.askForDeletionConfirmation;
    await _updateSetting('askForDeletionConfirmation', value);
    state = state.copyWith(askForDeletionConfirmation: value);
    return value;
  }

  /// Loads all todos and the settings from the database.
  Future<void> loadState() async {
    final db = await _db.database;
    final todoRows = await db.query('todos', orderBy: 'rowid');
    final settingsRows = await db.query('settings', where: 'id = 1');
    final settings = settingsRows.first;
    state = AppState(
      todos: todoRows.map(_todoFromRow).toList(),
      isDarkMode: settings['isDarkMode'] == 1,
      askForDeletionConfirmation: settings['askForDeletionConfirmation'] == 1,
    );
  }

  /// Writes a single setting [column] of the settings row.
  Future<void> _updateSetting(String column, bool value) async {
    final db = await _db.database;
    await db.update('settings', {column: _toInt(value)}, where: 'id = 1');
  }

  // SQLite has no bool type, so booleans are stored as 0 and 1.
  static int _toInt(bool value) => value ? 1 : 0;

  static Map<String, Object?> _todoToRow(Todo todo) => {
    'id': todo.id,
    'text': todo.text,
    'isCompleted': _toInt(todo.isCompleted),
  };

  static Todo _todoFromRow(Map<String, Object?> row) => Todo(
    id: row['id']! as String,
    text: row['text']! as String,
    isCompleted: row['isCompleted'] == 1,
  );
}
