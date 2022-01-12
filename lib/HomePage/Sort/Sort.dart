class Sort {
  int? userId;
  String? sorttxt;
  Sort({this.userId, this.sorttxt});
  static List<Sort> getSortName() {
    return <Sort>[
      Sort(userId: 1, sorttxt: 'Neustes'.toUpperCase()),
      Sort(userId: 2, sorttxt: 'Am Beliebtesten'.toUpperCase()),
      Sort(userId: 3, sorttxt: 'Schnellsten'.toUpperCase()),
      Sort(userId: 4, sorttxt: 'Einfachsten'.toUpperCase()),
    ];
  }
}
