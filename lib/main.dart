import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/providers/app_state_notivier.dart';
import 'package:i12_into_012/screens/todo_list_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
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
          home: TodoListScreen(),
        );
      },
    );
  }
}
