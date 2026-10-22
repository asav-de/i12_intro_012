import 'package:flutter/material.dart';

/// Dialog that lets the user enter the text of a new todo.
///
/// Returns the entered text when "Add" is pressed, or `null` on "Cancel".
class AddTodoDialog extends StatefulWidget {
  /// Creates the [AddTodoDialog].
  const AddTodoDialog({super.key});

  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Todo'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Enter todo text'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_controller.text);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
