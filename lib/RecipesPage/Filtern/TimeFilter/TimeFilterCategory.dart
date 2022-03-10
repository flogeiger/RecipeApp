class TimeFilterCategory {
  bool? isChecked;
  int? bigval, smalval;
  TimeFilterCategory.fromJson(Map<String, dynamic> parsedJSON)
      : isChecked = parsedJSON['ischecked'],
        bigval = parsedJSON['bigval'],
        smalval = parsedJSON['smalval'];
  TimeFilterCategory({this.isChecked, this.bigval, this.smalval});
}
