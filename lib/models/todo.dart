class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  Todo({required this.id, required this.text, required this.isCompleted});

  Map<String, dynamic> toJson() => {};

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: 0,
    text: '',
    isCompleted: false,
  );

  Todo copyWidth({
    int? id,
    String? text,
    bool? isCompleted,
  }) => Todo(
    id: id ?? this.id,
    text: text ?? this.text,
    isCompleted: isCompleted ?? this.isCompleted,
  );
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
