
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/utils.dart';

class PrefUtil {
  static PrefUtil? _instance;
  static SharedPreferences? _preferences;

  PrefUtil._();

  static Future<PrefUtil> getInstance() async {
    if (_instance == null) {
      _instance = PrefUtil._();
      await _instance!._init();
    }
    return _instance!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static const String counterIdKey = 'counterId';


  static String? getCounterId() {
    return catchException(() => _preferences!.getString(counterIdKey)??'');
  }

  static Future<bool> setCounterId(String counterId) {
    return catchException(
            () => _preferences!.setString(counterIdKey, counterId)) ??
        Future.value(false);
  }



}