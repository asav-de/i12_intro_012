import 'dart:convert';
import 'dart:io';
import 'package:i12_into_012/models/app_state.dart';
import 'package:path_provider/path_provider.dart';

/// Persists and restores the [AppState].
class StorageService {
  /// JSON file in the app documents directory that holds the saved state.
  Future<File> get _file async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/todo_app_state.json');
  }

  /// Saves the given [state] to storage.
  Future<void> saveAppState(AppState state) async {
    final file = await _file;
    final json = jsonEncode(state.toJson());
    await file.writeAsString(json);
  }

  /// Loads the [AppState] from storage, or `null` if nothing was saved yet.
  Future<AppState?> loadAppState() async {
    final file = await _file;
    if (!file.existsSync()) return null;
    final json = await file.readAsString();
    return AppState.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }
}
