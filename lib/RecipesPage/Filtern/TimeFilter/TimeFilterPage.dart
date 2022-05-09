import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/RecipesPage/Filtern/ButtonFiltern.dart';
import 'package:sample/RecipesPage/Filtern/Listviewoptions.dart';
import 'package:sample/utils/routes/routes.gr.dart';
import 'TimeFilterListview.dart';
import 'package:sample/RecipesPage/Filtern/TimeFilter/TimeFilterCategory.dart';
import 'package:sample/models/Recipe.dart';

import '../../../utils/Preference.dart';

class RecipeTimeFilterPage extends StatefulWidget {
  final List<Recipe>? list;
  final Function? callbackFunction;
  RecipeTimeFilterPage({@required this.callbackFunction, @required this.list});
  @override
  _TimeFilterPageState createState() => _TimeFilterPageState();
}

class _TimeFilterPageState extends State<RecipeTimeFilterPage> {
  List<TimeFilterCategory> filterList = [];
  List<Recipe> recipeList = [];

  Future<List<TimeFilterCategory>> getFilterCategory() async {
    Query _collectionRef =
        FirebaseFirestore.instance.collection("TimeFilterOption").orderBy(
              'bigval',
            );

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) =>
        TimeFilterCategory.fromJson(doc.data() as Map<String, dynamic>));
    for (var item in allData) {
      if (filterList.contains(item)) {
        break;
      } else {
        filterList.add(item);
      }
    }
    return filterList;
  }

  addRecipesaccordingtopreparationTime(bool isChecked, int index) {
    //2 attibute vomn und bis
    //Lokale Arrays in die Datenbank speichern

    if (isChecked == true) {
      for (var recipe in widget.list!) {
        if (recipe.duration! > filterList[index].smalval! &&
            recipe.duration! <= filterList[index].bigval!) {
          recipeList.add(recipe);
        }
      }
    } else {
      for (var recipe in widget.list!) {
        if (recipe.duration! > filterList[index].smalval! &&
            recipe.duration! <= filterList[index].bigval!) {
          recipeList.remove(recipe);
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
                          return TimeFilterListview(
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
                            context.router
                                .navigate(AfterLoginRoute(selectedItem: 1));
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
}
