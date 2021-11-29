import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sample/HomePage/RecipeGUI/FavoritIconButton.dart';
import 'package:sample/HomePage/RecipeGUI/LockedRecipeDetails/UnlockRecipeUI/unlockRecipe.dart';
import 'package:sample/models/Recipe.dart';

class RecipeDetailslooked extends StatefulWidget {
  Recipe recipe;
  RecipeDetailslooked(this.recipe);
  @override
  _RecipeDetailslookedState createState() => _RecipeDetailslookedState();
}

class _RecipeDetailslookedState extends State<RecipeDetailslooked> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 60,
              color: Theme.of(context).secondaryHeaderColor,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 80,
                    ),
                  ),
                  FavoriteIconButton(widget.recipe),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: AutoSizeText(
                          (widget.recipe.name),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Text(
                                '${widget.recipe.kilocal} kcal',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 90,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.timer_rounded,
                                    color: Theme.of(context).primaryColor,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${widget.recipe.duration} min',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.accessible,
                                    color: Theme.of(context).primaryColor,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${widget.recipe.recipeTyp}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /*Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Theme.of(context).primaryColor,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),*/
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              widget.recipe.picUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.lock_outline_rounded,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Für unbegrenzten Zugang',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: UnlockRecipeModalBar(),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
