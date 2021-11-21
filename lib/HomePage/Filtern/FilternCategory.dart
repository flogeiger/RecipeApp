class FilternCategory {
  int userId;
  String filterCategorytxt;
  FilternCategory({this.userId, this.filterCategorytxt});
  static List<FilternCategory> getFilternName() {
    return <FilternCategory>[
      FilternCategory(userId: 1, filterCategorytxt: 'Kalorien'),
      FilternCategory(userId: 2, filterCategorytxt: 'Diättyp'),
      FilternCategory(userId: 3, filterCategorytxt: 'Zeit'),
    ];
  }
}
