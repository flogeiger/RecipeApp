import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/src/provider.dart';
import 'package:sample/Controller/file_controller.dart';
import 'package:sample/models/FileManager.dart';
import 'package:sample/models/Recipe.dart';
import 'package:sample/models/DatabaseBox.dart';
import 'package:sample/models/DatabaseRecipes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class FavoriteIconButton extends StatefulWidget {
  Recipe recipe;
  FavoriteIconButton(this.recipe);
  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  DatabaseRecipes _databaseRecipe;
  @override
  void initState() {
    super.initState();
    Box<DatabaseRecipes> recipes = hiveInput();
    List<DatabaseRecipes> test;
    test = recipes.values.toList();
    for (var item in test) {
      if (item.recipeName == widget.recipe.name &&
          item.picUrl == widget.recipe.picUrl) {
        isalreadysaved = item.kfav;
        _databaseRecipe = item;
        break;
      } else {
        isalreadysaved = false;
      }
    }
  }

  DatabaseRecipes recipe;
  Future addRecipe(
      String recipeName,
      String description,
      String recipeTyp,
      String picUrl,
      int duration,
      int kcal,
      bool fav,
      List<dynamic> preparation) {
    recipe = DatabaseRecipes()
      ..recipeName = recipeName
      ..description = description
      ..duration = duration
      ..kilocal = kcal
      ..picUrl = picUrl
      ..recipeTyp = recipeTyp
      ..kfav = isalreadysaved
      ..preparationList = preparation;

    final box = Boxes.getRecipe();
    box.add(recipe);
    _databaseRecipe = recipe;
  }

  void deleteRecipeFromFavorites() {
    _databaseRecipe.delete();
  }

  Box<DatabaseRecipes> hiveInput() {
    Box<DatabaseRecipes> test = Boxes.getRecipe();
    return test;
  }

  bool isalreadysaved = false;
  bool issaving;
  @override
  Widget build(BuildContext context) {
    return widget.recipe.giftedRecipe == true
        ? GestureDetector(
            onTap: () {
              if (isalreadysaved == false) {
                isalreadysaved = true;
                addRecipe(
                  widget.recipe.name,
                  widget.recipe.description,
                  widget.recipe.recipeTyp,
                  widget.recipe.picUrl,
                  widget.recipe.duration,
                  widget.recipe.kilocal,
                  isalreadysaved,
                  widget.recipe.preparationsteps,
                );
                setState(() {
                  issaving = isalreadysaved;
                });
              } else {
                isalreadysaved = false;
                setState(() {
                  issaving = isalreadysaved;
                });

                deleteRecipeFromFavorites();
              }
            },
            child: Container(
              child: Icon(
                Icons.favorite,
                color: isalreadysaved == true || issaving == true
                    ? Colors.red
                    : Colors.white,
                size: 40,
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg:
                      "Du musst eine Erweiterung käuflich erwerben, um diese Funktion nutzen zu können",
                  toastLength: Toast.LENGTH_LONG);
            },
            child: Container(
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 40,
              ),
            ),
          );
  }
}
