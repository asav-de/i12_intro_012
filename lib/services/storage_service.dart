import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';

class StorageService {
  void SaveAppState(AppState state) {}

  AppState loadAppState() => AppState(
    todos: [
      Todo(id: 1, text: 'Todo from Json', isCompleted: false), // Todo
      Todo(
        id: 2,
        text: 'Todo planen',
        isCompleted: true,
      ),
    ],
    isDarkMode: false,
    askForDeletionConfirmation: false,
  );
}
