import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sample/ProfilePage/Helper.dart';

class AccountDetailsPage extends StatefulWidget {
  @override
  _AccountDetailsPageState createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  File? prefile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: const Icon(
            Icons.arrow_back,
            size: 35,
            color: Colors.blue,
          ),
        ),
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
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
              InkWell(
                onTap: (() => Helper.getFromGallery(prefile!)),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 37,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.people_alt_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 50,
                    ),
                  ),
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
                      'test',
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
                      'Name',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      'test',
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
                      'Name',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      'test',
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
                      'Name',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      'test',
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
                      'Name',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      'test',
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
                      'Name',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      'test',
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
                      'Name',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      'test',
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
                      'Name',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 156, 150, 150)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Text(
                      'test',
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
