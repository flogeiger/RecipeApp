import 'CostumeOptionPoint.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'triumph.dart';
import 'Options.dart';
import 'RankingPage.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
        color: Theme.of(context).bottomAppBarColor,
      ),
      margin: EdgeInsets.only(bottom: 200),
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Triumph(),
                        ),
                      );
                    },
                    child: CostumeOptionPoint(
                      Icons.military_tech_outlined,
                      'triumph',
                      Colors.grey,
                    )),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Theme.of(context).primaryColor,
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.t1zIsBRgRyG_Gui7EcaI-gHaIq?pid=ImgDet&rs=1'),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => (OptionPageconfig()),
                      ),
                    );
                  },
                  child: CostumeOptionPoint(
                    LineAwesomeIcons.cog,
                    'options',
                    Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => (RankingPage()),
                    ),
                  );
                },
                child: CostumeOptionPoint(
                    LineAwesomeIcons.trophy, 'ranking', Colors.grey)),
          ],
        ),
      ),
    );
  }
}
