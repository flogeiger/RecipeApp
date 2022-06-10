import 'package:flutter/cupertino.dart';

class CookingRecipesMonthAmountProvider extends ChangeNotifier {
  int cookingcount;
  CookingRecipesMonthAmountProvider({
    this.cookingcount = 0,
  });
  void changeCookingCount(int newVal) {
    cookingcount = newVal;
    notifyListeners();
  }
}
