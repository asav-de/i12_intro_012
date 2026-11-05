import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';
import 'package:i12_into_012/providers/sqflite_notifier.dart';

/// Provider for the application's state.
final NotifierProvider<AppStateNotifier, AppState> refAppState =
    // Switch the storage strategy here.
    NotifierProvider<AppStateNotifier, AppState>(SqfliteNotifier.new);

/// Interface for managing the [AppState].
abstract class AppStateNotifier extends Notifier<AppState> {
  /// Adds a new todo with the given [text].
  Future<Todo?> addTodo(String text);

  /// Toggles the completion status of the given [todo].
  Future<Todo?> toggleTodo(Todo todo);

  /// Deletes the todos with the given [ids].
  Future<int> deleteTodos(Set<String> ids);

  /// Switches between light and dark theme.
  Future<bool?> toggleDarkMode();

  /// Toggles the deletion confirmation setting.
  Future<bool?> toggleDeletionConfirmation();
}
