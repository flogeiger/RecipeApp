import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/RecipesPage/Filtern/Listviewoptions.dart';
import 'package:sample/RecipesPage/Filtern/RecipeTypeFiltern/RecipeTypFilterListview.dart';
import 'package:sample/models/Recipe.dart';
import 'package:sample/utils/Constant.dart';
import 'package:sample/utils/Preference.dart';
import 'package:sample/utils/routes/routes.gr.dart';
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
  List<RecipeTypFilternCategory> filterList = [];
  Future<List<RecipeTypFilternCategory>> getFilterCategory() async {
    Query _collectionRef =
        FirebaseFirestore.instance.collection("RecipeTypFilterOption").orderBy(
              'filtercat',
            );

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) =>
        RecipeTypFilternCategory.fromJson(doc.data() as Map<String, dynamic>));
    for (var item in allData) {
      if (filterList.contains(item)) {
        break;
      } else {
        filterList.add(item);
      }
    }
    return filterList;
  }

  List<Recipe> recipeList = [];

  bool checkfilteroptioninRecipe(List<dynamic> list, String filteroption) {
    if (list.contains(filteroption) == true) {
      return true;
    } else {
      return false;
    }
  }

  addRecipesaccordingtopreparationTime(bool isChecked, int index) {
    if (isChecked == true) {
      for (var recipe in widget.list!) {
        for (var item in recipe.filterTyps!) {
          if (item == filterList[index].filterCategorytxt!) {
            if (recipeList.contains(recipe) != true) recipeList.add(recipe);
          }
        }
      }
    } else {
      for (var recipe in widget.list!) {
        for (var item in recipe.filterTyps!) {
          if (item == filterList[index].filterCategorytxt!) {
            recipeList.remove(recipe);
          }
        }
      }
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
                child: FutureBuilder(
                  future: getFilterCategory(),
                  builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Could not load the data!'));
                        } else {
                          return RecipeTypFilterListview(
                              filterList, addRecipesaccordingtopreparationTime);
                        }
                    }
                  },
                ),
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
                          if (recipeList.isEmpty == true) {
                            Fluttertoast.showToast(
                              msg: 'Bitte wählen Sie eine Option aus!',
                              fontSize: 18,
                            );
                          } else {
                            widget.callbackFunction!(recipeList);

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
