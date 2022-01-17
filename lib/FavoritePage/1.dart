//import 'dart:convert';

//import 'package:flutter/material.dart';
//import 'package:sample/Database/Helper.dart';
//import 'package:sample/models/FavRecip.dart';
//import 'FavoritPage.dart';
//import 'package:sample/Database/Datamodel/FavoriteData.dart';

//class FavoritPage extends StatelessWidget {
  //Future<List<FavRecip>> favRecipe(Future<List<FavoriteRecip>> getlist) async {
    //final list = await getlist;
    //List<FavRecip> recipeList = [];
    //for (var item in list) {
      //FavRecip favitem = new FavRecip(
        //item.recipeName,
        //item.description,
        //item.recipeTyp,
        //item.picUrl,
        //item.savingTimerecipe,
        //convertStringtoList(item.preparationList!),
        //convertStringtoList(item.ingredientslist!),
        //item.duration,
        //item.kilocal,
      //);
      //recipeList.add(favitem);
    //}
    //return recipeList;
  //}

  //List<String> convertStringtoList(String input) {
    //final list = input.split(',');
    //return list;
  //}

  //@override
  //Widget build(BuildContext context) {
    //return Container(
      //child: Center(
        //child: FutureBuilder(
          //future: favRecipe(Helper.selectAllDataFromFavtable()),
          //builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            //if (snapshot.connectionState == ConnectionState.done) {
              //if (snapshot.hasError)
                //return Text(snapshot.error.toString());
              //else
                //return FavoriteItem(snapshot);
            //} else
              //return Scaffold();
          //},
        //),
      //),
    //);
  //}
//}
