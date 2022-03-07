import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample/Database/Datamodel/FavoriteData.dart';
import 'package:sample/Database/Helper.dart';
import 'package:sample/models/FilterMethods.dart';
import 'package:sample/models/Recipe.dart';
import 'package:sample/utils/Preference.dart';

class UnsortBottonFav extends StatefulWidget {
  final Function? callbackFunction;
  UnsortBottonFav(this.callbackFunction);
  @override
  _UnsortBottonFavState createState() => _UnsortBottonFavState();
}

class _UnsortBottonFavState extends State<UnsortBottonFav>
    with SingleTickerProviderStateMixin {
  Future<List<Recipe>>? list;
  Future<List<Recipe>> favRecipe(Future<List<FavoriteRecip>> getlist) async {
    final list = await getlist;
    List<Recipe> recipeList = [];
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
    //animation = Tween(begin: 0, end: 2 * pi).animate(controller!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.callbackFunction!(favRecipe(Helper.selectAllDataFromFavtable()));
        setState(() {
          Preference.shared.setBool(Preference.issortedFav, false);
          Preference.shared.setBool(Preference.isfilterdFav, false);
        });
      },
      child: CircleAvatar(
        radius: 12,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
