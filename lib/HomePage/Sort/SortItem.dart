import 'package:flutter/material.dart';
import 'package:sample/HomePage/HomePage.dart';
import 'package:sample/models/FilterMethods.dart';
import 'package:sample/models/Recipe.dart';
import 'Sort.dart';

class FilterItem extends StatefulWidget {
  final List<Recipe>? list;
  final Function? callbackFunction;
  const FilterItem(
      {Key? key, @required this.list, @required this.callbackFunction})
      : super(key: key);
  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  int? selectedRadio;

  String? currentFilteroptiontxt;
  Sort? selectedSort;
  List<Sort>? listsort;
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
    for (Sort sortName in listsort!) {
      widgets.add(
        RadioListTile(
          activeColor: Theme.of(context).secondaryHeaderColor,
          value: sortName,
          groupValue: selectedSort,
          onChanged: (Sort? currentUser) {
            setSelcetedUser(currentUser!);
            if (sortName.sorttxt == 'Schnellsten'.toUpperCase()) {
              currentFilteroptiontxt = sortName.sorttxt;
            }
            if (sortName.sorttxt == 'Neustes'.toUpperCase()) {
              currentFilteroptiontxt = sortName.sorttxt;
            }
            if (sortName.sorttxt == 'Einfachsten'.toUpperCase()) {
              currentFilteroptiontxt = sortName.sorttxt;
            }
          },
          selected: selectedSort == sortName,
          title: Text(
            sortName.sorttxt!,
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
            widget.callbackFunction!(
              FilterMethods.quickSort(widget.list!, 0, widget.list!.length - 1),
            );
            Navigator.pop(context);
          }
          if (currentFilteroptiontxt == 'Neustes'.toUpperCase()) {
            widget.callbackFunction!(
              FilterMethods.getnewestRecipes(widget.list!),
            );
            Navigator.pop(context);
          }
          if (currentFilteroptiontxt == 'Einfachsten'.toUpperCase()) {
            widget.callbackFunction!(
              FilterMethods.insertionSortforEasiest(widget.list!),
            );
            Navigator.pop(context);
          }
        },
        child: Container(
          color: Colors.red,
          height: 50,
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
