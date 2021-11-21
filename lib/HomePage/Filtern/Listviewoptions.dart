import 'package:flutter/material.dart';
import 'FilternCategoryItem.dart';
import 'ButtonFiltern.dart';
import 'TopMenuBar.dart';
import 'package:sample/HomePage/Filtern/AfterFilternOption/AfterFilterCategoryPage.dart';

class Filtern extends StatefulWidget {
  @override
  _FilternState createState() => _FilternState();
}

class _FilternState extends State<Filtern> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              TopMenuBar(),
              SizedBox(
                height: 20,
              ),
              FilterCategoryItem(),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 5,
                          top: 10,
                          bottom: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: FilterButton(
                            'Abbrechen',
                            Colors.white,
                            10,
                            5,
                            Theme.of(context).secondaryHeaderColor,
                            Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AfterCategoryFilterItem(),
                              ),
                            );
                          },
                          child: FilterButton(
                            'Anwenden',
                            Theme.of(context).secondaryHeaderColor,
                            5,
                            10,
                            Colors.white,
                            Theme.of(context).secondaryHeaderColor,
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
