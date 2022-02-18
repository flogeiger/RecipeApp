import 'package:flutter/material.dart';

class TopMenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
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
          ),
          Expanded(
            child: Container(
              height: 30,
              color: Colors.white,
            ),
          ),
          Container(
            child: Text(
              'Kategorien',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 30,
              color: Colors.white,
            ),
          ),
          Container(
            child: Text(
              'Alles löschen',
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
