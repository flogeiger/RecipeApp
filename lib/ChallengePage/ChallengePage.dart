import 'dart:async';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:googleapis/mybusinessbusinessinformation/v1.dart';
import 'package:pedometer/pedometer.dart';
import 'package:sample/ChallengePage/ChallangeTabBar.dart';
import 'package:sample/ChallengePage/PointHistory.dart';
import 'package:sample/ChallengePage/RewardPage.dart';
import 'package:sample/utils/Debug.dart';
import 'package:sample/utils/Preference.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  bool isPause = true;

  int? targetSteps;
  TextEditingController targetStepController = TextEditingController();

  int totalSteps = 0;
  int? currentStepCount;
  int? oldStepCount;

  double? distance;
  String? duration;
  int? time;
  int? oldTime;

  double? calories;
  int? height;
  int? weight;

  bool? isKmSelected;
  // ignore: cancel_subscriptions
  StreamSubscription<StepCount>? _stepCountStream;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  List<String> weekDates = [];

  int? last7DaysSteps;
//getLocale().languageCode kommt in EEEE() variable
// ist im orginal projekt unter diesem Pfad zu finden
//import 'package:run_tracker/localization/locale_constant.dart';
  List<String> allDaysInSingleWord =
      DateFormat.EEEE().dateSymbols.NARROWWEEKDAYS;

  @override
  void initState() {
    getPreference();
    getisPauseFromPrefs();
    setTime();
    calculateDistance();
    //DataBaseHelper().getAllStepsData();
    //getStepsDataForCurrentWeek();
    getLast7DaysSteps();
    super.initState();
  }

  getisPauseFromPrefs() {
    isPause = Preference.shared.getBool(Preference.IS_PAUSE) ?? true;

    if (isPause == true) {
      if (currentStepCount! > 0) {
        currentStepCount = currentStepCount! - 1;
      } else {
        currentStepCount = 0;
      }
      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
      countStep();
    }
  }

  DateTime currentDate = DateTime.now();

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  //List<StepsData> stepsData;
  Map<String, int> map = {};

  List<double> stepsPercentValue = [];

  @override
  Widget build(BuildContext context) {
    var fullHeight = MediaQuery.of(context).size.height;
    var fullWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        //Googlen !!! kp was das tut
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            title: Center(child: Text('Herausforderung'))),
        body: ListView(
          shrinkWrap: true,
          children: [
            buildStepIndiactorRow(context, fullHeight, fullWidth),
            SizedBox(
              height: 25,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PointHistoryPage()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'Punktestand',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => RewardPage(),
                        ));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 2),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'Belohnungen',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ChallangeTabBar(),
          ],
        ),
      ),
    );
  }

  weeklyAverage(double fullHeight, double fullWidth, BuildContext context) {
    return InkWell(
      onTap: () {
//        Navigator.push(context,
        //MaterialPageRoute(builder: (context) => Last7DaysStepsScreen()));
      },
      child: Container(
        margin: EdgeInsets.only(
            top: fullHeight * 0.1,
            right: fullWidth * 0.04,
            left: fullWidth * 0.04,
            bottom: fullHeight * 0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0xff1B2153),
        ),
        padding: EdgeInsets.symmetric(
            vertical: fullWidth * 0.04, horizontal: fullWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Letzte 7 Tage Schritte:",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFFFFFF)),
            ),
            Container(
              margin: EdgeInsets.only(top: fullHeight * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    last7DaysSteps != null ? last7DaysSteps.toString() : "0",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFFFFFF)),
                  ),
                  Visibility(
                    visible: true,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff070E3D),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/ic_arrow_green_gradient.png",
                          height: 12,
                          width: 7.41,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildWeekCircularIndicator(double fullHeight, String weekDay, double value) {
    return Column(
      children: [
        CircularProgressIndicator(
          strokeWidth: 5,
          value: value,
          valueColor: AlwaysStoppedAnimation(Color(0xff24BF12)),
          backgroundColor: Color(0xff1B2153),
        ),
        Container(
          margin: EdgeInsets.only(top: fullHeight * 0.02),
          child: Text(
            weekDay,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xffFFFFFF)),
          ),
        ),
      ],
    );
  }

  buildStepIndiactorRow(
      BuildContext context, double fullHeight, double fullWidth) {
    return Container(
      margin: EdgeInsets.only(
        left: fullWidth * 0.02,
        right: fullWidth * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isPause = !isPause;
                Preference.shared.setBool(Preference.IS_PAUSE, isPause);
              });

              Future.delayed(Duration(milliseconds: 100), () {
                if (isPause == true) {
                  if (currentStepCount! > 0) {
                    currentStepCount = currentStepCount! - 1;
                  } else {
                    currentStepCount = 0;
                  }
                  _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                  countStep();
                } else {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                  _stepCountStream!.cancel();
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                Image.asset(
                  isPause == false
                      ? "assets/icons/ic_play.png"
                      : "assets/icons/ic_pause.png",
                  height: 14,
                  width: 12,
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: fullHeight * 0.02),
                width: fullWidth * 0.7,
                height: fullHeight * 0.3,
                child: stepsIndicator(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  stepsIndicator() {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          showTicks: false,
          showLabels: false,
          minimum: 0,
          maximum: targetSteps == null ? 6000 : targetSteps!.toDouble(),
          axisLineStyle: AxisLineStyle(
            thickness: 0.19,
            cornerStyle: CornerStyle.bothCurve,
            color: Theme.of(context).secondaryHeaderColor,
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              value:
                  currentStepCount != null ? currentStepCount!.toDouble() : 0,
              gradient:
                  SweepGradient(colors: [Color(0xff21BE10), Color(0xff7BDE56)]),
              cornerStyle: CornerStyle.bothCurve,
              width: 0.19,
              sizeUnit: GaugeSizeUnit.factor,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                positionFactor: 0.1,
                angle: 90,
                widget: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentStepCount.toString(),
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                      Text(
                        targetSteps == null ? "/12000" : "/$targetSteps",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff9195B6)),
                      ),
                    ],
                  ),
                ))
          ])
    ]);
  }

  countStep() {
    _stepCountStream = Pedometer.stepCountStream.listen((value) async {
      if (!mounted) {
        totalSteps = value.steps;
        Preference.shared.setInt(Preference.TOTAL_STEPS, totalSteps);

        currentStepCount = currentStepCount! + 1;
        Preference.shared.setInt(Preference.CURRENT_STEPS, currentStepCount!);
      } else {
        setState(() {
          totalSteps = value.steps;
          Preference.shared.setInt(Preference.TOTAL_STEPS, totalSteps);

          currentStepCount = currentStepCount! + 1;
          Preference.shared.setInt(Preference.CURRENT_STEPS, currentStepCount!);
        });
      }
      calculateDistance();
      calculateCalories();
      getTodayStepsPercent();
    }, onError: (error) {
      totalSteps = 0;
      Debug.printLog("Error: $error");
    }, cancelOnError: false);
  }

  getTodayStepsPercent() {
    var todayDate = getDate(DateTime.now()).toString();
    if (targetSteps == null) {
      targetSteps = 6000;
    }
    for (int i = 0; i < weekDates.length; i++) {
      if (todayDate == weekDates[i]) {
        if (!mounted) {
          double value = currentStepCount!.toDouble() / targetSteps!.toDouble();
          if (value <= 1.0) {
            if (stepsPercentValue.isNotEmpty) {
              stepsPercentValue[i] = value;
            }
          } else {
            stepsPercentValue[i] = 1.0;
          }
        } else {
          setState(() {
            double value =
                currentStepCount!.toDouble() / targetSteps!.toDouble();
            if (value <= 1.0) {
              if (stepsPercentValue.isNotEmpty) {
                stepsPercentValue[i] = value;
              }
            } else {
              stepsPercentValue[i] = 1.0;
            }
          });
        }
      }
    }
  }

  // openPopUpMenu(fullHeight, fullWidth) async {
  //final String result = await Navigator.push(context, StepsPopUpMenu());

  //if (result == "Edit target") {
  //setState(() {
  //var prefSteps = Preference.shared.getInt(Preference.TARGET_STEPS);

  //if (prefSteps != null) {
  //targetStepController.text = prefSteps.toString();
  //} else {
  //targetStepController.text = 6000.toString();
  //}
  //editTargetStepsBottomDialog(fullHeight, fullWidth);
  //});
  //}

  //if (result == "Reset") {
  //resetData();
  //}

  //if (result == "Turn off") {
  //setState(() {
  //if (isPause) {
  //_stopWatchTimer.onExecute.add(StopWatchExecute.stop);
  //_stepCountStream.cancel();
  //isPause = false;
  //Preference.shared.setBool(Preference.IS_PAUSE, isPause);
  //}
  //});
  //}
  //}

  getPreference() {
    targetSteps = Preference.shared.getInt(Preference.TARGET_STEPS) ?? 6000;
    currentStepCount = Preference.shared.getInt(Preference.CURRENT_STEPS) ?? 0;
    oldTime = Preference.shared.getInt(Preference.OLD_TIME) ?? 0;
    duration = Preference.shared.getString(Preference.DURATION) ?? "00h 0";
    distance = Preference.shared.getDouble(Preference.OLD_DISTANCE) ?? 0;
    calories = Preference.shared.getDouble(Preference.OLD_CALORIES) ?? 0;
    height = Preference.shared.getInt(Preference.HEIGHT) ?? 164;
    weight = Preference.shared.getInt(Preference.WEIGHT) ?? 50;
    isKmSelected = Preference.shared.getBool(Preference.IS_KM_SELECTED) ?? true;
  }

  resetData() {
    setState(() {
      totalSteps = Preference.shared.getInt(Preference.TOTAL_STEPS)!;
      oldStepCount = Preference.shared.getInt(Preference.TOTAL_STEPS);
      if (totalSteps != null) {
        currentStepCount = totalSteps - oldStepCount!;
      } else {
        currentStepCount = 0;
      }
      Preference.shared.setInt(Preference.CURRENT_STEPS, currentStepCount!);

      distance = 0;
      Preference.shared.setDouble(Preference.OLD_DISTANCE, distance!);

      calories = 0;
      Preference.shared.setDouble(Preference.OLD_CALORIES, calories!);

      oldTime = 0;
      _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    });
    if (isPause) _stopWatchTimer.onExecute.add(StopWatchExecute.start);

    var todayDate = getDate(DateTime.now()).toString();
    for (int i = 0; i < weekDates.length; i++) {
      if (todayDate == weekDates[i]) {
        setState(() {
          stepsPercentValue[i] = 0;
        });
      }
    }
  }

  calculateDistance() {
    if (!mounted) {
      if (isKmSelected!) {
        distance = currentStepCount! * 0.0008;
        Preference.shared.setDouble(Preference.OLD_DISTANCE, distance!);
      } else {
        distance = currentStepCount! * 0.0008 * 0.6214;
        Preference.shared.setDouble(Preference.OLD_DISTANCE, distance!);
      }
    } else {
      setState(() {
        if (isKmSelected!) {
          distance = currentStepCount! * 0.0008;
          Preference.shared.setDouble(Preference.OLD_DISTANCE, distance!);
        } else {
          distance = currentStepCount! * 0.0008 * 0.6214;
          Preference.shared.setDouble(Preference.OLD_DISTANCE, distance!);
        }
      });
    }
  }

  calculateCalories() {
    if (!mounted) {
      calories = currentStepCount! * 0.04;
      Preference.shared.setDouble(Preference.OLD_CALORIES, calories!);
    } else {
      setState(() {
        calories = currentStepCount! * 0.04;
        Preference.shared.setDouble(Preference.OLD_CALORIES, calories!);
      });
    }
  }

  setTime() {
    DateTime? oldDate;
    var date = Preference.shared.getString(Preference.DATE);
    if (date != null) {
      oldDate = DateTime.parse(date);
    }

    var currentDate = getDate(DateTime.now());
    Preference.shared.setString(Preference.DATE, currentDate.toString());

    if (oldDate != null) {
      if (currentDate != oldDate) {
        //DataBaseHelper().insertSteps(StepsData(
        //steps: currentStepCount,
        //targetSteps: targetSteps != null ? targetSteps : 6000,
        //cal: calories.toInt(),
        //distance: distance,
        //duration: duration,
        //time: Utils.getCurrentDayTime(),
        //stepDate: oldDate.toString(),
        //dateTime: Utils.getCurrentDateTime()));
        //resetData();
      }
    }
  }

  //getStepsDataForCurrentWeek() async {
  //for (int i = 0; i <= 6; i++) {
  //var currentWeekDates = getDate(DateTime.now()
  //.subtract(Duration(days: currentDate.weekday - 1))
  //.add(Duration(days: i)));
  //weekDates.add(currentWeekDates.toString());
  //}
  ////stepsData = await DataBaseHelper().getStepsForCurrentWeek();

  //for (int i = 0; i < weekDates.length; i++) {
  //bool isMatch = false;
  //stepsData.forEach((element) {
  //if (element.stepDate == weekDates[i]) {
  //isMatch = true;
  //setState(() {
  //double value = element.steps.toDouble() / targetSteps.toDouble();
  //if (value <= 1.0) {
  //stepsPercentValue.add(value);
  //} else {
  //stepsPercentValue.add(1.0);
  //}
  //});
  //}
  //});
  //if (!isMatch) {
  //setState(() {
  //stepsPercentValue.add(0.0);
  //});
  //}
  //}
  //getTodayStepsPercent();
  //}

  getLast7DaysSteps() async {
    // last7DaysSteps = await DataBaseHelper().getTotalStepsForLast7Days();
    setState(() {});
  }
}
