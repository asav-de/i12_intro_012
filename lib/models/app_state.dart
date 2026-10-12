import 'package:flutter/foundation.dart';
import 'package:i12_into_012/models/todo.dart';

/// Represents the immutable global state of the app: the list of [todos],
/// the theme setting [isDarkMode], and whether to [askForDeletionConfirmation]
/// before deleting a todo.
///
///

@immutable
class AppState {
  /// List of todo items.
  final List<Todo> todos;

  /// Whether the dark theme is enabled.
  final bool isDarkMode;

  /// Whether the user is asked to confirm before deleting a todo.
  final bool askForDeletionConfirmation;

  /// Creates an [AppState] with the given values.
  const AppState({
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

  /// Creates an [AppState] from a JSON map produced by [toJson].
  factory AppState.fromJson(Map<String, dynamic> json) => AppState(
    todos: (json['todos'] as List<dynamic>)
        .map(
          (e) => Todo.fromJson(e as Map<String, dynamic>),
        )
        .toList(),
    isDarkMode: json['isDarkMode'] as bool,
    askForDeletionConfirmation: json['askForDeletionConfirmation'] as bool,
  );

  /// Returns a copy of this [AppState] with the given fields replaced.
  ///
  /// Fields that are not provided keep their current values.
  AppState copyWith({
    List<Todo>? todos,
    bool? isDarkMode,
    bool? askForDeletionConfirmation,
  }) => AppState(
    todos: todos ?? this.todos,
    isDarkMode: isDarkMode ?? this.isDarkMode,
    askForDeletionConfirmation:
        askForDeletionConfirmation ?? this.askForDeletionConfirmation,
  );

  @override
  bool operator ==(Object other) =>
      other is AppState &&
      listEquals(todos, other.todos) &&
      isDarkMode == other.isDarkMode &&
      askForDeletionConfirmation == other.askForDeletionConfirmation;

  @override
  int get hashCode => Object.hash(
    isDarkMode,
    askForDeletionConfirmation,
    Object.hashAll(todos),
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
