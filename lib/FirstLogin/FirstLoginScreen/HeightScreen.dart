import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/FirstLogin/weeklygoalSetScreen/GradientButtonSmall.dart';
import 'package:sample/FirstLogin/weeklygoalSetScreen/WeeklyGoalSetPage.dart';
import 'package:sample/utils/Preference.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sample/utils/routes/routes.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fullHeight = MediaQuery.of(context).size.height;
    var fullWidth = MediaQuery.of(context).size.width;

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
              "Wie groß sind Sie?",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Um dein Fitnessziel zu personalisieren",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          _heightUnitPicker(fullHeight),
          _heightSelector(fullHeight),
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
                Preference.shared.setInt(Preference.height, cmHeight!);
                context.router.push(WeeklyGoalSetRoute());
              },
            ),
          ),
        ],
      ),
    );
  }

  _heightUnitPicker(double fullHeight) {
    return Container(
      margin: EdgeInsets.only(top: fullHeight * 0.03),
      height: 60,
      width: 205,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white, width: 1.5),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: Center(
        child: Container(
          width: 100,
          child: Center(
            child: Text(
              "CM",
              style: TextStyle(
                  color: cmSelected ? Colors.white : Color(0xff9195B6),
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  _heightSelector(double fullHeight) {
    if (unit == false) {
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: fullHeight * 0.025),
                    child: Image.asset(
                      "assets/icons/ic_select_pointer.png",
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 125,
                  height: 300,
                  child: CupertinoPicker(
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    useMagnifier: true,
                    magnification: 1.05,
                    looping: true,
                    selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                      background: Colors.transparent,
                    ),
                    onSelectedItemChanged: (value) {
                      setState(() {
                        cmHeight = value;
                      });
                    },
                    itemExtent: 75.0,
                    children: List.generate(14, (index) {
                      return Text(
                        "$index '",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(bottom: fullHeight * 0.025),
                child: Image.asset(
                  "assets/icons/ic_select_pointer.png",
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 125,
              height: 300,
              child: CupertinoPicker(
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                useMagnifier: true,
                magnification: 1.05,
                looping: true,
                selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                  background: Colors.transparent,
                ),
                onSelectedItemChanged: (value) {
                  setState(() {
                    value += 20;
                    cmHeight = value;
                  });
                },
                itemExtent: 75.0,
                children: List.generate(381, (index) {
                  index += 20;
                  return Text(
                    "$index",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold),
                  );
                }),
              ),
            ),
          ],
        ),
      );
    }
  }
}
