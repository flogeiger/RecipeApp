import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/RecipesPage/Filtern/ButtonFiltern.dart';
import 'package:sample/RecipesPage/Filtern/Listviewoptions.dart';
import 'package:sample/RecipesPage/Filtern/caloriesfilter/CaloriesFilterCategory.dart';
import 'package:sample/models/Recipe.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sample/utils/routes/routes.gr.dart';

class RecipeCaloriesFilterPage extends StatefulWidget {
  final List<Recipe>? list;
  final Function? callbackFunction;
  RecipeCaloriesFilterPage(
      {@required this.callbackFunction, @required this.list});
  @override
  _CaloriesFilterPageState createState() => _CaloriesFilterPageState();
}

class _CaloriesFilterPageState extends State<RecipeCaloriesFilterPage> {
  List<CaloriesFilterCategory> filterList =
      CaloriesFilterCategory.getFilterCalories();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.router.pop(RecipeFilternRoute(
                          callbackFunction: widget.callbackFunction,
                          list: widget.list));
                    },
                    child: Container(
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).secondaryHeaderColor,
                        size: 50,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Kategorien',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Alles l??schen',
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: new ListView.builder(
                    itemCount: filterList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Card(
                        child: new Container(
                          padding: new EdgeInsets.all(10.0),
                          child: new Column(
                            children: <Widget>[
                              new CheckboxListTile(
                                  activeColor:
                                      Theme.of(context).secondaryHeaderColor,
                                  dense: true,
                                  selected: filterList[index].isChecked!,
                                  value: filterList[index].isChecked,
                                  title: new Text(
                                    filterList[index].filterCategorytxt!,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  onChanged: (bool? val) {
                                    itemChange(val!, index);
                                  })
                            ],
                          ),
                        ),
                      );
                    }),
              ),
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
                          context.router.pop(RecipeFilternRoute(
                              callbackFunction: widget.callbackFunction,
                              list: widget.list));
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
                          context.router
                              .navigate(AfterLoginRoute(selectedItem: 1));
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
    );
  }

  void itemChange(bool val, int index) {
    setState(() {
      filterList[index].isChecked = val;
    });
  }
}
