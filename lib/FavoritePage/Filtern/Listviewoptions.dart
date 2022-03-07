import 'package:flutter/material.dart';
import 'FilternCategory.dart';
import 'package:sample/FavoritePage/Filtern/RecipeTypeFiltern/RecipeTypFilterPage.dart';
import 'package:sample/FavoritePage/Filtern/caloriesfilter/CaloriesFilterPage.dart';
import 'package:sample/FavoritePage/Filtern/timefilter/TimeFilterPage.dart';
import 'ButtonFiltern.dart';
import 'TopMenuBar.dart';

class Filtern extends StatefulWidget {
  final Function? callbackFunction;
  Filtern({
    @required this.callbackFunction,
  });
  @override
  _FilternState createState() => _FilternState();
}

class _FilternState extends State<Filtern> {
  FilternCategory? selectedFiltern;
  List<String>? listFiltern;
  @override
  void initState() {
    super.initState();
    listFiltern = FilternCategory.getFilternName();
  }

  int selectedIndex = -1;
  checkingwhichselected(String filtervalue) {
    switch (filtervalue) {
      case 'Kalorien':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CaloriesFilterPage(
              callbackFunction: widget.callbackFunction,
            ),
          ),
        );
        break;
      case 'Diättyp':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeTypFilterPage(
              callbackFunction: widget.callbackFunction,
            ),
          ),
        );
        break;
      case 'Zeit':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TimeFilterPage(callbackFunction: widget.callbackFunction),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              TopMenuBar(),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: listFiltern!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: MediaQuery.of(context).size.height * 0.04,
                          ),
                          selected: selectedIndex == index ? true : false,
                          selectedTileColor:
                              Theme.of(context).secondaryHeaderColor,
                          title: Text(
                            listFiltern![index],
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                      );
                    }),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 5,
                          top: 10,
                          bottom: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: FilterButton(
                            'Abbrechen',
                            Colors.white,
                            10,
                            5,
                            Theme.of(context).secondaryHeaderColor,
                            Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            checkingwhichselected(listFiltern![selectedIndex]);
                          },
                          child: FilterButton(
                            'Anwenden',
                            Theme.of(context).secondaryHeaderColor,
                            5,
                            10,
                            Colors.white,
                            Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
