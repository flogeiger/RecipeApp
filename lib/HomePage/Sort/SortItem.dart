import 'package:flutter/material.dart';
import 'Sort.dart';

class FilterItem extends StatefulWidget {
  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  int selectedRadio;
  Sort selectedSort;
  List<Sort> listsort;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    listsort = Sort.getSortName();
  }

  setselectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelcetedUser(Sort sort) {
    setState(() {
      selectedSort = sort;
    });
  }

  List<Widget> createRadioListSort() {
    List<Widget> widgets = [];
    for (Sort sortName in listsort) {
      widgets.add(
        RadioListTile(
          activeColor: Theme.of(context).secondaryHeaderColor,
          value: sortName,
          groupValue: selectedSort,
          onChanged: (currentUser) {
            setSelcetedUser(currentUser);
          },
          selected: selectedSort == sortName,
          title: Text(
            sortName.sorttxt,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: createRadioListSort(),
      ),
    );
  }
}
