import 'package:flutter/animation.dart';
import 'package:sample/utils/Constant.dart';

class RecipeTypFilternCategory {
  int? userId;
  String? filterCategorytxt;
  bool? isChecked;
  RecipeTypFilternCategory(
      {this.userId, this.filterCategorytxt, this.isChecked});
  static List<RecipeTypFilternCategory> getFilterRecipeTyp() {
    return <RecipeTypFilternCategory>[
      RecipeTypFilternCategory(
          userId: 1, filterCategorytxt: Constant.vegan, isChecked: false),
      RecipeTypFilternCategory(
          userId: 2, filterCategorytxt: Constant.glutenfrei, isChecked: false),
      RecipeTypFilternCategory(
          userId: 3, filterCategorytxt: Constant.lowcarb, isChecked: false),
      RecipeTypFilternCategory(
          userId: 4, filterCategorytxt: Constant.keto, isChecked: false),
      RecipeTypFilternCategory(
          userId: 5, filterCategorytxt: Constant.vegetarisch, isChecked: false),
      RecipeTypFilternCategory(
          userId: 6, filterCategorytxt: Constant.prescetaria, isChecked: false),
      RecipeTypFilternCategory(
          userId: 7, filterCategorytxt: Constant.lowFat, isChecked: false),
      RecipeTypFilternCategory(
          userId: 8, filterCategorytxt: Constant.lowsugar, isChecked: false),
    ];
  }
}
