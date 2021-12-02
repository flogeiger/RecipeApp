import 'package:sample/FavoritePage/FavoritePage.dart';

import '../HomePage/HomePage.dart';
import '../ChallengePage/ChallengePage.dart';
import '../FavoritePage/FavoritePage.dart';
import '../RecipesPage/RecipesPage.dart';
import 'package:flutter/material.dart';
import '../ProfilePage/ProfilePage.dart';

class PageList {
  PageList();
  List<Widget> _pages = <Widget>[
    HomePage(
      false,
      null,
    ),
    RecipesPage(),
    FavoritPage(),
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
