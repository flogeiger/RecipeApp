import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/ProfilePage/Helper.dart';
import 'package:sample/utils/Preference.dart';
import 'package:sample/utils/routes/routes.gr.dart';

class AccountDetailsPage extends StatefulWidget {
  @override
  _AccountDetailsPageState createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  String? filename;
  String? height;
  String? weight;
  String? email;
  String? stepLimit;
  String? name;
  @override
  void initState() {
    filename = Preference.shared.getString(Preference.profileImage) ?? '';
    filename = Preference.shared.getString(Preference.profileImage) ?? '';
    height = Preference.shared.getInt(Preference.height)!.toString();
    weight = Preference.shared.getInt(Preference.weight)!.toString();
    email = Preference.shared.getString(Preference.email)!;
    stepLimit = Preference.shared.getString(Preference.stepsgoal)!.toString();
    name = Preference.shared.getString(Preference.name)!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: GestureDetector(
              onTap: () {
                context.router.push(EditAccountRoute());
              },
              child: Icon(
                Icons.edit,
                color: Theme.of(context).secondaryHeaderColor,
                size: MediaQuery.of(context).size.height * 0.04,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                child: filename == ''
                    ? CircleAvatar(
                        radius: 57,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.people_alt_outlined,
                          color: Theme.of(context).secondaryHeaderColor,
                          size: 50,
                        ),
                      )
                    : CircleAvatar(
                        radius: 57,
                        backgroundColor: Colors.white,
                        backgroundImage: FileImage(File(Preference.shared
                            .getString(Preference.profileImage)!)),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  'Persönliche Informationen',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 156, 150, 150), width: 1),
                      top: BorderSide(
                          color: Color.fromARGB(255, 156, 150, 150), width: 1)),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      name!,
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 156, 150, 150), width: 1),
                      top: BorderSide(
                          color: Color.fromARGB(255, 156, 150, 150), width: 1)),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'E-Mail',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      email!,
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                child: Text(
                  'Fitness Einstellungen',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 156, 150, 150), width: 1),
                      top: BorderSide(
                          color: Color.fromARGB(255, 156, 150, 150), width: 1)),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Schritt-Tagesziel',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      stepLimit!,
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 156, 150, 150), width: 1),
                      top: BorderSide(
                          color: Color.fromARGB(255, 156, 150, 150), width: 1)),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Größe',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      height!,
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 156, 150, 150), width: 1),
                      top: BorderSide(
                          color: Color.fromARGB(255, 156, 150, 150), width: 1)),
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Körpergewicht',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      weight!,
                      style: TextStyle(fontSize: 22),
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
