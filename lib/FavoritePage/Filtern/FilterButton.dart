import 'package:flutter/material.dart';
import 'package:sample/FavoritePage/Sort/unsortButtonFav.dart';
import 'package:sample/utils/Preference.dart';
import 'package:sample/utils/routes/routes.gr.dart';
import 'Listviewoptions.dart';
import 'package:auto_route/auto_route.dart';

class FilterButton extends StatefulWidget {
  final Function? callbackFunction;
  FilterButton({
    @required this.callbackFunction,
  });
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool? isfiltered;
  getPreference() {
    isfiltered = Preference.shared.getBool(Preference.isfilterdFav) ?? false;
  }

  @override
  void initState() {
    getPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isfiltered = Preference.shared.getBool(Preference.isfilterdFav);
    return Stack(
      children: [
        GestureDetector(
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
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 22),
                ),
              ],
            ),
          ),
          onTap: () {
            context.router.push(
                FavFilternRoute(callbackFunction: widget.callbackFunction));
          },
        ),
        isfiltered == false
            ? Positioned(
                child: Container(),
                top: 0,
                left: 0,
              )
            : Positioned(
                top: 0,
                left: 0,
                child: UnsortBottonFav(widget.callbackFunction),
              )
      ],
    );
  }
}
