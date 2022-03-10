class RecipeTypFilternCategory {
  String? filterCategorytxt;
  bool? isChecked;
  RecipeTypFilternCategory.fromJson(Map<String, dynamic> parsedJSON)
      : isChecked = parsedJSON['ischecked'],
        filterCategorytxt = parsedJSON['filtercat'];
  RecipeTypFilternCategory({this.filterCategorytxt, this.isChecked});
  //static List<RecipeTypFilternCategory> getFilterRecipeTyp() {
  //return <RecipeTypFilternCategory>[
  //RecipeTypFilternCategory(
  //userId: 1, filterCategorytxt: Constant.vegan, isChecked: false),
  //RecipeTypFilternCategory(
  //userId: 2, filterCategorytxt: Constant.glutenfrei, isChecked: false),
  //RecipeTypFilternCategory(
  //userId: 3, filterCategorytxt: Constant.lowcarb, isChecked: false),
  //RecipeTypFilternCategory(
  //userId: 4, filterCategorytxt: Constant.keto, isChecked: false),
  //RecipeTypFilternCategory(
  //userId: 5, filterCategorytxt: Constant.vegetarisch, isChecked: false),
  //RecipeTypFilternCategory(
  //userId: 6, filterCategorytxt: Constant.prescetaria, isChecked: false),
  //RecipeTypFilternCategory(
  //userId: 7, filterCategorytxt: Constant.lowFat, isChecked: false),
  //RecipeTypFilternCategory(
  //userId: 8, filterCategorytxt: Constant.lowsugar, isChecked: false),
  //];
  //}
}
