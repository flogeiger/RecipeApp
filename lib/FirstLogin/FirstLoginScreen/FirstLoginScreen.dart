import 'package:flutter/material.dart';
import 'package:sample/FirstLogin/FirstLoginScreen/SlideDots.dart';
import 'WelcomeDialogScreen.dart';
import 'GenderScreen.dart';
import 'HeightScreen.dart';
import 'WeightScreen.dart';

class FirstLoginScreen extends StatefulWidget {
  @override
  FirstLoginScreenState createState() => FirstLoginScreenState();
}

class FirstLoginScreenState extends State<FirstLoginScreen> {
  PageController pageController = new PageController();

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

  List<Widget> _pages = [
    Container(),
    Container(),
    Container(),
  ];
  int _currentPage = 0;
  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  bool? wasActive;
  int? postion = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).secondaryHeaderColor,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: <Widget>[
                          _currentPage > 0
                              ? InkWell(
                                  onTap: () {
                                    pageController.previousPage(
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.easeIn);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.height *
                                        0.06,
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            width: 125,
                          ),
                          for (int i = 0; i < _pages.length; i++)
                            if (i == _currentPage)
                              SlideDots(true)
                            else
                              SlideDots(false)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 9,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: _onchanged,
                  controller: pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GenderScreen(controller: pageController),
                    WeightScreen(controller: pageController),
                    HeightScreen(controller: pageController)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
