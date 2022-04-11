import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const String FirstTime_Loggin = "FirstTime_Loggin";

  static const String IS_REMINDER_ON = "IS_REMINDER_ON";
  static const String IS_DISTANCE_INDICATOR_ON = "IS_DISTANCE_INDICATOR_ON";
  static const String TARGETVALUE_FOR_DISTANCE_IN_KM =
      "TARGETVALUE_FOR_DISTANCE_IN_KM";
  static const String TARGETVALUE_FOR_RUNTIME = "TARGETVALUE_FOR_RUNTIME";
  static const String TARGETVALUE_FOR_WALKTIME = "TARGETVALUE_FOR_WALKTIME";
  static const String SLIDER_VALUE = "SLIDER_VALUE";
  static const String IS_KM_SELECTED = "IS_KM_SELECTED";
  static const String START_TIME_REMINDER = "START_TIME_REMINDER";
  static const String DAILY_REMINDER_TIME = "DAILY_REMINDER_TIME";
  static const String DAILY_REMINDER_REPEAT_DAY = "DAILY_REMINDER_REPEAT_DAY";
  static const String IS_DAILY_REMINDER_ON = "IS_DAILY_REMINDER_ON";
  static const String profileImage = "imageofProfile";

  static const String gender = "gender";
  static const String issortedFav = "sortedFav";
  static const String issorted = "sorted";
  static const String isfilterdFav = "filteredFav";
  static const String isfilterd = "filtered";
  static const String height = "height";
  static const String weight = "weight";
  static const String email = "E-mail";
  static const String stepscurrentcount = "currentcountsteps";
  static const String stepsgoal = "stepsgoal";
  static const String name = "name";
  static const String OLD_DISTANCE = "OLD_DISTANCE";
  static const String OLD_CALORIES = "OLD_CALORIES";
  static const String DATE = "DATE";
  static const String IS_PAUSE = "IS_PAUSE";
  static const String DURATION = "DURATION";

  static const String checkChallengePage = "checkChallengePage";
  static const String percentageindicatorsteps = "percentageindicator";

  static final Preference _preference = Preference._internal();

  factory Preference() {
    return _preference;
  }

  Preference._internal();

  static Preference get shared => _preference;

  static SharedPreferences? _pref;

  Future<SharedPreferences?> instance() async {
    if (_pref != null) return _pref;
    await SharedPreferences.getInstance().then((onValue) {
      _pref = onValue;
    }).catchError((onError) {
      _pref = null;
    });

    return _pref;
  }

  String? getString(String key) {
    return _pref!.getString(key);
  }

  Future<bool> setString(String key, String value) {
    return _pref!.setString(key, value);
  }

  int? getInt(String key) {
    return _pref!.getInt(key);
  }

  Future<bool> setInt(String key, int value) {
    return _pref!.setInt(key, value);
  }

  bool? getBool(String key) {
    return _pref!.getBool(key);
  }

  Future<bool> setBool(String key, bool value) {
    return _pref!.setBool(key, value);
  }

  double? getDouble(String key) {
    return _pref!.getDouble(key);
  }

  Future<bool> setDouble(String key, double value) {
    return _pref!.setDouble(key, value);
  }

  Future<bool> remove(key, [multi = false]) async {
    SharedPreferences? pref = await instance();
    if (multi) {
      key.forEach((f) async {
        return await pref!.remove(f);
      });
    } else {
      return await pref!.remove(key);
    }

    return new Future.value(true);
  }
}
