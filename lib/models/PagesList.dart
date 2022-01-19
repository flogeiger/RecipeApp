import '../HomePage/HomePage.dart';
import '../ChallengePage/ChallengePage.dart';
import 'package:sample/FavoritePage/FavoritPage.dart';
import '../RecipesPage/RecipesPage.dart';
import 'package:flutter/material.dart';
import '../ProfilePage/ProfilePage.dart';

class PageList {
  PageList();
  List<Widget> _pages = <Widget>[
    HomePage(
        //false,
        //null,
        ),
    RecipesPage(),
    FavoritePage(),
    ChallengePage(),
    ProfilePage(),
  ];
  Widget page(int _counter) {
    return _pages[_counter];
  }

  List<Widget> getList() {
    return _pages;
  }
}
