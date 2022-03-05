import 'package:flutter/material.dart';

class ImpressumPage extends StatelessWidget {
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
            'Impressum',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}
