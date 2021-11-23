import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/models/FileManager.dart';
import 'package:sample/models/Recipe.dart';
import 'package:sample/models/DatabaseBox.dart';
import 'package:sample/models/DatabaseRecipe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class FavoriteIconButton extends StatefulWidget {
  Recipe recipe;
  FavoriteIconButton(this.recipe);
  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  Color internalSave = Colors.white;
  @override
  void initState() {
    super.initState();
  }

  DatabaseRecipe recipe;
  Future addRecipe(
      String recipeName,
      String description,
      String recipeTyp,
      String picUrl,
      String recipestep1,
      String recipestep2,
      String recipestep3,
      String recipestep4,
      String recipestep5,
      String recipestep6,
      int duration,
      int kcal) {
    recipe = DatabaseRecipe()
      ..recipeName = recipeName
      ..description = description
      ..duration = duration
      ..kilocal = kcal
      ..picUrl = picUrl
      ..recipeTyp = recipeTyp
      ..recipestep1 = recipestep1
      ..recipestep2 = recipestep2
      ..recipestep3 = recipestep3
      ..recipestep4 = recipestep4
      ..recipestep5 = recipestep5
      ..recipestep6 = recipestep6;

    final box = Boxes.getRecipe();
    Hive.openBox<DatabaseRecipe>('Recipes');
    box.add(recipe);
  }

  void deleteRecipeFromFavorites(DatabaseRecipe recip) {
    recipe.delete();
  }

  @override
  Widget build(BuildContext context) {
    return widget.recipe.giftedRecipe == true
        ? GestureDetector(
            onTap: () {
              if (internalSave == Colors.white) {
                setState(() {
                  internalSave = Colors.red;
                });
                FavoriteRecipeStorage test;
                test.writejson(widget.recipe);
                addRecipe(
                    widget.recipe.name,
                    widget.recipe.description,
                    widget.recipe.recipeTyp,
                    widget.recipe.picUrl,
                    widget.recipe.recipestep1,
                    widget.recipe.recipestep2,
                    widget.recipe.recipestep3,
                    widget.recipe.recipestep4,
                    widget.recipe.recipestep5,
                    widget.recipe.recipestep6,
                    widget.recipe.duration,
                    widget.recipe.kilocal);
              } else {
                setState(() {
                  internalSave = Colors.white;
                });
                deleteRecipeFromFavorites(recipe);
              }
            },
            child: Container(
              child: Icon(
                Icons.favorite,
                color: internalSave,
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
