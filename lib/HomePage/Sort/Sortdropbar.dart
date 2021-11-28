import 'package:flutter/material.dart';
import 'SortItem.dart';

class SortDropBar extends StatefulWidget {
  @override
  _SortDropBarState createState() => _SortDropBarState();
}

class _SortDropBarState extends State<SortDropBar> {
  String _testString;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border.all(
          color: Theme.of(context).secondaryHeaderColor,
          width: 1,
        ),
      ),
      margin: EdgeInsets.all(5),
      child: Center(
        child: GestureDetector(
          onTap: () {
            _onpressed();
          },
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).secondaryHeaderColor,
                  size: 22,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Sortieren',
                style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onpressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF737373)),
              color: Color(0xFF737373),
            ),
            height: 500,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  border: Border.all(
                    color: Color(0xFF737373),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                  )),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).secondaryHeaderColor,
                            size: 50,
                          ),
                        ),
                      )
                    ],
                  ),
                  FilterItem(),
                ],
              ),
            ),
          );
        });
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _testString = name;
    });
  }
}
