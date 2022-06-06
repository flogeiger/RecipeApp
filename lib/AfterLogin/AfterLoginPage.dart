import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:sample/models/PagesList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample/utils/Preference.dart';

class AfterLoginPage extends StatefulWidget {
  int _selectedItem;
  AfterLoginPage(this._selectedItem);
  @override
  _AfterLoginPageState createState() => _AfterLoginPageState();
}

class _AfterLoginPageState extends State<AfterLoginPage> {
  PageController? _pageController;
  PageList _pagesList = new PageList();
  @override
  void initState() {
    _pageController = PageController(initialPage: widget._selectedItem);
    Preference.shared.setInt("dailylogin", 1);
    int i = Preference.shared.getInt("logincountmonth") ?? 0;
    int a = Preference.shared.getInt("dailylogin")!;
    int sum = i + a;
    Preference.shared.setInt("logincountmonth", sum);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _pagesList.getList(),
          onPageChanged: (newPage) {
            setState(() {
              widget._selectedItem = newPage;
              if (widget._selectedItem == 3) {
                _checkPermission();
              }
            });
          },
        ),
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: BottomNavigationBar(
              selectedFontSize: 16,
              unselectedFontSize: 14,
              iconSize: 30,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.home,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long_rounded),
                  label: 'Rezepte',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.heart),
                  label: 'Favoriten',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.dumbbell),
                  label: 'Challenges',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.user),
                  label: 'Mein Plan',
                ),
              ],
              currentIndex: widget._selectedItem,
              onTap: (int index) {
                setState(() {
                  this._pageController!.jumpToPage(index);
                });
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _checkPermission() async {
    if (Platform.isAndroid) {
      var status = await Permission.activityRecognition.status;
      if (status.isDenied) {
        var status2 = await Permission.activityRecognition.request();
        if (!status2.isGranted) stepsPermissionDialog();
        return;
      }

      // Navigator.push(
      //context, MaterialPageRoute(builder: (context) => ChallengePage()));
    } else {
      // Navigator.push(
      //    context, MaterialPageRoute(builder: (context) => ChallengePage()));
    }
  }

  void stepsPermissionDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
                "Bitte geben Sie uns Zugriff, um Ihre Aktivitäten für Schritte zu erkennen"),
            actions: [
              TextButton(
                child: Text(
                  "ABBRECHEN".toUpperCase(),
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  "Gehe zu den Einstellungen".toUpperCase(),
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () async {
                  openAppSettings();
                },
              ),
            ],
          );
        });
  }
}
