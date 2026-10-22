import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/providers/app_state_notifier.dart';

/// Screen with app settings, such as the dark mode switch.
class SettingsScreen extends ConsumerWidget {
  /// Creates the [SettingsScreen].
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(refAppState);
    final appStateNotifier = ref.watch(refAppState.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings screen'),
      ),
      body: Column(
        children: [
          Container(
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
                const Expanded(
                  child: Text('DarkMode'),
                ),
                Switch(
                  value: appState.isDarkMode,
                  onChanged: (isDarkMode) {
                    appStateNotifier.toggleDarkMode();
                  },
                ),
              ],
            ),
          ),
          Container(
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
                const Expanded(
                  child: Text(
                    'Soll vor dem Löschen einer Aufgabe eine Bestätigung abgefragt werden?',
                  ),
                ),
                Switch(
                  value: appState.askForDeletionConfirmation,
                  onChanged: (askForDeletionConfirmation) {
                    appStateNotifier.toggleDeletionConfirmation();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
