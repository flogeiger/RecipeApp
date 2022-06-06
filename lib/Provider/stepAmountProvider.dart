import 'package:flutter/cupertino.dart';

class StepAmountProvider extends ChangeNotifier {
  int stepcount;
  StepAmountProvider({
    this.stepcount = 0,
  });
  void changeStepCount(int newVal) {
    stepcount = newVal;
    notifyListeners();
  }
}
