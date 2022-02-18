class RecipeTypFilternCategory {
  int? userId;
  String? filterCategorytxt;
  bool? isChecked;
  RecipeTypFilternCategory(
      {this.userId, this.filterCategorytxt, this.isChecked});
  static List<RecipeTypFilternCategory> getFilterRecipeTyp() {
    return <RecipeTypFilternCategory>[
      RecipeTypFilternCategory(
          userId: 1, filterCategorytxt: 'Vegan', isChecked: false),
      RecipeTypFilternCategory(
          userId: 2, filterCategorytxt: 'Glutenfrei', isChecked: false),
      RecipeTypFilternCategory(
          userId: 3, filterCategorytxt: 'Low carb', isChecked: false),
      RecipeTypFilternCategory(
          userId: 4, filterCategorytxt: 'Keto', isChecked: false),
      RecipeTypFilternCategory(
          userId: 5, filterCategorytxt: 'Vegetarisch', isChecked: false),
      RecipeTypFilternCategory(
          userId: 6, filterCategorytxt: 'Prescetaria', isChecked: false),
      RecipeTypFilternCategory(
          userId: 7, filterCategorytxt: 'Low Fat', isChecked: false),
      RecipeTypFilternCategory(
          userId: 8, filterCategorytxt: 'Low Sugar', isChecked: false),
    ];
  }
}
