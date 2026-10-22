import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';
import 'package:i12_into_012/services/storage_service.dart';
import 'package:uuid/uuid.dart';

/// Provider for the application's state.
final NotifierProvider<AppStateNotifier, AppState> refAppState =
    NotifierProvider<AppStateNotifier, AppState>(AppStateNotifier.new);

/// Manages the [AppState] and exposes actions that modify it.
class AppStateNotifier extends Notifier<AppState> {
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
  void addTodo(String text) {
    if (text.trim().isEmpty) return;
    final newTodo = Todo(
      id: _uuid.v4(),
      text: text.trim(),
    );
    // Update state immutably
    state = state.copyWith(
      todos: [...state.todos, newTodo],
    );
    // Save updated state
    saveState();
  }

  /// Toggles the completion status of the given [todo].
  void toggleTodo(Todo todo) {
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
    saveState();
  }

  /// Deletes the todos with the given [ids] from the list.
  void deleteTodos(Set<String> ids) {
    state = state.copyWith(
      todos: state.todos.where((todo) => !ids.contains(todo.id)).toList(),
    );
    saveState();
  }

  /// Switches between light and dark theme.
  void toggleDarkMode() {
    state = state.copyWith(
      isDarkMode: !state.isDarkMode,
    );
    saveState();
  }

  /// Toggles whether the user is asked to confirm before deleting a todo.
  void toggleDeletionConfirmation() {
    state = state.copyWith(
      askForDeletionConfirmation: !state.askForDeletionConfirmation,
    );
    saveState();
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
