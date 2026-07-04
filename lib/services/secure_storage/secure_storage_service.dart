import 'dart:async';

import 'package:flutter_core_package/log/log.dart';
import 'package:flutter_core_package/services/secure_storage/i_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService implements IStorageService {
  FlutterSecureStorage? _secureStorage;

  final Completer<FlutterSecureStorage> initCompleter = Completer<FlutterSecureStorage>();

  @override
  void init() {
    initCompleter.complete(const FlutterSecureStorage(aOptions: AndroidOptions()));
  }

  @override
  bool get hasInitialized => _secureStorage != null;

  @override
  Future<Object?> get(String key) async {
    try {
      _secureStorage = await initCompleter.future;
      final result = await _secureStorage?.read(key: key);
      'Successfully read from secure storage'.log(tag: 'SecureStorageService - get', level: LogLevel.trace);
      return result;
    } catch (e) {
      e.log(tag: 'SecureStorageService - get', level: LogLevel.error);
      rethrow;
    }
  }

  @override
  Future<void> clear() async {
    try {
      _secureStorage = await initCompleter.future;
      await _secureStorage?.deleteAll();
      'Successfully cleared secure storage'.log(tag: 'SecureStorageService - clear', level: LogLevel.trace);
    } catch (e) {
      e.log(tag: 'SecureStorageService - clear', level: LogLevel.error);
      rethrow;
    }
  }

  @override
  Future<bool> has(String key) async {
    try {
      _secureStorage = await initCompleter.future;
      final result = await _secureStorage?.containsKey(key: key) ?? false;
      'Successfully checked key existence in secure storage: $key = $result'.log(
        tag: 'SecureStorageService - has',
        level: LogLevel.trace,
      );
      return result;
    } catch (e) {
      e.log(tag: 'SecureStorageService - has', level: LogLevel.error);
      rethrow;
    }
  }

  @override
  Future<bool> remove(String key) async {
    try {
      _secureStorage = await initCompleter.future;
      await _secureStorage?.delete(key: key);
      'Successfully removed key from secure storage'.log(tag: 'SecureStorageService - remove', level: LogLevel.trace);
      return true;
    } catch (e) {
      e.log(tag: 'SecureStorageService - remove', level: LogLevel.error);
      rethrow;
    }
  }

  @override
  Future<bool> set(String key, String data) async {
    try {
      _secureStorage = await initCompleter.future;
      await _secureStorage?.write(key: key, value: data);
      'Successfully wrote to secure storage'.log(tag: 'SecureStorageService - set', level: LogLevel.trace);
      return true;
    } catch (e) {
      e.log(tag: 'SecureStorageService - set', level: LogLevel.error);
      rethrow;
    }
  }
}
