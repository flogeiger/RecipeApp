import 'package:flutter/material.dart';
import 'package:sample/FirstLogin/weeklygoalSetScreen/GradientButtonSmall.dart';
import 'package:sample/utils/Preference.dart';

enum Gender { Male, Female }

class GenderScreen extends StatefulWidget {
  final PageController? controller;
  GenderScreen({this.controller});
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  Gender? gender = Gender.Male;

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
              "Was ist dein Geschlecht?",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Kalorien & Schrittlängenberechnung\n brauchen",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          _maleContanier(fullHeight),
          _femaleContainer(fullHeight),
          Expanded(
            child: InkWell(
              onTap: () {
                Preference.shared
                    .setString(Preference.gender, gender.toString());
                widget.controller!.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
              child: Container(
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _maleContanier(double fullHeight) {
    return InkWell(
      onTap: () {
        setState(() {
          gender = Gender.Male;
        });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        margin: EdgeInsets.only(top: fullHeight * 0.1, left: 60, right: 60),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Image.asset(
                'assets/icons/ic_male.png',
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Männlich",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Radio(
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                value: Gender.Male,
                groupValue: gender,
                onChanged: (Gender? value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _femaleContainer([double? fullHeight]) {
    return InkWell(
      onTap: () {
        setState(() {
          gender = Gender.Female;
        });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        margin: EdgeInsets.only(top: 15, left: 60, right: 60, bottom: 20),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Image.asset(
                'assets/icons/ic_female.png',
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Weiblich",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Radio(
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                value: Gender.Female,
                groupValue: gender,
                onChanged: (Gender? value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
