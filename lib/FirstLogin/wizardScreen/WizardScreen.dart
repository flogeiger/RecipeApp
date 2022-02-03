import 'package:flutter/material.dart';
import 'WelcomeDialogScreen.dart';
import 'GenderScreen.dart';
import 'HeightScreen.dart';
import 'WeightScreen.dart';

class WizardScreen extends StatefulWidget {
  @override
  WizardScreenState createState() => WizardScreenState();
}

class WizardScreenState extends State<WizardScreen> {
  double? _updateValue;
  PageController pageController = new PageController();
  bool isBack = false;
  late int pageNum;

  String? genderSelected;
  int? weightSelected;

  void onGender(String gender) {
    setState(() {
      genderSelected = gender;
    });
  }

  void onWeight(int weight) {
    setState(() {
      weightSelected = weight;
    });
  }

  @override
  void initState() {
    super.initState();

    pageNum = 1;

    _updateValue = 0.33;

    Future.delayed(Duration(seconds: 1), () {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: true,
          enableDrag: false,
          builder: (context) {
            return Wrap(
              children: [
                WelcomeDialogScreen(),
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff070E3D),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: _progressTopBar(),
              ),
              Flexible(
                flex: 9,
                child: new PageView(
                  onPageChanged: (pos) {
                    setState(() {
                      isBack = (pos != 0);
                    });
                  },
                  controller: pageController,
                  physics: new NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    GenderScreen(
                      pageController: pageController,
                      updatevalue: updateValue,
                      isBack: isBack,
                      pageNum: updagePageNumber,
                      onGender: onGender,
                      gender: genderSelected,
                      wizardScreenState: this,
                    ),
                    WeightScreen(
                      pageController: pageController,
                      updatevalue: updateValue,
                      isBack: isBack,
                      pageNum: updagePageNumber,
                      onWeight: onWeight,
                      wizardScreenState: this,
                      weight: weightSelected,
                    ),
                    HeightScreen(
                      isBack: isBack,
                      wizardScreenState: this,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateValue(double progress) {
    setState(() {
      _updateValue = progress;
      if (_updateValue!.toStringAsFixed(1) == '1.2') {
        _updateValue = 0.0;
        return;
      }
    });
  }

  updagePageNumber(int newnum) {
    setState(() {
      pageNum = newnum;
    });
  }

  _progressTopBar() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: isBack,
            child: InkWell(
              onTap: () {
                if (pageController.hasClients) {
                  if (pageController.page!.round() == 0) {
                    setState(() {
                      isBack = false;
                    });
                  }
                  if (pageController.page!.round() != 0) {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                    updateValue(_updateValue! - 0.30);
                    updagePageNumber(pageNum - 1);
                  }
                }
              },
              child: Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff1B2153),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                      child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ))),
            ),
          ),
          if (!isBack)
            Container(
              height: 50,
              width: 60,
            ),
          Expanded(
            child: UnconstrainedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: Container(
                  width: 100,
                  child: LinearProgressIndicator(
                    backgroundColor: Color(0xff1B2153),
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      Color(0xffC040FF),
                    ),
                    minHeight: 8,
                    value: _updateValue,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              pageNum.toString() + "/3",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
