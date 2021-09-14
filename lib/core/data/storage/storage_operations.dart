abstract class StorageRead {
  Future<String?> read(String key);
}

abstract class StorageSave {
  Future<void> save({required String key, required String value});
}

abstract class StorageDelete {
  Future<void> delete(String key);
}
