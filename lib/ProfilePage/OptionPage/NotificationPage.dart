import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'Datenschutzbestimmungen',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
