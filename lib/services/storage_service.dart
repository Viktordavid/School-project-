import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  late FlutterSecureStorage _store;

  StorageService({FlutterSecureStorage? store}) {
    _store = store ?? FlutterSecureStorage();
  }

  Future<bool> write(String value, String key) async {
    try {
      await _store.write(key: key, value: value);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> read(String key) async {
    try {
      return await _store.read(key: key);
    } catch (e) {
      print(e);
    }
  }
}
