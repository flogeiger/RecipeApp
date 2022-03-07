class CaloriesFilterCategory {
  int? userId;
  String? filterCategorytxt;
  bool? isChecked;
  CaloriesFilterCategory({this.userId, this.filterCategorytxt, this.isChecked});
  static List<CaloriesFilterCategory> getFilterCalories() {
    return <CaloriesFilterCategory>[
      CaloriesFilterCategory(
          userId: 1, filterCategorytxt: 'Muss mir', isChecked: false),
      CaloriesFilterCategory(
          userId: 2, filterCategorytxt: 'noch', isChecked: false),
      CaloriesFilterCategory(
          userId: 3, filterCategorytxt: 'etwas', isChecked: false),
      CaloriesFilterCategory(
          userId: 4, filterCategorytxt: 'überlegen', isChecked: false),
      CaloriesFilterCategory(
          userId: 5, filterCategorytxt: 'will', isChecked: false),
      CaloriesFilterCategory(
          userId: 6, filterCategorytxt: 'mich', isChecked: false),
      CaloriesFilterCategory(
          userId: 7, filterCategorytxt: 'Selbständig', isChecked: false),
      CaloriesFilterCategory(
          userId: 8, filterCategorytxt: 'machen!', isChecked: false),
    ];
  }
}
