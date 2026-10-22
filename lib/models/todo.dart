import 'package:meta/meta.dart';

/// Represents an immutable todo item with a unique [id], [text] content,
/// and completion status [isCompleted].
@immutable
class Todo {
  /// Unique identifier of the todo.
  final String id;

  /// Content of the todo.
  final String text;

  /// Whether the todo is completed.
  final bool isCompleted;

  /// Creates a [Todo] with the given values.
  const Todo({
    required this.id,
    required this.text,
    this.isCompleted = false,
  });

  /// Converts this [Todo] to a JSON map for storage.
  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'isCompleted': isCompleted,
  };

  /// Creates a [Todo] from a JSON map.
  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json['id'] as String,
    text: json['text'] as String,
    isCompleted: json['isCompleted'] as bool,
  );

  /// Returns a copy of this [Todo] with the given fields replaced.
  ///
  /// Fields that are not provided keep their current values.
  Todo copyWith({
    String? id,
    String? text,
    bool? isCompleted,
  }) => Todo(
    id: id ?? this.id,
    text: text ?? this.text,
    isCompleted: isCompleted ?? this.isCompleted,
  );

  @override
  bool operator ==(Object other) =>
      other is Todo &&
      id == other.id &&
      text == other.text &&
      isCompleted == other.isCompleted;

  @override
  int get hashCode => Object.hash(id, text, isCompleted);
}

/*
#### Todo
- Properties:
  - `id (int)`: Unique identifier (randomly generated UUID)
  - `text (String)`: Todo content
  - `isCompleted (bool)`: Completion status
- Methods:
  - `toJson()`: Convert to JSON for storage (returns `Map<String, dynamic>`)
  - `fromJson()`: Create Todo from JSON (factory constructor)
  - `copyWith()`: Create a copy with modified properties (returns `Todo`)

- Make it immutable.
- Use uuid package (already added) to generate unique IDs.
- Do not forget to implement equality and hashCode.
*/
