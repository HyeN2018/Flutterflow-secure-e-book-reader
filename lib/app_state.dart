import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _version = await secureStorage.getString('ff_version') ?? _version;
    });
    await _safeInitAsync(() async {
      _lastkey = await secureStorage.getString('ff_lastkey') ?? _lastkey;
    });
    await _safeInitAsync(() async {
      _discordname =
          await secureStorage.getString('ff_discordname') ?? _discordname;
    });
    await _safeInitAsync(() async {
      _userinfo = await secureStorage.getStringList('ff_userinfo') ?? _userinfo;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _version = '1.0.0';
  String get version => _version;
  set version(String _value) {
    _version = _value;
    secureStorage.setString('ff_version', _value);
  }

  void deleteVersion() {
    secureStorage.delete(key: 'ff_version');
  }

  String _ip = '';
  String get ip => _ip;
  set ip(String _value) {
    _ip = _value;
  }

  String _lastkey = '';
  String get lastkey => _lastkey;
  set lastkey(String _value) {
    _lastkey = _value;
    secureStorage.setString('ff_lastkey', _value);
  }

  void deleteLastkey() {
    secureStorage.delete(key: 'ff_lastkey');
  }

  List<String> _deviceInfo = ['Model', 'Brand', 'Version'];
  List<String> get deviceInfo => _deviceInfo;
  set deviceInfo(List<String> _value) {
    _deviceInfo = _value;
  }

  void addToDeviceInfo(String _value) {
    _deviceInfo.add(_value);
  }

  void removeFromDeviceInfo(String _value) {
    _deviceInfo.remove(_value);
  }

  void removeAtIndexFromDeviceInfo(int _index) {
    _deviceInfo.removeAt(_index);
  }

  void updateDeviceInfoAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _deviceInfo[_index] = updateFn(_deviceInfo[_index]);
  }

  String _discordname = '';
  String get discordname => _discordname;
  set discordname(String _value) {
    _discordname = _value;
    secureStorage.setString('ff_discordname', _value);
  }

  void deleteDiscordname() {
    secureStorage.delete(key: 'ff_discordname');
  }

  List<String> _userinfo = ['user_id', 'stages', 'expiry_date'];
  List<String> get userinfo => _userinfo;
  set userinfo(List<String> _value) {
    _userinfo = _value;
    secureStorage.setStringList('ff_userinfo', _value);
  }

  void deleteUserinfo() {
    secureStorage.delete(key: 'ff_userinfo');
  }

  void addToUserinfo(String _value) {
    _userinfo.add(_value);
    secureStorage.setStringList('ff_userinfo', _userinfo);
  }

  void removeFromUserinfo(String _value) {
    _userinfo.remove(_value);
    secureStorage.setStringList('ff_userinfo', _userinfo);
  }

  void removeAtIndexFromUserinfo(int _index) {
    _userinfo.removeAt(_index);
    secureStorage.setStringList('ff_userinfo', _userinfo);
  }

  void updateUserinfoAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _userinfo[_index] = updateFn(_userinfo[_index]);
    secureStorage.setStringList('ff_userinfo', _userinfo);
  }

  int _selectedresource = 0;
  int get selectedresource => _selectedresource;
  set selectedresource(int _value) {
    _selectedresource = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
