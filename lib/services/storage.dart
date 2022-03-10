import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_id/core/config/app_config.dart';

// ignore: avoid_classes_with_only_static_members
class StorageServices {
  static String? _decode;
  static SharedPreferences? _preferences;

  // final _storage = const FlutterSecureStorage();

  // Future<String>? readSecure(String key) async {

  //   String? res = await _storage.read(key: key);
  //   return res != null ? res : '';
  // }

  // Future<void> writeSecure(String key, String value) async {
  //   await _storage.write(key: key, value: value);
  // }

  // Future<void> clearKeySecure(String key) async {
  //   await _storage.delete(key: key);
  // }

  // Future<void> clearSecure() async {
  //   await _storage.deleteAll();
  // }

  Future<void> clearStorage() async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences!.clear();
  }

  static Future<SharedPreferences> storeData(dynamic _data, String _path) async {
    try {

      _preferences = await SharedPreferences.getInstance();
      _decode = jsonEncode(_data);
      _preferences!.setString(_path, _decode!);
    } catch (e){
      print("Error storeData $e");
    }
    return _preferences!;
  }

  static Future<SharedPreferences> addMoreData(Map<String, dynamic> _data, String _path) async {
    List<Map<String, dynamic>> ls = [];
    _preferences = await SharedPreferences.getInstance();
    if (_preferences!.containsKey(_path)) {
      final _dataString = _preferences!.getString(_path);

      ls = List<Map<String, dynamic>>.from(jsonDecode(_dataString!) as List);
      ls.add(_data);
    } else {
      ls.add(_data);
    }

    _decode = jsonEncode(ls);
    _preferences!.setString(_path, _decode!);
    return _preferences!;
  }

  // ignore: avoid_positional_boolean_parameters
  static Future<void> saveBool(String key, bool value) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences!.setBool(key, value);
  }

  static Future<bool>? readBool(String key) async {
    _preferences = await SharedPreferences.getInstance();
    final res = _preferences!.getBool(key);

    return res!;
  }

  static Future<dynamic> fetchData(String _path) async {
    _preferences = await SharedPreferences.getInstance();

    final _data = _preferences!.getString(_path);

    if (_data == null) {
      return null;
    } else {
      return json.decode(_data);
    }
  }

  static Future<void> removeKey(String path) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences!.remove(path);
  }

  static Future<Map?> getSeeds(String? seedType) async {
    _preferences = await SharedPreferences.getInstance();
    String? value = await _preferences!.getString('wallet_seed_$seedType');
    if (value != null) {
      return jsonDecode(value);
    }
    return {};
  }
}
