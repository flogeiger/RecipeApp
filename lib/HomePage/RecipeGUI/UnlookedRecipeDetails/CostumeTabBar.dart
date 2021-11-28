import 'package:flutter/material.dart';

class CostumeTabBar extends StatefulWidget {
  @override
  _CostumeTabBarState createState() => _CostumeTabBarState();
}

class _CostumeTabBarState extends State<CostumeTabBar>
    with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Text(
          'Informationen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        TabBar(
            controller: _tabController,
            labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Theme.of(context).primaryColor,
            indicatorWeight: 10,
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
              Text(
                'Zutaten',
                style: TextStyle(
                  fontSize: 20,
                  color: _tabController.index == 0
                      ? Theme.of(context).secondaryHeaderColor
                      : Colors.black,
                ),
              ),
              Text(
                'Nährwerte',
                style: TextStyle(
                  fontSize: 20,
                  color: _tabController.index == 1
                      ? Theme.of(context).secondaryHeaderColor
                      : Colors.black,
                ),
              ),
              Text(
                'Schritte',
                style: TextStyle(
                  fontSize: 20,
                  color: _tabController.index == 2
                      ? Theme.of(context).secondaryHeaderColor
                      : Colors.black,
                ),
              ),
            ]),
        SizedBox(
          height: 200,
          child: TabBarView(
            controller: _tabController,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
            ],
          ),
        )
      ],
    );
  }
}
