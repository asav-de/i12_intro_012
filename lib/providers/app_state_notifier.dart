import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';
import 'package:i12_into_012/providers/local_json_notifier.dart';

final NotifierProvider<AppStateNotifier, AppState> refAppState =
    NotifierProvider<AppStateNotifier, AppState>(LocalJsonNotifier.new);

abstract class AppStateNotifier extends Notifier<AppState> {
  Future<Todo?> addTodo(String text);

  Future<Todo?> toggleTodo(Todo todo);

  Future<int> deleteTodos(Set<String> ids);

  Future<bool?> toggleDarkMode();

  Future<bool?> toggleDeletionConfirmation();
}
