import 'package:flutter/material.dart';
import 'package:sample/models/DatabaseRecipes.dart';

class FavoriteRecipeSmall extends StatefulWidget {
  DatabaseRecipes recipe;
  FavoriteRecipeSmall(this.recipe);
  @override
  _FavoritRecipeInfoSmallState createState() => _FavoritRecipeInfoSmallState();
}

class _FavoritRecipeInfoSmallState extends State<FavoriteRecipeSmall> {
  Row test;
  @override
  Widget build(BuildContext context) {
    return

        //child: InkWell(
        //onTap: () {
        //if (widget.recipe.giftedrecipe == true) {
        //Navigator.of(context).push(MaterialPageRoute(
        //builder: (_) => RecipeDetailsunlooked(widget.recipe)));
        //} else if (widget.recipe.giftedrecipe== false) {
        //Navigator.of(context).push(MaterialPageRoute(
        //builder: (_) => RecipeDetailslooked(widget.recipe)));
        //}
        //},
        Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.recipe.picUrl,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
              ),
              width: 160,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    (widget.recipe.recipeName),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                widget.recipe.kilocal.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'kcal',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    widget.recipe.giftedrecipe == false
                        ? Padding(
                            padding: EdgeInsets.only(left: 25, top: 10),
                            child: Container(
                              child: Icon(
                                Icons.lock_outline_sharp,
                                color: Theme.of(context).canvasColor,
                              ),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  shape: BoxShape.circle),
                              height: 60,
                              width: 60,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2),
          )
        ],
      ),

      // ),
    );
  }
}
