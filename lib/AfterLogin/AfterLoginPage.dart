import 'package:flutter/material.dart';
import 'package:sample/models/PagesList.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AfterLoginPage extends StatefulWidget {
  @override
  _AfterLoginPageState createState() => _AfterLoginPageState();
}

class _AfterLoginPageState extends State<AfterLoginPage> {
  int _selectedItem = 0;
  PageController _pageController;
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
                  icon: Icon(
                    OMIcons.restaurantMenu,
                  ),
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
                this._pageController.jumpToPage(index);
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).secondaryHeaderColor,
            ),
          ),
        ),
      ),
    );
    ;
  }
}
