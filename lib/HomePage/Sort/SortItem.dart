import 'package:flutter/material.dart';
import 'package:sample/HomePage/HomePage.dart';
import 'package:sample/models/FilterMethods.dart';
import 'package:sample/models/Recipe.dart';
import 'Sort.dart';

class FilterItem extends StatefulWidget {
  List<Recipe> recip;
  FilterItem(this.recip);
  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  int selectedRadio;

  String currentFilteroptiontxt;
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
            if (sortName.sorttxt == 'Schnellsten'.toUpperCase()) {
              currentFilteroptiontxt = sortName.sorttxt;
            }
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
    widgets.add(
      InkWell(
        onTap: () {
          if (currentFilteroptiontxt == 'Schnellsten'.toUpperCase()) {
            Navigator.push(context, MaterialPageRoute(builder: (cont) {
              return HomePage(
                true,
                FilterMethods.quickSort(
                    widget.recip, 0, widget.recip.length - 1),
              );
            }));
          }
        },
        child: Container(
          color: Colors.red,
          height: 5,
        ),
      ),
    );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: createRadioListSort(),
          ),
        ],
      ),
    );
  }
}
