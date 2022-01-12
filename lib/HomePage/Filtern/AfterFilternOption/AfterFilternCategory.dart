class AfterFilternCategory {
  int? userId;
  String? filterCategorytxt;
  bool? isChecked;
  AfterFilternCategory({this.userId, this.filterCategorytxt, this.isChecked});
  static List<AfterFilternCategory> getFilternName() {
    return <AfterFilternCategory>[
      AfterFilternCategory(
          userId: 1, filterCategorytxt: 'Vegan', isChecked: false),
      AfterFilternCategory(
          userId: 2, filterCategorytxt: 'Glutenfrei', isChecked: false),
      AfterFilternCategory(
          userId: 3, filterCategorytxt: 'Low carb', isChecked: false),
      AfterFilternCategory(
          userId: 4, filterCategorytxt: 'Keto', isChecked: false),
      AfterFilternCategory(
          userId: 5, filterCategorytxt: 'Vegetarisch', isChecked: false),
      AfterFilternCategory(
          userId: 6, filterCategorytxt: 'Prescetaria', isChecked: false),
      AfterFilternCategory(
          userId: 7, filterCategorytxt: 'Low Fat', isChecked: false),
      AfterFilternCategory(
          userId: 8, filterCategorytxt: 'Low Sugar', isChecked: false),
    ];
  }
}
