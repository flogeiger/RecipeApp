import 'dart:async';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pedometer/pedometer.dart';
//import 'package:sample/Database/DataBaseHelper.dart';
//import 'package:sample/models/StepsData.dart';
//import 'Last7DaysStepsScreen.dart';
//import 'StepsPopUpMenu.dart';
//import 'StepsStatisticsScreen.dart';
import 'package:sample/utils/Debug.dart';
import 'package:sample/utils/Preference.dart';
import 'package:sample/utils/Utils.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  bool isPause = true;

  int targetSteps;
  TextEditingController targetStepController = TextEditingController();

  int totalSteps = 0;
  int currentStepCount;
  int oldStepCount;

  double distance;

  String duration;
  int time;
  int oldTime;

  double calories;
  int height;
  int weight;
  bool _isBannerAdReady = false;

  bool isKmSelected;
  // ignore: cancel_subscriptions
  StreamSubscription<StepCount> _stepCountStream;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  List<String> weekDates = [];

  int last7DaysSteps;
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
      if (currentStepCount > 0) {
        currentStepCount = currentStepCount - 1;
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff070E3D),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                //child: Column(
                //children: [
                child: buildStepIndiactorRow(context, fullHeight, fullWidth),
                //Container(
                //margin: EdgeInsets.only(top: fullHeight * 0.08),
                //child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //children: [
                //buildWeekCircularIndicator(
                //fullHeight,
                //allDaysInSingleWord[1],
                //stepsPercentValue.isNotEmpty
                //? stepsPercentValue[0]
                //: 0.0),
                //buildWeekCircularIndicator(
                //fullHeight,
                //allDaysInSingleWord[2],
                //stepsPercentValue.isNotEmpty
                //? stepsPercentValue[1]
                //: 0.0),
                //buildWeekCircularIndicator(
                //fullHeight,
                //allDaysInSingleWord[3],
                //stepsPercentValue.isNotEmpty
                //? stepsPercentValue[2]
                //: 0.0),
                //buildWeekCircularIndicator(
                //fullHeight,
                //allDaysInSingleWord[4],
                //stepsPercentValue.isNotEmpty
                //? stepsPercentValue[3]
                //: 0.0),
                //buildWeekCircularIndicator(
                //fullHeight,
                //allDaysInSingleWord[5],
                //stepsPercentValue.isNotEmpty
                //? stepsPercentValue[4]
                //: 0.0),
                //buildWeekCircularIndicator(
                //fullHeight,
                //allDaysInSingleWord[6],
                //stepsPercentValue.isNotEmpty
                //? stepsPercentValue[5]
                //: 0.0),
                //buildWeekCircularIndicator(
                //fullHeight,
                //allDaysInSingleWord[0],
                //stepsPercentValue.isNotEmpty
                //? stepsPercentValue[6]
                //: 0.0),
                //],
                //),
                //),
                //otherInfo(fullHeight, context),
                //weeklyAverage(fullHeight, fullWidth, context),
                //],
                //),
              ),
            ),
          ],
        ),
      )),
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

  otherInfo(double fullHeight, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: fullHeight * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  builder: (context, snapshot) {
                    time = snapshot.hasData ? snapshot.data + oldTime : 0;
                    Preference.shared.setInt(Preference.OLD_TIME, time);

                    duration = StopWatchTimer.getDisplayTime(
                      time,
                      hours: true,
                      minute: true,
                      second: false,
                      milliSecond: false,
                      hoursRightBreak: "h ",
                    );
                    Preference.shared.setString(Preference.DURATION, duration);
                    return Text(
                      duration + "m",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF)),
                    );
                  }),
              Text(
                "Dauer",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff9195B6)),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                calories.toStringAsFixed(0),
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFFFF)),
              ),
              Text(
                "Kcal",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff9195B6)),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                distance.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFFFF)),
              ),
              Text(
                isKmSelected ? "Km" : "Mile",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff9195B6)),
              ),
            ],
          ),
        ],
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
                  if (currentStepCount > 0) {
                    currentStepCount = currentStepCount - 1;
                  } else {
                    currentStepCount = 0;
                  }
                  _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                  countStep();
                } else {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                  _stepCountStream.cancel();
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
                    color: Color(0xff1B2153),
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
              isPause
                  ? Text(
                      "Schritte",
                      style: TextStyle(
                          color: Color(0xff24BF12),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )
                  : Container(
                      padding: EdgeInsets.all(8),
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Color(0xff1B2153),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          "Angehalten",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    )
            ],
          ),
          InkWell(
            onTap: () {
//Navigator.push(
              //context,
              //MaterialPageRoute(
              //builder: (context) => StepsStatisticsScreen(
              //currentStepCount: currentStepCount)));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff1B2153),
                  ),
                ),
                Image.asset(
                  "assets/icons/ic_statistics.png",
                  height: 15,
                  width: 19,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  editTargetStepsBottomDialog(double fullHeight, double fullWidth) {
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Color(0xffFFFFFF),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: fullHeight * 0.5,
            color: Color(0xff070E3D),
            child: Container(
              decoration: new BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: fullHeight * 0.04, horizontal: fullWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Zielschritte bearbeiten",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: fullHeight * 0.01),
                    Text(
                      "Verbrannte Kalorien, Gehstrecke & Dauer werden entsprechend berechnet.",
                      style: TextStyle(
                          color: Color(0xff9195B6),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: fullHeight * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Schritte",
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              height: 60,
                              width: 167,
                              decoration: BoxDecoration(
                                  color: Color(0xff9195B6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: TextFormField(
                                maxLines: 1,
                                maxLength: 7,
                                controller: targetStepController,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                                cursorColor: Color(0xffFFFFFF),
                                decoration: InputDecoration(
                                  counterText: "",
                                  border: InputBorder.none,
                                ),
                                onEditingComplete: () {
                                  FocusScope.of(context).unfocus();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: fullHeight * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 165,
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xffF15432),
                                Color(0xffFF3E3F)
                              ]),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 25),
                                  spreadRadius: 2,
                                  blurRadius: 50,
                                  color: Color(0x90ff4343),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(
                                      "ABBRECHEN",
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            width: 165,
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff21BE10),
                                Color(0xff7BDE56)
                              ]),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 25),
                                  spreadRadius: 2,
                                  blurRadius: 50,
                                  color: Color(0x902fc31c),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      targetSteps =
                                          int.parse(targetStepController.text);
                                    });
                                    if (targetSteps > 50) {
                                      Preference.shared.setInt(
                                          Preference.TARGET_STEPS, targetSteps);
                                      FocusScope.of(context).unfocus();
                                      Navigator.pop(context);
                                    } else {
                                      //TODO
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      "SPEICHERN",
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      //getStepsDataForCurrentWeek();
      FocusScope.of(context).unfocus();
    });
  }

  stepsIndicator() {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          showTicks: false,
          showLabels: false,
          minimum: 0,
          maximum: targetSteps == null ? 6000 : targetSteps.toDouble(),
          axisLineStyle: AxisLineStyle(
            thickness: 0.19,
            cornerStyle: CornerStyle.bothCurve,
            color: Color(0xff1B2153),
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              value: currentStepCount != null ? currentStepCount.toDouble() : 0,
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
                            color: Color(0xffFFFFFF)),
                      ),
                      Text(
                        targetSteps == null ? "/6000" : "/$targetSteps",
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

        currentStepCount = currentStepCount + 1;
        Preference.shared.setInt(Preference.CURRENT_STEPS, currentStepCount);
      } else {
        setState(() {
          totalSteps = value.steps;
          Preference.shared.setInt(Preference.TOTAL_STEPS, totalSteps);

          currentStepCount = currentStepCount + 1;
          Preference.shared.setInt(Preference.CURRENT_STEPS, currentStepCount);
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
          double value = currentStepCount.toDouble() / targetSteps.toDouble();
          if (value <= 1.0) {
            if (stepsPercentValue.isNotEmpty) {
              stepsPercentValue[i] = value;
            }
          } else {
            stepsPercentValue[i] = 1.0;
          }
        } else {
          setState(() {
            double value = currentStepCount.toDouble() / targetSteps.toDouble();
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
      totalSteps = Preference.shared.getInt(Preference.TOTAL_STEPS);
      oldStepCount = Preference.shared.getInt(Preference.TOTAL_STEPS);
      if (totalSteps != null) {
        currentStepCount = totalSteps - oldStepCount;
      } else {
        currentStepCount = 0;
      }
      Preference.shared.setInt(Preference.CURRENT_STEPS, currentStepCount);

      distance = 0;
      Preference.shared.setDouble(Preference.OLD_DISTANCE, distance);

      calories = 0;
      Preference.shared.setDouble(Preference.OLD_CALORIES, calories);

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
      if (isKmSelected) {
        distance = currentStepCount * 0.0008;
        Preference.shared.setDouble(Preference.OLD_DISTANCE, distance);
      } else {
        distance = currentStepCount * 0.0008 * 0.6214;
        Preference.shared.setDouble(Preference.OLD_DISTANCE, distance);
      }
    } else {
      setState(() {
        if (isKmSelected) {
          distance = currentStepCount * 0.0008;
          Preference.shared.setDouble(Preference.OLD_DISTANCE, distance);
        } else {
          distance = currentStepCount * 0.0008 * 0.6214;
          Preference.shared.setDouble(Preference.OLD_DISTANCE, distance);
        }
      });
    }
  }

  calculateCalories() {
    if (!mounted) {
      calories = currentStepCount * 0.04;
      Preference.shared.setDouble(Preference.OLD_CALORIES, calories);
    } else {
      setState(() {
        calories = currentStepCount * 0.04;
        Preference.shared.setDouble(Preference.OLD_CALORIES, calories);
      });
    }
  }

  setTime() {
    DateTime oldDate;
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

  //@override
  //void onTopBarClick(String name, {bool value = true}) {
  //if (name == "Back") {
  //Navigator.of(context).pop();
  //}

  //if (name == "OPTIONS") {
  //openPopUpMenu(MediaQuery.of(context).size.height,
  //MediaQuery.of(context).size.width);
  //}
  //}
}
