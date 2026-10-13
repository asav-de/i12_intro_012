import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';
import 'package:uuid/uuid.dart';

/// Provider for the application's state.
final NotifierProvider<AppStateNotifier, AppState> refAppState =
    NotifierProvider<AppStateNotifier, AppState>(AppStateNotifier.new);

/// Manages the [AppState] and exposes actions that modify it.
class AppStateNotifier extends Notifier<AppState> {
  static const Uuid _uuid = Uuid();

  /// Creates the initial [AppState] with sample todos.
  @override
  AppState build() => const AppState(
    todos: [
      Todo(id: '1', text: 'Todo starten', isCompleted: true),
      Todo(
        id: '2',
        text: 'Todo to Json',
      ),
    ],
    isDarkMode: false,
    askForDeletionConfirmation: false,
  );

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
      if (t == todo) {
        newTodos.add(newTodo);
      } else {
        newTodos.add(t);
      }
    }
    state = state.copyWith(todos: newTodos);
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
  }

  /// Toggles whether the user is asked to confirm before deleting a todo.
  void toggleDeletionConfirmation() {
    state = state.copyWith(
      askForDeletionConfirmation: !state.askForDeletionConfirmation,
    );
  }

  /// Loads the [AppState] from storage.
  void loadState() {}

  /// Saves the current [AppState] to storage.
  void saveState() {}
}
