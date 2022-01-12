import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:sample/models/PagesList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AfterLoginPage extends StatefulWidget {
  @override
  _AfterLoginPageState createState() => _AfterLoginPageState();
}

class _AfterLoginPageState extends State<AfterLoginPage> {
  int _selectedItem = 0;
  PageController? _pageController;
  PageList _pagesList = new PageList();
  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedItem);
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
              this._selectedItem = newPage;
              if (this._selectedItem == 0) {
                //Hive.openBox<DatabaseRecipes>('Recipe');
              }
              if (this._selectedItem == 3) {
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
                  title: Text(
                    'Home',
                  ),
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.heart),
                  title: Text('Rezepte'),
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.heart),
                  title: Text('Favoriten'),
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.dumbbell),
                  title: Text('Challenges'),
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.user),
                  title: Text('Mein Plan'),
                ),
              ],
              currentIndex: _selectedItem,
              onTap: (int index) {
                this._pageController!.jumpToPage(index);
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
