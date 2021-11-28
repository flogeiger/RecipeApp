import 'package:flutter/material.dart';
import 'package:sample/HomePage/RecipeGUI/LookedRecipeDetails/UnlookRecipeUI/UnlookRecipeButton.dart';

class UnlookRecipeModalBar extends StatefulWidget {
  @override
  State<UnlookRecipeModalBar> createState() => _UnlookRecipeModalBarState();
}

class _UnlookRecipeModalBarState extends State<UnlookRecipeModalBar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _onpressed();
      },
      child: Container(
        child: Center(
          child: Text(
            'Inhalte Freischalten'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
        ),
        height: 40,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  void _onpressed() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                border: Border.all(
                  color: Color(0xFF737373),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).secondaryHeaderColor,
                          size: 50,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'Werde Teil der mycarbcrew!',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.task_alt_rounded,
                          size: 30,
                        ),
                        Text(
                          'Um die 70 gesunde und leckere Rezepte',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.task_alt_rounded,
                          size: 30,
                        ),
                        Text(
                          'Um die 20 Essenspläne mit Einkaufslisten',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.task_alt_rounded,
                          size: 30,
                        ),
                        Text(
                          'Jede Woche neue Rezepte',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.task_alt_rounded,
                          size: 30,
                        ),
                        Text(
                          'Jede Woche neue Essenspläne',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: UnlookRecipeButton('4,49 € / Monat'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: UnlookRecipeButton('45,64 € / Jahr'),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
