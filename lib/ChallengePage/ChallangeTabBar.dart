import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sample/utils/Preference.dart';

class ChallangeTabBar extends StatefulWidget {
  @override
  _ChallangeTabBarState createState() => _ChallangeTabBarState();
}

class _ChallangeTabBarState extends State<ChallangeTabBar>
    with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController!.addListener(_handleTabSelection);
    Preference.shared.setInt(Preference.checkChallengePage, 1);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  int _currentSelection = 0;

  _selectedItem(int id) {
    _currentSelection = id;
  }

  double _percentindactor(int val) {
    double val = Preference.shared.getDouble(Preference.stepscurrentcount) ?? 0;
    String targetSteps =
        Preference.shared.getString(Preference.stepsgoal) ?? "12000";
    if (val == 0) {
      Preference.shared.setDouble(Preference.percentageindicatorsteps, val);
      return 0.0;
    } else if (val % 200 == 0) {
      Preference.shared.setDouble(Preference.percentageindicatorsteps, val);
      double result = val / double.parse(targetSteps);
      ;
      return result;
    } else {
      double? oldval =
          Preference.shared.getDouble(Preference.percentageindicatorsteps) ?? 0;
      return oldval;
    }
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        TabBar(
          controller: _tabController,
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
          height: MediaQuery.of(context).size.height * 0.5,
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                color: Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: CircleAvatar(
                                      child: Center(
                                        child: Icon(
                                          Icons.receipt_long_outlined,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.11,
                                        ),
                                      ),
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      backgroundColor:
                                          Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 17,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Aufgaben',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Überprüfe den Aufgabenstatus',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 5),
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            backgroundColor:
                                                Theme.of(context).canvasColor,
                                            progressColor:
                                                Theme.of(context).primaryColor,
                                            animationDuration: 100,
                                            lineHeight: 10,
                                            percent: 0.4,
                                            trailing: Text(
                                              '0/1',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .canvasColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: CircleAvatar(
                                      child: Center(
                                        child: Icon(
                                          Icons.receipt_long_outlined,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.11,
                                        ),
                                      ),
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      backgroundColor:
                                          Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 17,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Rezept',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Koche ein Gericht nach Anleitung',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 5),
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            backgroundColor:
                                                Theme.of(context).canvasColor,
                                            progressColor:
                                                Theme.of(context).primaryColor,
                                            animationDuration: 100,
                                            lineHeight: 10,
                                            percent: 0.4,
                                            trailing: Text(
                                              '0/1',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .canvasColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: CircleAvatar(
                                      child: Center(
                                        child: Icon(
                                          Icons.receipt_long_outlined,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.11,
                                        ),
                                      ),
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      backgroundColor:
                                          Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 17,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Schritte',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Gehe 10.000 Schritte an einem Tag',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 5),
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.39,
                                            backgroundColor:
                                                Theme.of(context).canvasColor,
                                            progressColor:
                                                Theme.of(context).primaryColor,
                                            animationDuration: 100,
                                            lineHeight: 10,
                                            percent: _percentindactor(0),
                                            trailing: Text(
                                              '1000/10000',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .canvasColor,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.018),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                color: Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: CircleAvatar(
                                      child: Center(
                                        child: Icon(
                                          Icons.receipt_long_outlined,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.11,
                                        ),
                                      ),
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      backgroundColor:
                                          Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 17,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Melde dich 25 mal in der App an',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 5),
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            backgroundColor:
                                                Theme.of(context).canvasColor,
                                            progressColor:
                                                Theme.of(context).primaryColor,
                                            animationDuration: 100,
                                            lineHeight: 10,
                                            percent: 0.4,
                                            trailing: Text(
                                              '0/25',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .canvasColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: CircleAvatar(
                                      child: Center(
                                        child: Icon(
                                          Icons.receipt_long_outlined,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.11,
                                        ),
                                      ),
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      backgroundColor:
                                          Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 17,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Rezept',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Koche 20 Gerichte nach Anleitung',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 5),
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            backgroundColor:
                                                Theme.of(context).canvasColor,
                                            progressColor:
                                                Theme.of(context).primaryColor,
                                            animationDuration: 100,
                                            lineHeight: 10,
                                            percent: 0.4,
                                            trailing: Text(
                                              '0/20',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .canvasColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: CircleAvatar(
                                      child: Center(
                                        child: Icon(
                                          Icons.receipt_long_outlined,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.11,
                                        ),
                                      ),
                                      radius:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      backgroundColor:
                                          Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 17,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Schritte',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                            left: 3,
                                          ),
                                          child: Text(
                                            'Gehe 500.000 Schritte',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).canvasColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 5),
                                          child: LinearPercentIndicator(
                                            animation: true,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            backgroundColor:
                                                Theme.of(context).canvasColor,
                                            progressColor:
                                                Theme.of(context).primaryColor,
                                            animationDuration: 100,
                                            lineHeight: 10,
                                            percent: 0.4,
                                            trailing: Text(
                                              '0/500000',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .canvasColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
