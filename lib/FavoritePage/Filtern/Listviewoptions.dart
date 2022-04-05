import 'package:flutter/material.dart';
import 'package:sample/utils/routes/routes.gr.dart';
import 'FilternCategory.dart';
import 'package:sample/FavoritePage/Filtern/RecipeTypeFiltern/RecipeTypFilterPage.dart';
import 'package:sample/FavoritePage/Filtern/caloriesfilter/CaloriesFilterPage.dart';
import 'package:sample/FavoritePage/Filtern/timefilter/TimeFilterPage.dart';
import 'ButtonFiltern.dart';
import 'TopMenuBar.dart';
import 'package:auto_route/auto_route.dart';

class FavFilternPage extends StatefulWidget {
  final Function? callbackFunction;
  FavFilternPage({
    @required this.callbackFunction,
  });
  @override
  _FilternState createState() => _FilternState();
}

class _FilternState extends State<FavFilternPage> {
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
        context.router.push(
          CaloriesFilterRoute(callbackFunction: widget.callbackFunction),
        );
        break;
      case 'Diättyp':
        context.router.push(
          FavRecipeTypFilterRoute(callbackFunction: widget.callbackFunction),
        );
        break;
      case 'Zeit':
        context.router.push(
          TimeFilterRoute(callbackFunction: widget.callbackFunction),
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
