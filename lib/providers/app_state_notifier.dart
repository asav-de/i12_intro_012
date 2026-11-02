import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';
import 'package:i12_into_012/providers/local_json_notifier.dart';

/// Provider for the application's state.
final NotifierProvider<AppStateNotifier, AppState> refAppState =
    // Change the constructor here to switch the storage strategy.
    NotifierProvider<AppStateNotifier, AppState>(LocalJsonNotifier.new);

/// Manages the [AppState] and exposes actions that modify it.
abstract class AppStateNotifier extends Notifier<AppState> {
  /// Adds a new todo with the given [text].
  ///
  /// Returns the saved todo, or `null` if it was not saved.
  Future<Todo?> addTodo(String text);

  /// Toggles the completion status of the given [todo].
  ///
  /// Returns the updated todo, or `null` if it was not saved.
  Future<Todo?> toggleTodo(Todo todo);

  /// Deletes the todos with the given [ids].
  ///
  /// Returns the number of deleted todos.
  Future<int> deleteTodos(Set<String> ids);

  /// Switches between light and dark theme.
  ///
  /// Returns the new value, or `null` if it was not saved.
  Future<bool?> toggleDarkMode();

  /// Toggles whether the user is asked to confirm before deleting a todo.
  ///
  /// Returns the new value, or `null` if it was not saved.
  Future<bool?> toggleDeletionConfirmation();
}
