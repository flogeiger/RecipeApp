import 'package:flutter/material.dart';
import 'package:sample/Database/Helper.dart';
import 'package:grouped_list/grouped_list.dart';

import '../Database/Datamodel/PointsData.dart';

class PointHistoryPage extends StatelessWidget {
  Future<List<PointsData>> getpointsData() async {
    return await Helper.selectAllDataFrompointstable();
  }

  List<Widget> buildWidgets(
      List<PointsData> itemlist, List<String> dateList, BuildContext ctx) {
    List<Widget> build = [];
    for (var date in dateList) {
      build.add(
        Material(
          child: ListTile(
            leading: Text(date),
            textColor: Theme.of(ctx).canvasColor,
            tileColor: Theme.of(ctx).secondaryHeaderColor,
          ),
        ),
      );
      for (var item in itemlist) {
        if (item.time == date) {
          build.add(
            Material(
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  size: 40,
                  color: Theme.of(ctx).secondaryHeaderColor,
                ),
                title: Text(item.pointusetype!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.cookie,
                      color: Theme.of(ctx).secondaryHeaderColor,
                    ),
                    Text(
                      item.pointsAmount.toString(),
                    )
                  ],
                ),
                textColor: Theme.of(ctx).primaryColor,
                tileColor: Theme.of(ctx).canvasColor,
              ),
            ),
          );
        }
      }
    }
    return build;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tolle Sache"),
          centerTitle: true,
          backgroundColor: Theme.of(context).secondaryHeaderColor,
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: FutureBuilder(
          future: getpointsData(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Could not load the data!'));
                } else {
                  List<PointsData> list = snapshot.data;
                  List<String> dateList = [];
                  list.sort((a, b) {
                    return a.time!.compareTo(b.time!);
                  });
                  for (var item in list) {
                    if (dateList.contains(item.time) == false) {
                      dateList.add(item.time!);
                    }
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
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
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        'Cookies',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.039,
                          color: Colors.grey[300],
                        ),
                      ),
                      Text(
                        '199',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.045,
                          color: Theme.of(context).canvasColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: buildWidgets(list, dateList, context),
                        ),
                      ),
                    ],
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
