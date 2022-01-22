import 'package:flutter/material.dart';
import 'package:sample/models/Recipe.dart';

class IngredientsListview extends StatelessWidget {
  Recipe _recipe;
  IngredientsListview(this._recipe);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          top: MediaQuery.of(context).size.width * 0.05,
        ),
        child: ListView.builder(
          itemCount: _recipe.ingredientslist!.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.02,
                  width: MediaQuery.of(context).size.width * 0.02,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08),
                  child: Text(
                    _recipe.ingredientslist![index],
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
