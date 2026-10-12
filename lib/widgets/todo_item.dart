import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/todo.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';

/// Displays a single [Todo] item.
class TodoItem extends ConsumerWidget {
  /// Creates a widget that displays the given [item].
  const TodoItem(this.item, {super.key});

  /// The todo to display.
  final Todo item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.watch(refAppState.notifier);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
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
    );
  }
}
