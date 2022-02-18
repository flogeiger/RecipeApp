import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/FirstLogin/weeklygoalSetScreen/GradientButtonSmall.dart';
import 'package:sample/utils/Preference.dart';

class WeightScreen extends StatefulWidget {
  final PageController? controller;
  WeightScreen({this.controller});
  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int? weight = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fullHeight = MediaQuery.of(context).size.height;
    var fullWidth = MediaQuery.of(context).size.width;
    return Container(
      height: fullHeight,
      width: fullWidth,
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(top: fullHeight * 0.05),
            child: Text(
              "Wie viel wiegst du?",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Um dein Fitnessziel zu personalisieren",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          weightUnitPicker(fullHeight),
          weightSelector(fullHeight),
          Expanded(
            child: InkWell(
              onTap: () {
                widget.controller!.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: fullWidth * 0.15,
                    bottom: fullHeight * 0.08,
                    right: fullWidth * 0.15),
                alignment: Alignment.bottomCenter,
                child: GradientButtonSmall(
                  width: double.infinity,
                  height: 60,
                  radius: 50.0,
                  child: Text(
                    "Nächster Schritt".toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  weightUnitPicker(double fullHeight) {
    return Container(
      margin: EdgeInsets.only(top: fullHeight * 0.03),
      height: 60,
      width: 205,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white, width: 1.5),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: Center(
        child: Container(
          width: 100,
          child: Center(
            child: Text(
              "Kg".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  weightSelector(double fullHeight) {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(bottom: fullHeight * 0.025),
                child: Image.asset(
                  "assets/icons/ic_select_pointer.png",
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 125,
              height: fullHeight * 0.32,
              child: CupertinoPicker(
                useMagnifier: true,
                magnification: 1.05,
                selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                  background: Colors.transparent,
                ),
                looping: true,
                scrollController: FixedExtentScrollController(initialItem: 0),
                onSelectedItemChanged: (value) {
                  setState(() {
                    Preference.shared.setInt(Preference.weight, value);
                  });
                },
                itemExtent: 75.0,
                children: List.generate(400, (index) {
                  index += 1;
                  return Text(
                    "$index",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
