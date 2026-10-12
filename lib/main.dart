import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';
import 'package:i12_into_012/screens/todo_list_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/// Root widget of the app that applies the light or dark theme
/// based on the current app state.
class MyApp extends ConsumerWidget {
  /// Creates the root widget of the app.
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(refAppState);
    return Builder(
      builder: (context) {
        return MaterialApp(
          title: 'ToDo-App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: appState.isDarkMode
                  ? Brightness.dark
                  : Brightness.light,
            ),
          ),
          home: const TodoListScreen(),
        );
      },
    );
  }
}
