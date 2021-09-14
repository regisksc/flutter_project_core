import '../../../exports/exports.dart';
import '../../storage/local_storage.dart';

// ignore_for_file: avoid_print
class LocalDatasource implements LocalStorage {
  factory LocalDatasource([FlutterSecureStorage? storage]) {
    _storage = const FlutterSecureStorage();
    if (storage != null) _storage = storage;
    return _instance;
  }
  LocalDatasource._privateConstructor();
  static late FlutterSecureStorage _storage;

  static final LocalDatasource _instance = LocalDatasource._privateConstructor();

  @override
  Future<void> save({required String key, required String value}) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      print('\n AN ERROR OCURRED WHEN SAVING key: $key for value: $value');
    }
  }

  @override
  Future<String?> read(String key) async {
    final keyExists = await _storage.containsKey(key: key);
    return keyExists ? _storage.read(key: key) : null;
  }

  @override
  Future<void> delete(String key) async {
    final keyExists = await _storage.containsKey(key: key);
    if (keyExists) _storage.delete(key: key);
  }
}
