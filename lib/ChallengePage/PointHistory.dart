import 'package:flutter/material.dart';

class PointHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.of(context).size.height * 0.05,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.20),
                  child: Text(
                    'Cookie Wallet',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.40,
              height: MediaQuery.of(context).size.width * 0.40,
              child: Image.network(
                'https://www.pngkey.com/png/detail/210-2108456_cookie-png-clipart-cookies-with-transparent-background.png',
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
          Text(
            'Cookies',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.039,
              color: Colors.grey[300],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 15),
            child: Text(
              '199',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.045,
                color: Theme.of(context).canvasColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).canvasColor,
            ),
          )
        ],
      ),
    ));
  }
}
