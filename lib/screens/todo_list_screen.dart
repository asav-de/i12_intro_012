import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';
import 'package:i12_into_012/screens/settings_screen.dart';
import 'package:i12_into_012/widgets/add_todo_dialog.dart';
import 'package:i12_into_012/widgets/todo_item.dart';

/// Main screen that shows all todos and lets the user toggle their status.
class TodoListScreen extends ConsumerWidget {
  /// Creates a [TodoListScreen].
  const TodoListScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.watch(refAppState.notifier);
    final appState = ref.watch(refAppState);
    final todos = appState.todos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<dynamic>(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          for (final todo in todos) TodoItem(todo, key: ValueKey(todo.id)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final text = await showDialog<String>(
            context: context,
            builder: (context) => const AddTodoDialog(),
          );
          if (text != null) {
            appStateNotifier.addTodo(text);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
