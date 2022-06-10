import 'package:flutter/cupertino.dart';

class StepMonthAmountProvider extends ChangeNotifier {
  int stepcount;
  StepMonthAmountProvider({
    this.stepcount = 0,
  });
  void changeStepCount(int newVal) {
    stepcount = newVal;
    notifyListeners();
  }
}
