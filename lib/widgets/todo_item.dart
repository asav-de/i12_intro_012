import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/todo.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';

/// Displays a single [Todo] item.
class TodoItem extends ConsumerWidget {
  /// Creates a widget that displays the given [item].
  const TodoItem({
    required this.item,
    this.isSelected = false,
    this.onTap,
    this.onLongPress,
    super.key,
  });

  /// The todo to display.
  final Todo item;

  /// Whether the todo is currently selected for deletion.
  final bool isSelected;

  /// Called when the todo is tapped.
  final VoidCallback? onTap;

  /// Called when the todo is long-pressed.
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.watch(refAppState.notifier);

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : null,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            Expanded(child: Text(item.text)),
            Checkbox(
              value: item.isCompleted,
              onChanged: (_) {
                appStateNotifier.toggleTodo(item);
              },
            ),
          ],
        ),
      ),
    );
  }
}
