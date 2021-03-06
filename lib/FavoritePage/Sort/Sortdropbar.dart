import 'package:flutter/material.dart';
import 'package:sample/FavoritePage/Sort/unsortButtonFav.dart';
import 'package:sample/models/Recipe.dart';
import 'package:sample/utils/Preference.dart';
import 'SortItem.dart';

class SortDropBar extends StatefulWidget {
  final Future<List<Recipe>>? list;
  final Function? callbackFunction;
  const SortDropBar(
      {Key? key, @required this.list, @required this.callbackFunction})
      : super(key: key);
  @override
  _SortDropBarState createState() => _SortDropBarState();
}

class _SortDropBarState extends State<SortDropBar> {
  bool? issortedfav;
  getPreference() {
    issortedfav = Preference.shared.getBool(Preference.issortedFav) ?? false;
  }

  @override
  void initState() {
    getPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    issortedfav = Preference.shared.getBool(Preference.issortedFav);

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            _onpressed();
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              border: Border.all(
                color: Theme.of(context).secondaryHeaderColor,
                width: 1,
              ),
            ),
            margin: EdgeInsets.all(5),
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).secondaryHeaderColor,
                      size: 22,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sortieren',
                    style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
        issortedfav == false
            ? Positioned(
                child: Container(),
                top: 0,
                right: 0,
              )
            : Positioned(
                // will be positioned in the top right of the container
                top: 0,
                right: 0,
                child: UnsortBottonFav(
                  widget.callbackFunction,
                ),
              )
      ],
    );
  }

  void _onpressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF737373)),
              color: Color(0xFF737373),
            ),
            height: 500,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  border: Border.all(
                    color: Color(0xFF737373),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                  )),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).secondaryHeaderColor,
                            size: 50,
                          ),
                        ),
                      )
                    ],
                  ),
                  FilterItem(
                      list: widget.list,
                      callbackFunction: widget.callbackFunction)
                ],
              ),
            ),
          );
        });
  }
}
