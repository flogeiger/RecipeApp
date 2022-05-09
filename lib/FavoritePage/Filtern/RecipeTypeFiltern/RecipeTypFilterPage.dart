import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/Database/Datamodel/FavoriteData.dart';
import 'package:sample/Database/Helper.dart';
import 'package:sample/FavoritePage/Filtern/Listviewoptions.dart';
import 'package:sample/models/Recipe.dart';
import 'package:sample/utils/Constant.dart';
import 'package:sample/utils/Preference.dart';
import 'package:sample/utils/routes/routes.gr.dart';
import 'RecipeTypFilternCategory.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sample/FavoritePage/Filtern/ButtonFiltern.dart';

class FavRecipeTypFilterPage extends StatefulWidget {
  final Function? callbackFunction;
  FavRecipeTypFilterPage({
    @required this.callbackFunction,
  });
  @override
  _RecipeTypFilterPageState createState() => _RecipeTypFilterPageState();
}

class _RecipeTypFilterPageState extends State<FavRecipeTypFilterPage> {
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

  Future<List<Recipe>> convertListtoFuture(List<Recipe> list) async {
    return list;
  }

  List<Recipe> recipeList = [];
  Future<List<Recipe>> favRecipe(Future<List<FavoriteRecip>> getlist) async {
    final list = await getlist;
    for (var item in list) {
      Recipe favitem = new Recipe(
        item.recipeName,
        item.description,
        item.recipeTyp,
        item.picUrl,
        item.savingTimerecipe,
        item.duration,
        item.savingFlag,
        convertStringtoList(item.preparationList!),
        item.kilocal,
        convertStringtoList(item.ingredientslist!),
        convertStringtoList(item.nutritionlist!),
        convertStringtoList(item.filterTyps!),
      );
      recipeList.add(favitem);
    }
    return recipeList;
  }

  List<String> convertStringtoList(String input) {
    final list = input.split(',');
    return list;
  }

  @override
  void initState() {
    favRecipe(Helper.selectAllDataFromFavtable());
    super.initState();
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
                      context.router.pop(
                        FavFilternRoute(
                            callbackFunction: widget.callbackFunction),
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
                          context.router.pop(
                            FavFilternRoute(
                                callbackFunction: widget.callbackFunction),
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
                            for (var recipe in recipeList) {
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
                                }
                              }
                            }
                            widget.callbackFunction!(
                              convertListtoFuture(filterRecipes),
                            );

                            Preference.shared
                                .setBool(Preference.isfilterdFav, true);
                            context.router
                                .navigate(AfterLoginRoute(selectedItem: 2));
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
