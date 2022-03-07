import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/RecipesPage/Filtern/Listviewoptions.dart';
import 'package:sample/models/Recipe.dart';
import 'package:sample/utils/Constant.dart';
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

  bool checkfilteroptioninRecipe(List<dynamic> list, String filteroption) {
    if (list.contains(filteroption) == true) {
      return true;
    } else {
      return false;
    }
  }

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
                          if (filterwords.isEmpty) {
                            Fluttertoast.showToast(
                                msg: Constant.msgChoosOptions);
                          } else {
                            for (var recipe in widget.list!) {
                              for (int i = 0; i < filterwords.length; i++) {
                                switch (filterwords[i]) {
                                  case Constant.vegan:
                                    if (filterRecipes.contains(recipe)) {
                                      break;
                                    }
                                    if (checkfilteroptioninRecipe(
                                            recipe.filterTyps!,
                                            Constant.vegan) ==
                                        true) {
                                      filterRecipes.add(recipe);
                                    }

                                    break;
                                  case Constant.glutenfrei:
                                    if (filterRecipes.contains(recipe)) {
                                      break;
                                    }
                                    if (checkfilteroptioninRecipe(
                                            recipe.filterTyps!,
                                            Constant.glutenfrei) ==
                                        true) {
                                      filterRecipes.add(recipe);
                                    }
                                    break;
                                  case Constant.lowcarb:
                                    if (filterRecipes.contains(recipe)) {
                                      break;
                                    }
                                    if (checkfilteroptioninRecipe(
                                            recipe.filterTyps!,
                                            Constant.lowcarb) ==
                                        true) {
                                      filterRecipes.add(recipe);
                                    }
                                    break;
                                  case Constant.keto:
                                    if (filterRecipes.contains(recipe)) {
                                      break;
                                    }
                                    if (checkfilteroptioninRecipe(
                                            recipe.filterTyps!,
                                            Constant.keto) ==
                                        true) {
                                      filterRecipes.add(recipe);
                                    }
                                    break;
                                  case Constant.vegetarisch:
                                    if (filterRecipes.contains(recipe)) {
                                      break;
                                    }
                                    if (checkfilteroptioninRecipe(
                                            recipe.filterTyps!,
                                            Constant.vegetarisch) ==
                                        true) {
                                      filterRecipes.add(recipe);
                                    }
                                    break;
                                  case Constant.prescetaria:
                                    if (filterRecipes.contains(recipe)) {
                                      break;
                                    }
                                    if (checkfilteroptioninRecipe(
                                            recipe.filterTyps!,
                                            Constant.prescetaria) ==
                                        true) {
                                      filterRecipes.add(recipe);
                                    }
                                    break;
                                  case Constant.lowFat:
                                    if (filterRecipes.contains(recipe)) {
                                      break;
                                    }
                                    if (checkfilteroptioninRecipe(
                                            recipe.filterTyps!,
                                            Constant.lowFat) ==
                                        true) {
                                      filterRecipes.add(recipe);
                                    }
                                    break;
                                  case Constant.lowsugar:
                                    if (filterRecipes.contains(recipe)) {
                                      break;
                                    }
                                    if (checkfilteroptioninRecipe(
                                            recipe.filterTyps!,
                                            Constant.lowsugar) ==
                                        true) {
                                      filterRecipes.add(recipe);
                                    }
                                    break;
                                    break;
                                }
                              }
                            }
                            widget.callbackFunction!(filterRecipes);

                            Preference.shared
                                .setBool(Preference.isfilterd, true);
                            Navigator.pop(context);
                          }
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
