import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';

/// Provider for the application's state.
final NotifierProvider<AppStateNotifier, AppState> refAppState =
    NotifierProvider<AppStateNotifier, AppState>(AppStateNotifier.new);

class AppStateNotifier extends Notifier<AppState> {
  @override
  AppState build() => AppState(
    todos: [
      Todo(id: 1, text: 'Todo starten', isCompleted: true),
      Todo(
        id: 2,
        text: 'Todo to Json',
        isCompleted: false,
      ),
    ],
    isDarkMode: false,
    askForDeletionConfirmation: false,
  );

  void addTodo(String text) {}

  void toggleTodo(Todo todo) {
    final newTodo = todo.copyWidth(isCompleted: !todo.isCompleted);
    final newTodos = <Todo>[];
    for (final t in state.todos) {
      if (t == todo) {
        newTodos.add(newTodo);
      } else {
        newTodos.add(t);
      }
    }
    state = state.copyWidth(todos: newTodos);
  }

  void deletdTodos(List<Todo>()) {}

  void toggleDarkMode() {
    state = state.copyWidth(isDarkMode: !state.isDarkMode);
  }

  void toggleDetetionConfirmation() {}

  void loadState() {}

  void saveState() {}
}
