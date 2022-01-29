import 'package:flutter/material.dart';

class ChallangeTabBar extends StatefulWidget {
  @override
  _ChallangeTabBarState createState() => _ChallangeTabBarState();
}

class _ChallangeTabBarState extends State<ChallangeTabBar> {
  int _currentSelection = 0;

  _selectedItem(int id) {
    _currentSelection = id;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TabBar(
            labelColor: Theme.of(context).primaryColor,
            labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
            onTap: (index) {
              setState(() {
                _selectedItem(index);
              });
            },
            indicator: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).secondaryHeaderColor,
                  width: 3,
                ),
              ),
            ),
            tabs: [
              Tab(
                child: Text(
                  'Täglich',
                  style: TextStyle(
                    fontSize: 20,
                    color: _currentSelection == 0
                        ? Theme.of(context).secondaryHeaderColor
                        : Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Monatlich',
                  style: TextStyle(
                    fontSize: 20,
                    color: _currentSelection == 1
                        ? Theme.of(context).secondaryHeaderColor
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            color: Theme.of(context).secondaryHeaderColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                          child: Divider(
                            color: Colors.teal.shade100,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                          child: Divider(
                            color: Colors.teal.shade100,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: BoxDecoration(
                            color: Theme.of(context).secondaryHeaderColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
