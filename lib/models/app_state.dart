import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:i12_into_012/models/todo.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

/// Represents the immutable global state of the app: the list of [todos],
/// the theme setting [isDarkMode], and whether to [askForDeletionConfirmation]
/// before deleting a todo.
@freezed
abstract class AppState with _$AppState {
  /// Creates an [AppState] with the given values.
  const factory AppState({
    /// List of todo items.
    required List<Todo> todos,

    /// Whether the dark theme is enabled.
    required bool isDarkMode,

    /// Whether the user is asked to confirm before deleting a todo.
    required bool askForDeletionConfirmation,
  }) = _AppState;

  /// Creates an [AppState] from a JSON map.
  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
