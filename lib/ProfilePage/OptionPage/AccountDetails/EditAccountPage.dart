import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/ProfilePage/Helper.dart';
import 'package:sample/utils/Preference.dart';
import 'package:sample/utils/routes/routes.gr.dart';

class EditAccountPage extends StatefulWidget {
  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  String? filename;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController stepLimitController = new TextEditingController();
  final TextEditingController weightController = new TextEditingController();
  final TextEditingController heightController = new TextEditingController();
  FocusNode myFocusNodeemail = new FocusNode();
  FocusNode myFocusNodeName = new FocusNode();
  FocusNode myFocusNodestepLimit = new FocusNode();
  FocusNode myFocusNodeweight = new FocusNode();
  FocusNode myFocusNodeheight = new FocusNode();
  File profile = new File('');
  @override
  void initState() {
    filename = Preference.shared.getString(Preference.profileImage) ?? '';
    heightController.text =
        Preference.shared.getInt(Preference.height)!.toString();
    weightController.text =
        Preference.shared.getInt(Preference.weight)!.toString();
    emailController.text = Preference.shared.getString(Preference.email)!;
    stepLimitController.text =
        Preference.shared.getString(Preference.stepsgoal)!.toString();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    stepLimitController.dispose();
    weightController.dispose();
    heightController.dispose();
    myFocusNodeemail.dispose();
    myFocusNodeName.dispose();
    myFocusNodestepLimit.dispose();
    myFocusNodeheight.dispose();
    myFocusNodeweight.dispose();
    super.dispose();
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
      onSaved: (value) {
        nameController.text = value!;
      },
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(myFocusNodeName);
        });
      },
      focusNode: myFocusNodeName,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).secondaryHeaderColor, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: myFocusNodeName.hasFocus
              ? Theme.of(context).secondaryHeaderColor
              : Colors.grey,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Benutzername",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Bitte gib eine richtige E-Mail an");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(myFocusNodeemail);
        });
      },
      focusNode: myFocusNodeemail,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).secondaryHeaderColor, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(
          Icons.mail_outline_rounded,
          color: myFocusNodeemail.hasFocus
              ? Theme.of(context).secondaryHeaderColor
              : Colors.grey,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "E-Mail",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final stepLimitField = TextFormField(
      autofocus: false,
      controller: stepLimitController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        stepLimitController.text = value!;
      },
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(myFocusNodestepLimit);
        });
      },
      focusNode: myFocusNodestepLimit,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).secondaryHeaderColor, width: 2.0),
          borderRadius: BorderRadius.circular(25),
        ),
        prefixIcon: Icon(
          Icons.sports_score,
          color: myFocusNodestepLimit.hasFocus
              ? Theme.of(context).secondaryHeaderColor
              : Colors.grey,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Schrittelimit",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final heightField = TextFormField(
      autofocus: false,
      controller: heightController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        heightController.text = value!;
      },
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(myFocusNodeheight);
        });
      },
      focusNode: myFocusNodeheight,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).secondaryHeaderColor, width: 2.0),
          borderRadius: BorderRadius.circular(25),
        ),
        prefixIcon: Icon(
          Icons.fitness_center_sharp,
          color: myFocusNodeheight.hasFocus
              ? Theme.of(context).secondaryHeaderColor
              : Colors.grey,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Gewicht",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final weightField = TextFormField(
      autofocus: false,
      controller: weightController,
      keyboardType: TextInputType.number,
      onSaved: (value) {
        weightController.text = value!;
      },
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(myFocusNodeweight);
        });
      },
      focusNode: myFocusNodeweight,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).secondaryHeaderColor, width: 2.0),
          borderRadius: BorderRadius.circular(25),
        ),
        prefixIcon: Icon(
          Icons.height,
          color: myFocusNodeweight.hasFocus
              ? Theme.of(context).secondaryHeaderColor
              : Colors.grey,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Größe",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil-Editor'),
        centerTitle: true,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8173,
                child: ListView(
                  children: [
                    InkWell(
                      onTap: (() async {
                        await Helper.getFromGallery(profile);
                        setState(() {});
                      }),
                      child: CircleAvatar(
                        radius: 140,
                        backgroundColor: Theme.of(context).secondaryHeaderColor,
                        child: filename == ''
                            ? CircleAvatar(
                                radius: 137,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.people_alt_outlined,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  size: 120,
                                ),
                              )
                            : CircleAvatar(
                                radius: 137,
                                backgroundColor: Colors.white,
                                backgroundImage: FileImage(
                                  File(Preference.shared
                                      .getString(Preference.profileImage)!),
                                ),
                              ),
                      ),
                    ),
                    nameField,
                    emailField,
                    stepLimitField,
                    weightField,
                    heightField,
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () => context.router.pop(AccountDetailsRoute()),
                        child: Container(
                          child: Center(
                            child: Text(
                              'Abbrechen',
                              style: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 22),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            border: Border.all(
                              color: Theme.of(context).secondaryHeaderColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(
                            'Speichern',
                            style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 22),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          border: Border.all(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 1,
                          ),
                        ),
                      ),
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
}
