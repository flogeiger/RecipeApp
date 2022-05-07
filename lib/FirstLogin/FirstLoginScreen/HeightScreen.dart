import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/FirstLogin/weeklygoalSetScreen/GradientButtonSmall.dart';
import 'package:sample/FirstLogin/weeklygoalSetScreen/WeeklyGoalSetPage.dart';
import 'package:sample/utils/Preference.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sample/utils/routes/routes.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CostumeToast.dart';

class HeightScreen extends StatefulWidget {
  final PageController? controller;
  HeightScreen({this.controller});
  @override
  _HeightScreenState createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  bool cmSelected = true;
  bool ftSelected = false;
  int? cmHeight = 20;
  bool unit = true;

  final TextEditingController stepController = new TextEditingController();
  final TextEditingController heightController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fullHeight = MediaQuery.of(context).size.height;
    var fullWidth = MediaQuery.of(context).size.width;

    final stepField = TextFormField(
      autofocus: false,
      controller: stepController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Dieses Feld darf nicht Lehr sein, wenn du die Eingabe sichern willst");
        }
        if (!RegExp("[a-zA-Z]").hasMatch(value)) {
          return ("Bitte gib einen Namen an");
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Schrittelimit",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );

    final heightField = TextFormField(
      autofocus: false,
      controller: heightController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Dieses Feld darf nicht Lehr sein, wenn du die Eingabe sichern willst");
        }
        if (!RegExp("[a-zA-Z]").hasMatch(value)) {
          return ("Bitte gib einen Namen an");
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Größe in cm",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );

    return Container(
      height: fullHeight,
      width: fullWidth,
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(top: fullHeight * 0.05),
            child: Text(
              "Tägliches Schrittziel",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          stepField,
          Container(
            margin: EdgeInsets.only(top: fullHeight * 0.05),
            child: Text(
              "Wie groß sind Sie?",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          heightField,
          Container(
            margin: EdgeInsets.only(
                left: fullWidth * 0.15,
                bottom: fullHeight * 0.08,
                right: fullWidth * 0.15),
            alignment: Alignment.bottomCenter,
            child: GradientButtonSmall(
              width: double.infinity,
              height: 60,
              radius: 50.0,
              child: Text(
                "Nächster Schritt".toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xff8A3CFF),
                  Color(0xffC040FF),
                ],
              ),
              onPressed: () {
                if (heightController.text.isEmpty ||
                    stepController.text.isEmpty) {
                  if (heightController.text.isEmpty &&
                      stepController.text.isNotEmpty) {
                    CostumeToast.buildToast('Bitte geben Sie ihr Größe an!',
                        Theme.of(context).secondaryHeaderColor);
                  } else if (heightController.text.isNotEmpty &&
                      stepController.text.isEmpty) {
                    CostumeToast.buildToast(
                        'Bitte geben Sie ihr persönliches Tagesziel in Meter an!',
                        Theme.of(context).secondaryHeaderColor);
                  } else {
                    CostumeToast.buildToast(
                        'Bitte geben Sie ihre Größe und ihr Tagesziel an!',
                        Theme.of(context).secondaryHeaderColor);
                  }
                } else {
                  Preference.shared.setInt(Preference.height, cmHeight!);
                  Preference.shared
                      .setString(Preference.stepsgoal, stepController.text);
                  context.router.push(WeeklyGoalSetRoute());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
