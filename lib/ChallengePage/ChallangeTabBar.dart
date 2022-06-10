import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sample/Provider/CookingRecipesMonthAmountProvider.dart';
import 'package:sample/Provider/StepMonthAmountProvider.dart';
import 'package:sample/Provider/loginmonthAmountProvider.dart';
import 'package:sample/Provider/stepAmountProvider.dart';
import 'package:sample/utils/Preference.dart';

class ChallengeTabBar extends StatefulWidget {
  @override
  _ChallengeTabBarState createState() => _ChallengeTabBarState();
}

class _ChallengeTabBarState extends State<ChallengeTabBar>
    with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController!.addListener(_handleTabSelection);
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
    int val = Preference.shared.getInt(Preference.stepscurrentcount) ?? 0;
    String targetSteps = Preference.shared.getString(Preference.stepsgoal)!;
    if (val == 0) {
      Preference.shared
          .setDouble(Preference.percentageindicatorsteps, val.toDouble());
      return 0.0;
    } else if (val % 200 == 0) {
      Preference.shared
          .setDouble(Preference.percentageindicatorsteps, val.toDouble());
      double result = val / double.parse(targetSteps);
      ;
      return result;
    } else {
      double? oldval =
          Preference.shared.getDouble(Preference.percentageindicatorsteps) ?? 0;
      return oldval;
    }
  }

  int checkifStepcountzero(int stepcount) {
    int currentstep =
        Preference.shared.getInt(Preference.stepscurrentcount) ?? 0;
    if (stepcount == 0) {
      if (currentstep == 0) {
        return 0;
      } else {
        return currentstep;
      }
    } else {
      return stepcount;
    }
  }

  int checkifLogincountzero(int logincount) {
    int currentlogincount =
        Preference.shared.getInt(Preference.logincount) ?? 0;
    if (logincount == 0) {
      if (currentlogincount == 0) {
        return 0;
      } else {
        return currentlogincount;
      }
    } else {
      return logincount;
    }
  }

  int checkifCookingRecipecountzero(int recipeMonthCount) {
    int currentCookingRecipecount =
        Preference.shared.getInt(Preference.cookingcount) ?? 0;
    if (recipeMonthCount == 0) {
      if (currentCookingRecipecount == 0) {
        return 0;
      } else {
        return currentCookingRecipecount;
      }
    } else {
      return recipeMonthCount;
    }
  }

  int checkifStepMonthcountzero(int stepMonthcount) {
    int currentstepMonthcount =
        Preference.shared.getInt(Preference.stepMonthcount) ?? 0;
    if (stepMonthcount == 0) {
      if (currentstepMonthcount == 0) {
        return 0;
      } else {
        return currentstepMonthcount;
      }
    } else {
      return stepMonthcount;
    }
  }

  Widget build(BuildContext context) {
    int stepcount = Provider.of<StepAmountProvider>(context).stepcount;
    int stepMonthcount =
        Provider.of<StepMonthAmountProvider>(context).stepcount;
    int loginMonthcount =
        Provider.of<LoginMonthAmountProvider>(context).logincount;
    int recipeMonthCount =
        Provider.of<CookingRecipesMonthAmountProvider>(context).cookingcount;
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
                              child: Preference.shared.getBool(
                                          Preference.checkTodayslogin) ==
                                      false
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
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
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .height *
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
                                                    color: Theme.of(context)
                                                        .canvasColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
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
                                                    color: Theme.of(context)
                                                        .canvasColor,
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
                                                      Theme.of(context)
                                                          .canvasColor,
                                                  progressColor:
                                                      Theme.of(context)
                                                          .primaryColor,
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
                                    )
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
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
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .height *
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
                                                    color: Theme.of(context)
                                                        .canvasColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
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
                                                    color: Theme.of(context)
                                                        .canvasColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8, left: 3),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'erledigt!',
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .canvasColor),
                                                    ),
                                                    CircleAvatar(
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.check,
                                                          color: Theme.of(
                                                                  context)
                                                              .secondaryHeaderColor,
                                                          size: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.04,
                                                        ),
                                                      ),
                                                      radius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.009,
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .canvasColor,
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
                              child: Preference.shared.getBool(
                                          Preference.checkTodayscooking) ==
                                      false
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
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
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .height *
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
                                                    color: Theme.of(context)
                                                        .canvasColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
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
                                                    color: Theme.of(context)
                                                        .canvasColor,
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
                                                      Theme.of(context)
                                                          .canvasColor,
                                                  progressColor:
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  animationDuration: 100,
                                                  lineHeight: 10,
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
                                    )
                                  : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
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
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .height *
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
                                                    color: Theme.of(context)
                                                        .canvasColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
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
                                                  'Koche ein Rezept',
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .canvasColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8, left: 3),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'erledigt!',
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .canvasColor),
                                                    ),
                                                    CircleAvatar(
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.check,
                                                          color: Theme.of(
                                                                  context)
                                                              .secondaryHeaderColor,
                                                          size: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.04,
                                                        ),
                                                      ),
                                                      radius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.009,
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .canvasColor,
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
                                            'Gehe ${Preference.shared.getString(Preference.stepsgoal)} Schritte an einem Tag',
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
                                              '${checkifStepcountzero(stepcount)}/${Preference.shared.getString(Preference.stepsgoal)}',
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
                                            percent: 0.1,
                                            trailing: Text(
                                              '${checkifLogincountzero(loginMonthcount)} /25',
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
                                            'Koche 40 Gerichte nach Anleitung',
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
                                              '${checkifCookingRecipecountzero(recipeMonthCount)}/20',
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
                                              '${checkifStepMonthcountzero(stepMonthcount)}/500000',
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
