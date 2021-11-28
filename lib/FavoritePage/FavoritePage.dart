import 'package:flutter/material.dart';
import 'FavoriteItems.dart';
import 'package:hive/hive.dart';
import 'package:sample/models/DatabaseRecipes.dart';

class FavoritPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder(
          future: Hive.openBox<DatabaseRecipes>('Recipe'),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else
                return FavoriteItem();
            } else
              return Scaffold();
          },
        ),
      ),
    );
  }
}
