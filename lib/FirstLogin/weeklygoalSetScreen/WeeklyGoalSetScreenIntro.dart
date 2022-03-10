import 'package:flutter/material.dart';
import 'package:sample/AfterLogin/AfterLoginPage.dart';
import 'GradientButtonSmall.dart';
import 'package:sample/utils/Preference.dart';

import '../../utils/Preference.dart';

class WeeklyGoalSetScreen extends StatefulWidget {
  @override
  _WeeklyGoalSetScreenState createState() => _WeeklyGoalSetScreenState();
}

class _WeeklyGoalSetScreenState extends State<WeeklyGoalSetScreen> {
  bool unit = true;
  var distanceKM = 1;

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
        color: Theme.of(context).secondaryHeaderColor,
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
                child: _forHeart(fullHeight, fullWidth),
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
                        "Dein Geschlecht ist:".toUpperCase(),
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
                          Preference.shared
                              .getString(Preference.gender)
                              .toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
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
            ),
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
                        "Die besitzt die Körpergröße:".toUpperCase(),
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
                          Preference.shared
                              .getInt(Preference.height)
                              .toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
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
                        "Das Gewicht beträgt:".toUpperCase(),
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
                          Preference.shared
                              .getInt(Preference.weight)
                              .toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
          Preference.shared.setBool(Preference.FirstTime_Loggin, false);

          //Preference.shared.setInt(Preference.DISTANCE, distanceKM);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => AfterLoginPage(0)),
              (route) => false);
        },
      ),
    );
  }
}
