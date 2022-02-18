class TimeFilterCategory {
  int? userId;
  String? filterCategorytxt;
  bool? isChecked;
  TimeFilterCategory({this.userId, this.filterCategorytxt, this.isChecked});
  static List<TimeFilterCategory> getFilterCategory() {
    return <TimeFilterCategory>[
      TimeFilterCategory(
          userId: 1, filterCategorytxt: '0 - 10 min', isChecked: false),
      TimeFilterCategory(
          userId: 2, filterCategorytxt: '10 - 20 min', isChecked: false),
      TimeFilterCategory(
          userId: 3, filterCategorytxt: '20 - 30 min', isChecked: false),
      TimeFilterCategory(
          userId: 4, filterCategorytxt: '30 - 40 min', isChecked: false),
      TimeFilterCategory(
          userId: 5, filterCategorytxt: '40 - 50 min', isChecked: false),
      TimeFilterCategory(
          userId: 6, filterCategorytxt: '50 - 60 min', isChecked: false),
      TimeFilterCategory(
          userId: 7, filterCategorytxt: 'über 60 min', isChecked: false),
    ];
  }
}
