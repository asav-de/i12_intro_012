import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';
import 'package:i12_into_012/services/storage_service.dart';
import 'package:uuid/uuid.dart';

/// Manages the [AppState] and stores it in a local JSON file.
class LocalJsonNotifier extends AppStateNotifier {
  static const Uuid _uuid = Uuid();

  /// Reads and writes the [AppState] to a file.
  final StorageService _storage = StorageService();

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
    // Update state immutably
    state = state.copyWith(
      todos: [...state.todos, newTodo],
    );
    // Save updated state
    await saveState();
    return newTodo;
  }

  /// Toggles the completion status of the given [todo].
  @override
  Future<Todo?> toggleTodo(Todo todo) async {
    final newTodo = todo.copyWith(isCompleted: !todo.isCompleted);
    final newTodos = <Todo>[];
    for (final t in state.todos) {
      if (t.id == todo.id) {
        newTodos.add(newTodo);
      } else {
        newTodos.add(t);
      }
    }
    state = state.copyWith(todos: newTodos);
    await saveState();
    return newTodo;
  }

  /// Deletes the todos with the given [ids] from the list.
  @override
  Future<int> deleteTodos(Set<String> ids) async {
    final countBefore = state.todos.length;
    state = state.copyWith(
      todos: state.todos.where((todo) => !ids.contains(todo.id)).toList(),
    );
    await saveState();
    return countBefore - state.todos.length;
  }

  /// Switches between light and dark theme.
  @override
  Future<bool?> toggleDarkMode() async {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode,
    );
    await saveState();
    return state.isDarkMode;
  }

  /// Toggles whether the user is asked to confirm before deleting a todo.
  @override
  Future<bool?> toggleDeletionConfirmation() async {
    state = state.copyWith(
      askForDeletionConfirmation: !state.askForDeletionConfirmation,
    );
    await saveState();
    return state.askForDeletionConfirmation;
  }

  /// Loads the [AppState] from storage.
  Future<void> loadState() async {
    final loaded = await _storage.loadAppState();
    if (loaded != null) state = loaded;
  }

  /// Saves the current [AppState] to storage.
  Future<void> saveState() async {
    await _storage.saveAppState(state);
  }
}
