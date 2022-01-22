import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/Database/Datamodel/FavoriteData.dart';
import 'package:sample/Database/Helper.dart';
import 'package:sample/models/Recipe.dart';

class FavoriteIconButton extends StatefulWidget {
  Recipe recipe;
  FavoriteRecip? favoriteRecip;
  FavoriteIconButton(this.recipe);
  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  @override
  void initState() {
    super.initState();
    checkingContain();
    _getDataFromFavTable();
    final recipes = favDataList;
    if (recipes != null) {
      for (var item in recipes) {
        if (item.recipeName == widget.recipe.name &&
            item.picUrl == widget.recipe.picUrl) {
          widget.favoriteRecip = item;
          break;
        } else {
          isalreadysaved = false;
        }
      }
    }
  }

  List<FavoriteRecip>? favDataList;
  Future<List<FavoriteRecip>> _getDataFromFavTable() async {
    final database = await Helper.selectAllDataFromFavtable();
    if (database.isEmpty == true) {
      favDataList = null;
    } else {
      setState(() {
        favDataList = database;
      });
    }
    return database;
  }

  Future<bool> checkingContain() async {
    final checkDatabaserecip =
        await Helper.checkingifDataisSaved(widget.recipe);
    isalreadysaved = checkDatabaserecip;
    return checkDatabaserecip;
  }

  saveFavData() async {
    var data = widget.recipe;
    await Helper.insertDataFav(
      FavoriteRecip(
        id: null,
        recipeName: data.name,
        description: data.description,
        picUrl: data.picUrl,
        ingredientslist: convertListtoString(data.ingredientslist!),
        preparationList: convertListtoString(data.preparationsteps!),
        kilocal: data.kilocal,
        duration: data.duration,
        recipeTyp: data.recipeTyp,
        savingTimerecipe: savingDateinFavRecip(),
        savingFlag: data.giftedRecipe,
      ),
    );
  }

  savingDateinFavRecip() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate;
  }

  deleteFavData() async {
    var data = widget.recipe;
    FavoriteRecip delete = await Helper.selectdeleteData(widget.recipe);
    await Helper.deletefavData(delete);
  }

  String? convertListtoString(List<dynamic> list) {
    return list.join(",");
  }

  bool? isalreadysaved;
  bool? issaving;
  @override
  Widget build(BuildContext context) {
    return widget.recipe.giftedRecipe == true
        ? GestureDetector(
            onTap: () {
              if (isalreadysaved == false) {
                isalreadysaved = true;
                saveFavData();
                setState(() {
                  issaving = isalreadysaved;
                });
              } else {
                isalreadysaved = false;
                setState(() {
                  issaving = isalreadysaved;
                });
                deleteFavData();
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
