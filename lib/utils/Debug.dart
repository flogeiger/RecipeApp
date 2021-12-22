import 'dart:developer';

class Debug {
  static const DEBUG = true;
  static const STORE_RES_IN_PREF = true;

  static printLog(String input) {
    if (DEBUG) log(input);
  }
}
