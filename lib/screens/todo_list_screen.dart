import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';
import 'package:i12_into_012/screens/settings_screen.dart';
import 'package:i12_into_012/widgets/add_todo_dialog.dart';
import 'package:i12_into_012/widgets/delete_confirmation_dialog.dart';
import 'package:i12_into_012/widgets/todo_item.dart';

/// Main screen that shows all todos and lets the user toggle their status.
class TodoListScreen extends ConsumerStatefulWidget {
  /// Creates a [TodoListScreen].
  const TodoListScreen({super.key});

  @override
  ConsumerState<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends ConsumerState<TodoListScreen> {
  final Set<String> _selectedIds = <String>{};

  void _toggleSelection(String id) {
    setState(
      () {
        _selectedIds.contains(id)
            ? _selectedIds.remove(id)
            : _selectedIds.add(id);
      },
    );
  }

  void _clearSelection() {
    setState(
      _selectedIds.clear,
    );
  }

  Future<void> _deleteSelected() async {
    if (ref.read(refAppState).askForDeletionConfirmation) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => const DeleteConfirmationDialog(),
      );
      if (confirmed != true || !mounted) return;
    }
    ref.read(refAppState.notifier).deleteTodos({..._selectedIds});
    _clearSelection();
  }

  @override
  Widget build(BuildContext context) {
    final appStateNotifier = ref.watch(refAppState.notifier);
    final appState = ref.watch(refAppState);
    final todos = appState.todos;

    return Scaffold(
      appBar: AppBar(
        leading: _selectedIds.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: _clearSelection,
              )
            : null,
        title: _selectedIds.isNotEmpty
            ? Text('${_selectedIds.length} selected')
            : const Text('Todo List Screen'),
        actions: [
          if (_selectedIds.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _deleteSelected,
            )
          else
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
          for (final todo in todos)
            TodoItem(
              item: todo,
              key: ValueKey(todo.id),
              isSelected: _selectedIds.contains(todo.id),
              onLongPress: () => _toggleSelection(todo.id),
              onTap: _selectedIds.isNotEmpty
                  ? () => _toggleSelection(todo.id)
                  : null,
            ),
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
