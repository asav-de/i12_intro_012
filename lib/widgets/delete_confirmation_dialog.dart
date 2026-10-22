import 'package:flutter/material.dart';

/// Dialog that asks the user to confirm deleting the selected todos.
///
/// Returns `true` when "Delete" is pressed, or `false` on "Cancel".
class DeleteConfirmationDialog extends StatelessWidget {
  /// Creates the [DeleteConfirmationDialog].
  const DeleteConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Deletion'),
      content: const Text(
        'Are you sure you want to delete the selected items?',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
