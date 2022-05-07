import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/FirstLogin/weeklygoalSetScreen/GradientButtonSmall.dart';
import 'package:sample/utils/Preference.dart';
import 'CostumeToast.dart';

class GenderScreen extends StatefulWidget {
  final PageController? controller;
  GenderScreen({this.controller});
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? gender = '';

  final TextEditingController nameController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Dieses Feld darf nicht Lehr sein, wenn du die Eingabe sichern willst");
        }
        if (!RegExp("[a-zA-Z]").hasMatch(value)) {
          return ("Bitte gib einen Namen an");
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
    var fullHeight = MediaQuery.of(context).size.height;
    var fullWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: fullHeight,
        width: fullWidth,
        color: Theme.of(context).secondaryHeaderColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.only(top: fullHeight * 0.05),
              child: Text(
                "Wie heißt du?",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ),
            nameField,
            Container(
              margin: EdgeInsets.only(top: fullHeight * 0.05),
              child: Text(
                "Was ist dein Geschlecht?",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 30),
              ),
            ),
            _maleContanier(fullHeight),
            _femaleContainer(fullHeight),
            InkWell(
              onTap: () {
                if (gender == "" || nameController.text.isEmpty) {
                  if (gender == "" && nameController.text.isNotEmpty) {
                    CostumeToast.buildToast(
                        'Bitte geben Sie ihr Geschlecht an!',
                        Theme.of(context).secondaryHeaderColor);
                  } else if (nameController.text.isEmpty && gender != '') {
                    CostumeToast.buildToast('Bitte geben Sie ihren Namen an!',
                        Theme.of(context).secondaryHeaderColor);
                  } else {
                    CostumeToast.buildToast(
                        'Bitte geben Sie ihren Namen und ihr Geschlecht an!',
                        Theme.of(context).secondaryHeaderColor);
                  }
                } else {
                  Preference.shared
                      .setString(Preference.gender, gender.toString());
                  Preference.shared
                      .setString(Preference.name, nameController.text);
                  widget.controller!.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                }
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
          ],
        ),
      ),
    );
  }

  _maleContanier(double fullHeight) {
    return InkWell(
      onTap: () {
        setState(() {
          gender = 'Männlich';
        });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        margin: EdgeInsets.only(top: fullHeight * 0.1, left: 60, right: 60),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Image.asset(
                'assets/icons/ic_male.png',
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Männlich",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Radio(
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                value: 'Männlich',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = 'Männlich';
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _femaleContainer([double? fullHeight]) {
    return InkWell(
      onTap: () {
        setState(() {
          gender = 'Weiblich';
        });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Theme.of(context).secondaryHeaderColor,
        ),
        margin: EdgeInsets.only(top: 15, left: 60, right: 60, bottom: 20),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Image.asset(
                'assets/icons/ic_female.png',
                width: 40,
                height: 40,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Weiblich",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Radio(
                fillColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                value: 'Weiblich',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = 'Weiblich';
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
