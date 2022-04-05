import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/utils/routes/routes.gr.dart';
import 'LockedRecipeDetails/RecipeDetailslockedPage.dart';
import 'UnlookedRecipeDetails/RecipeDetailsunlooked.dart';
import 'package:sample/models/Recipe.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RecipeInfoSmall extends StatefulWidget {
  Recipe recipe;
  RecipeInfoSmall(this.recipe);
  @override
  _RecipeInfoSmallState createState() => _RecipeInfoSmallState();
}

class _RecipeInfoSmallState extends State<RecipeInfoSmall> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 8,
        bottom: 8,
        right: 20,
      ),
      child: InkWell(
        onTap: () {
          if (widget.recipe.giftedRecipe == true) {
            context.router
                .push(RecipeDetailsunlookedRoute(recipe: widget.recipe));
          } else if (widget.recipe.giftedRecipe == false) {
            context.router
                .push(RecipeDetailslookedRoute(recipe: widget.recipe));
          }
        },
        child: Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: MediaQuery.of(context).size.width * 0.30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.recipe.picUrl!,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: AutoSizeText(
                        (widget.recipe.name!),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'kcal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        widget.recipe.giftedRecipe == false
                            ? Padding(
                                padding: EdgeInsets.only(left: 25, top: 10),
                                child: Container(
                                  child: Icon(
                                    Icons.lock_outline_sharp,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
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
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width,
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
        ),
      ),
    );
  }
}
