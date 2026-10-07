import 'package:i12_into_012/models/todo.dart';

class AppState {
  final List<Todo> todos;
  final bool isDarkMode;
  final bool askForDeletionConfirmation;

  AppState({
    required this.todos,
    required this.isDarkMode,
    required this.askForDeletionConfirmation,
  });

  /// Converts this [AppState] to a JSON map for storage.
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'todos': todos.map((Todo todo) => todo.toJson()).toList(),
      'isDarkMode': isDarkMode,
      'askForDeletionConfirmation': askForDeletionConfirmation,
    };
  }

  factory AppState.fromJson(Map<String, dynamic> json) =>
      AppState(todos: [], isDarkMode: false, askForDeletionConfirmation: true);

  AppState copyWidth({
    List<Todo>? todos,
    bool? isDarkMode,
    bool? askForDeletionConfirmation,
  }) => AppState(
    todos: todos ?? this.todos,
    isDarkMode: isDarkMode ?? this.isDarkMode,
    askForDeletionConfirmation: askForDeletionConfirmation ?? true,
  );
}

/* 
#### AppState
- Properties:
  - `todos (List<Todo>)`: List of todo items
  - `isDarkMode (bool)`: Theme setting
  - `asksForDeletionConfirmation (bool)`: Deletion confirmation setting
- Methods:
  - `toJson()`: Convert to JSON for storage (returns `Map<String, dynamic>`)
  - `fromJson()`: Create AppState from JSON (factory constructor)
  - `copyWith()`: Create a copy with modified properties (returns `AppState`)

- Make it immutable.
- Do not forget to implement equality and hashCode.
*/
