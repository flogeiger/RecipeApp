import 'FilternCategory.dart';
import 'package:sample/HomePage/Filtern/AfterFilternOption/AfterFilterCategoryPage.dart';
import 'package:flutter/material.dart';

class FilterCategoryItem extends StatefulWidget {
  @override
  _FilterCategoryItemState createState() => _FilterCategoryItemState();
}

class _FilterCategoryItemState extends State<FilterCategoryItem> {
  FilternCategory selectedFiltern;
  List<FilternCategory> listFiltern;
  @override
  void initState() {
    super.initState();
    listFiltern = FilternCategory.getFilternName();
  }

  List<Widget> createRadioListFiltern() {
    List<Widget> widgets = [];
    bool gotTap = false;
    for (FilternCategory sortName in listFiltern) {
      widgets.add(
        Container(
          height: 40,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                sortName.filterCategorytxt,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ],
          ),
          color: gotTap == false ? Colors.white : Colors.red,
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: createRadioListFiltern(),
      ),
    );
  }
}
