import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sample/HomePage/RecipeGUI/FavoritIconButton.dart';
import 'package:sample/HomePage/RecipeGUI/UnlookedRecipeDetails/TabBarLogic/CostumeTabBar.dart';
import 'package:sample/models/Recipe.dart';

//logic von Gui vereinfachen
//Menü für die Zubereitungsschritte erstellen
class RecipeDetailsunlooked extends StatefulWidget {
  Recipe recipe;
  RecipeDetailsunlooked(this.recipe);
  @override
  _RecipeDetailsunlookedState createState() => _RecipeDetailsunlookedState();
}

class _RecipeDetailsunlookedState extends State<RecipeDetailsunlooked> {
  bool _buttonPressed = false;
  bool _loopActive = false;

  void _increaseCounterWhilePressed() async {
    if (_loopActive) return;
    _loopActive = true;
    while (_buttonPressed) {
      if (_counter == 20) {
        break;
      }
      setState(() {
        _counter++;
      });
      await Future.delayed(Duration(milliseconds: 300));
    }
    _loopActive = false;
  }

  void _decreaseCounterWhilePressed() async {
    if (_loopActive) return;
    _loopActive = true;
    while (_buttonPressed) {
      if (_counter == 1) {
        break;
      }
      setState(() {
        _counter--;
      });
      await Future.delayed(Duration(milliseconds: 300));
    }

    _loopActive = false;
  }

  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
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
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: AutoSizeText(
                                (widget.recipe.name),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
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
                              width: MediaQuery.of(context).size.width * 0.05,
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
                                        AutoSizeText(
                                          (widget.recipe.recipeTyp),
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.50,
                                width: MediaQuery.of(context).size.width * 0.50,
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
                        Padding(
                          padding: EdgeInsets.only(top: 25, right: 20),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                Text(
                                  'Portion'.toUpperCase(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      fontSize: 20),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 3),
                                  child: Listener(
                                    onPointerDown: (details) {
                                      setState(() {
                                        _buttonPressed = true;
                                        _decreaseCounterWhilePressed();
                                      });
                                    },
                                    onPointerUp: (details) {
                                      _buttonPressed = false;
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      color: _counter != 1
                                          ? Theme.of(context)
                                              .secondaryHeaderColor
                                          : Colors.grey[400],
                                      child: Center(
                                        child: Icon(Icons.horizontal_rule,
                                            size: 20,
                                            color:
                                                Theme.of(context).canvasColor),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 3, right: 3),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).canvasColor,
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                          width: 1),
                                    ),
                                    child: Center(
                                      child: Text(_counter.toString()),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, left: 3),
                                  child: Listener(
                                    onPointerDown: (details) {
                                      _buttonPressed = true;
                                      _increaseCounterWhilePressed();
                                    },
                                    onPointerUp: (details) {
                                      _buttonPressed = false;
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      color: _counter != 20
                                          ? Theme.of(context)
                                              .secondaryHeaderColor
                                          : Colors.grey[400],
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Theme.of(context).canvasColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CostumeTabBar(widget.recipe),
          ],
        ),
      ),
    );
  }
}
