import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

/// Represents an immutable todo item with a unique [id], [text] content,
/// and completion status [isCompleted].
@freezed
abstract class Todo with _$Todo {
  /// Creates a [Todo] with the given values.
  const factory Todo({
    /// Unique identifier of the todo.
    required String id,

    /// Content of the todo.
    required String text,

    /// Whether the todo is completed.
    @Default(false) bool isCompleted,
  }) = _Todo;

  /// Creates a [Todo] from a JSON map.
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
