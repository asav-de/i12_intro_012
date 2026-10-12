import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';

/// Persists and restores the [AppState].
class StorageService {
  /// Saves the given [state] to storage.
  void saveAppState(AppState state) {}

  /// Loads the [AppState] from storage.
  AppState loadAppState() => const AppState(
    todos: [
      Todo(id: '1', text: 'Todo from Json'), // Todo
      Todo(
        id: '2',
        text: 'Todo planen',
        isCompleted: true,
      ),
    ],
    isDarkMode: false,
    askForDeletionConfirmation: false,
  );
}
