import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/RecipesPage/Filtern/Listviewoptions.dart';
import 'package:sample/models/Recipe.dart';
import 'package:sample/utils/Preference.dart';
import 'RecipeTypFilternCategory.dart';
import 'package:sample/RecipesPage/Filtern/ButtonFiltern.dart';

class RecipeTypFilterPage extends StatefulWidget {
  final List<Recipe>? list;
  final Function? callbackFunction;
  RecipeTypFilterPage({@required this.callbackFunction, @required this.list});
  @override
  _RecipeTypFilterPageState createState() => _RecipeTypFilterPageState();
}

class _RecipeTypFilterPageState extends State<RecipeTypFilterPage> {
  List<RecipeTypFilternCategory> filterList =
      RecipeTypFilternCategory.getFilterRecipeTyp();

  List<String> filterwords = [];

  List<Recipe> filterRecipes = [];
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Filtern(
                              callbackFunction: widget.callbackFunction,
                              list: widget.list),
                        ),
                      );
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
                      'Alles löschen',
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
                                    if (val == true) {
                                      filterwords.add(
                                        filterList[index].filterCategorytxt!,
                                      );
                                    } else {
                                      filterwords.remove(
                                        filterList[index].filterCategorytxt!,
                                      );
                                    }
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Filtern(
                                  callbackFunction: widget.callbackFunction,
                                  list: widget.list),
                            ),
                          );
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
                          for (var recipe in widget.list!) {
                            if (filterwords.isEmpty) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Bitte wählen Sie eine Option aus, um diese Funktion zu betätigen");
                              break;
                            }

                            for (int i = 0; i < filterwords.length; i++) {
                              switch (filterwords[i]) {
                                case "Vegan":
                                  if (filterRecipes.contains(recipe)) break;
                                  filterRecipes.add(recipe);
                                  break;
                                case "Glutenfrei":
                                  if (filterRecipes.contains(recipe)) break;
                                  filterRecipes.add(recipe);
                                  break;
                                case "Low carb":
                                  if (filterRecipes.contains(recipe)) break;
                                  filterRecipes.add(recipe);
                                  break;
                                case "Keto":
                                  if (filterRecipes.contains(recipe)) break;
                                  filterRecipes.add(recipe);
                                  break;
                                case "Vegetarisch":
                                  if (filterRecipes.contains(recipe)) break;
                                  filterRecipes.add(recipe);
                                  break;
                                case "Prescetaria":
                                  if (filterRecipes.contains(recipe)) break;
                                  filterRecipes.add(recipe);
                                  break;
                                case "Low Fat":
                                  if (filterRecipes.contains(recipe)) break;
                                  filterRecipes.add(recipe);
                                  break;
                                case "Low Sugar":
                                  if (filterRecipes.contains(recipe)) break;
                                  filterRecipes.add(recipe);
                                  break;
                              }
                            }
                          }
                          widget.callbackFunction!(filterRecipes);

                          Preference.shared.setBool(Preference.isfilterd, true);
                          Navigator.pop(context);
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
