import 'package:flutter/cupertino.dart';

class LoginMonthAmountProvider extends ChangeNotifier {
  int logincount;
  LoginMonthAmountProvider({
    this.logincount = 0,
  });
  void changLoginCount(int newVal) {
    logincount = newVal;
    notifyListeners();
  }
}
