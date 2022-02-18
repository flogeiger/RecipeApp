import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample/models/FilterMethods.dart';
import 'package:sample/models/Recipe.dart';
import 'package:sample/utils/Preference.dart';

class UnsortBotton extends StatefulWidget {
  final List<Recipe>? firebaseList;
  final Function? callbackFunction;

  const UnsortBotton(
      {Key? key, @required this.callbackFunction, @required this.firebaseList});
  @override
  _UnsortBottonState createState() => _UnsortBottonState();
}

class _UnsortBottonState extends State<UnsortBotton>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  late AnimationController? controller;
  Animation<num>? animation;
  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    controller!.forward().then((_) async {
      await Future.delayed(Duration(seconds: 3));
      controller!.reverse();
    });
    //animation = Tween(begin: 0, end: 2 * pi).animate(controller!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.callbackFunction!(
          FilterMethods.getnormalRecipelist(widget.firebaseList!),
        );
        setState(() {
          Preference.shared.setBool(Preference.issorted, false);
        });
      },
      child: CircleAvatar(
        radius: 12,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        child: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
