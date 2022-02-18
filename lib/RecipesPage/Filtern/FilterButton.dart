import 'package:flutter/material.dart';
import 'Listviewoptions.dart';
import 'package:sample/models/Recipe.dart';

class FilterButton extends StatefulWidget {
  final List<Recipe>? list;
  final Function? callbackFunction;
  FilterButton({@required this.callbackFunction, @required this.list});
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          border: Border.all(
              color: Theme.of(context).secondaryHeaderColor, width: 1),
        ),
        margin: EdgeInsets.all(5),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.format_list_bulleted_rounded,
                color: Theme.of(context).secondaryHeaderColor,
                size: 22,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Filtern',
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor, fontSize: 22),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => Filtern(
                callbackFunction: widget.callbackFunction, list: widget.list),
          ),
        );
      },
    );
  }
}