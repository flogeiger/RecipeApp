import 'package:flutter/material.dart';
import 'package:sample/RecipesPage/RecipeGUI/LockedRecipeDetails/UnlockRecipeUI/UnlockRecipeButton.dart';
import 'package:sample/RecipesPage/RecipeGUI/LockedRecipeDetails/UnlockRecipeUI/afterunlockoptions.dart';

class UnlockRecipeModalBar extends StatefulWidget {
  @override
  State<UnlockRecipeModalBar> createState() => _UnlockRecipeModalBarState();
}

class _UnlockRecipeModalBarState extends State<UnlockRecipeModalBar> {
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
                  Afterunlockoption('Um die 70 gesunde und leckere Rezepte'),
                  Afterunlockoption('Um die 20 Essenspläne mit Einkaufslisten'),
                  Afterunlockoption('Jede Woche neue Rezepte'),
                  Afterunlockoption('Jede Woche neue Essenspläne'),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: UnlockRecipeButton('4,49 € / Monat'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: UnlockRecipeButton('45,64 € / Jahr'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
