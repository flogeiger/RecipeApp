import 'package:flutter/material.dart';
import 'package:sample/FirstLogin/weeklygoalSetScreen/GradientButtonSmall.dart';

class WelcomeDialogScreen extends StatefulWidget {
  @override
  _WelcomeDialogScreenState createState() => _WelcomeDialogScreenState();
}

class _WelcomeDialogScreenState extends State<WelcomeDialogScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff070E3D),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            margin: EdgeInsets.only(top: 60.0),
            child: Container(
              padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 100.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Hallo, Willkommen bei\n" + "Läufer App",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: 0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                    child: Text(
                      "Ich bin Kate, dein persönlicher Fitnesstrainer.",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xff9195B6),
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Bevor wir anfangen, bitte\n Lassen Sie uns Sie besser wissen, um Ihnen bei der Einstellung zu helfen\n persönliches Fitnessziel.",
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xff9195B6),
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 60.0, right: 60.0, bottom: 60.0, top: 60.0),
                    child: GradientButtonSmall(
                      width: double.infinity,
                      height: 60,
                      radius: 50.0,
                      child: Text(
                        "Okay",
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
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: Color(0xff070E3D),
            ),
            child: Image.asset(
              'assets/icons/dummy_girl.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
