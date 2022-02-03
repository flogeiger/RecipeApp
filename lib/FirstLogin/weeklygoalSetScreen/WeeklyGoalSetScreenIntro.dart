import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GradientButtonSmall.dart';
import 'custom_tabbarview.dart';
import 'package:sample/utils/Debug.dart';
import 'package:sample/utils/Preference.dart';

import '../../utils/Preference.dart';

class WeeklyGoalSetScreen extends StatefulWidget {
  final String? gender;
  final int? height;
  final int? weight;

  WeeklyGoalSetScreen({
    Key? key,
    required this.gender,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  _WeeklyGoalSetScreenState createState() => _WeeklyGoalSetScreenState();
}

class _WeeklyGoalSetScreenState extends State<WeeklyGoalSetScreen> {
  bool kmSelected = true;
  bool mileSelected = false;

  bool unit = true;
  var distanceKM = 1;
  var distanceMILE = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fullHeight = MediaQuery.of(context).size.height;
    var fullWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: fullHeight,
        width: fullWidth,
        color: Color(0xff070E3D),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: fullHeight * 0.15),
              child: Text(
                "Dein Wochenziel ist fertig",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 28),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: fullHeight * 0.07),
                child: CustomTabBar(
                    tab1: "Herz Gesundheit",
                    tab2: "Distanz",
                    forHeart: _forHeart(fullHeight, fullWidth),
                    forDistance: _forDistance(fullHeight)),
              ),
            ),
            _setAsMyGoalButton(fullHeight, fullWidth),
          ],
        ),
      ),
    );
  }

  Widget _forHeart(double fullHeight, double fullWidth) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: fullHeight * 0.06),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xffF9CF45),
                        Color(0xffEE9B1D),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.all(Radius.circular(36))),
                  child: Container(
                    height: 1,
                    width: 1,
                    child: Image.asset("assets/icons/ic_walk.png",
                        scale: 3.8, color: Colors.white),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "150 Minuten zügiges Gehen".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 5.0),
                        child: Text(
                          "Tempo zwischen 9:00 - 15:00 min/km",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9195B6),
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Oder".toUpperCase(),
                style: TextStyle(
                    color: Color(0xff9195B6),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xffFF5757),
                        Color(0xffFF3E3F),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.all(Radius.circular(36))),
                  child: Container(
                      height: 1,
                      width: 1,
                      child: Image.asset("assets/icons/ic_run.png",
                          scale: 3.8, color: Colors.white)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "75 Minuten laufen".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 5.0),
                        child: Text(
                          "Tempo über 9:00 min/km",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9195B6),
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: fullWidth * 0.06, top: fullHeight * 0.05),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/ic_info.webp',
                      scale: 3.4,
                      color: Color(0xff9195B6),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Sie können diese beiden Arten von \nÜbungen miteinander kombinieren.",
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff9195B6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _forDistance(double fullHeight) {
    return Container(
      child: Column(
        children: [
          _distanceUnitTab(fullHeight),
          _curpentinoPickerDesign(fullHeight),
        ],
      ),
    );
  }

  _distanceUnitTab(double fullHeight) {
    return Container(
      margin: EdgeInsets.only(top: fullHeight * 0.03),
      height: 60,
      width: 205,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xff9195B6), width: 1.5),
        color: Color(0xff070E3D),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                kmSelected = true;
                mileSelected = false;
                unit = true;
              });
            },
            child: Container(
              width: 100,
              child: Center(
                child: Text(
                  'KM',
                  style: TextStyle(
                      color: kmSelected ? Colors.white : Color(0xff9195B6),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          Container(
            height: 23,
            child: VerticalDivider(
              color: Color(0xff9195B6),
              width: 1,
              thickness: 1,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                kmSelected = false;
                mileSelected = true;
                unit = false;
              });
            },
            child: Container(
              width: 100,
              child: Center(
                child: Text(
                  'Mile',
                  style: TextStyle(
                      color: mileSelected ? Colors.white : Color(0xff9195B6),
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _setAsMyGoalButton(double fullHeight, double fullWidth) {
    return Container(
      margin: EdgeInsets.only(
          left: fullWidth * 0.15,
          bottom: fullHeight * 0.06,
          right: fullWidth * 0.15),
      alignment: Alignment.bottomCenter,
      child: GradientButtonSmall(
        width: double.infinity,
        height: 60,
        radius: 50.0,
        child: Text(
          "Als mein Ziel festlegen".toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18.0),
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
          convert();
          Preference.shared.setBool(Preference.FirstTime_Loggin, false);

          setDataToPrefs();

          Navigator.of(context).pushNamedAndRemoveUntil(
              '/homeWizardScreen', (Route<dynamic> route) => false);
        },
      ),
    );
  }

  _curpentinoPickerDesign(double fullHeight) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Image.asset(
                "assets/icons/ic_select_pointer.png",
              ),
            ),
          ),
          Container(
            width: 125,
            height: fullHeight * 0.32,
            child: CupertinoPicker(
              backgroundColor: Color(0xff070E3D),
              useMagnifier: true,
              magnification: 1.05,
              looping: true,
              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                background: Colors.transparent,
              ),
              onSelectedItemChanged: (value) {
                setState(() {
                  if (unit == false) {
                    value += 1;
                    distanceMILE = value;
                  } else {
                    value += 1;
                    distanceKM = value;
                  }
                });
              },
              itemExtent: 75.0,
              children: unit == false
                  ? List.generate(2155, (index) {
                      index += 1;
                      return Text(
                        "$index",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold),
                      );
                    })
                  : List.generate(978, (index) {
                      index += 1;
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
          (kmSelected == true)
              ? Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "Km",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    "Mile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
        ],
      ),
    );
  }

  setDataToPrefs() {
    if (Debug.STORE_RES_IN_PREF) {
      Preference.shared.setString(Preference.GENDER, widget.gender!);

      Preference.shared.setInt(Preference.WEIGHT, widget.weight!);

      Preference.shared.setInt(Preference.HEIGHT, widget.height!);

      Preference.shared.setInt(Preference.DISTANCE, distanceKM);
    }
  }

  convert() {
    if (unit == false) {
      var d = distanceMILE * 1.609;
      distanceKM = d.toInt();
    }
  }
}
