import 'package:flutter/material.dart';
import 'package:sample/RecipesPage/Filtern/TimeFilter/TimeFilterCategory.dart';

class TimeFilterListview extends StatefulWidget {
  List<TimeFilterCategory> filterList;
  Function callback;
  TimeFilterListview(this.filterList, this.callback);
  @override
  State<TimeFilterListview> createState() => _TimeFilterListviewState();
}

class _TimeFilterListviewState extends State<TimeFilterListview> {
  void itemChange(bool val, int index) {
    setState(() {
      widget.filterList[index].isChecked = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: widget.filterList.length,
      itemBuilder: (BuildContext cxt, index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                CheckboxListTile(
                    activeColor: Theme.of(context).secondaryHeaderColor,
                    dense: true,
                    selected: widget.filterList[index].isChecked!,
                    value: widget.filterList[index].isChecked,
                    title: new Text(
                      widget.filterList[index].smalval.toString() +
                          ' - ' +
                          widget.filterList[index].bigval.toString() +
                          ' min',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? val) {
                      widget.callback(val!, index);
                      itemChange(val, index);
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
