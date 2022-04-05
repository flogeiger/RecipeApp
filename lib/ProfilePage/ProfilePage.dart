import 'dart:io';

import 'package:sample/ProfilePage/Helper.dart';
import 'package:sample/utils/Preference.dart';
import 'package:sample/utils/routes/routes.gr.dart';

import 'CostumeOptionPoint.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'triumph.dart';
import 'OptionPage/OptionsconfigPage.dart';
import 'RankingPage.dart';
import 'package:auto_route/auto_route.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? filename;
  File profile = new File('');
  @override
  void initState() {
    // TODO: implement initState
    filename = Preference.shared.getString(Preference.profileImage) ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
          color: Theme.of(context).secondaryHeaderColor),
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
                      context.router.push(TriumphRoute());
                    },
                    child: CostumeOptionPoint(
                      Icons.military_tech_outlined,
                      'triumph',
                      Colors.white,
                    )),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (() async {
                    await Helper.getFromGallery(profile);
                    setState(() {});
                  }),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey,
                    child: filename == ''
                        ? CircleAvatar(
                            radius: 77,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.people_alt_outlined,
                              color: Theme.of(context).primaryColor,
                              size: 50,
                            ),
                          )
                        : CircleAvatar(
                            radius: 77,
                            backgroundColor: Colors.white,
                            backgroundImage: FileImage(File(Preference.shared
                                .getString(Preference.profileImage)!)),
                          ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    context.router.push(OptionconfigRoute());
                  },
                  child: CostumeOptionPoint(
                    LineAwesomeIcons.cog,
                    'options',
                    Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  context.router.push(RankingRoute());
                },
                child: CostumeOptionPoint(
                  LineAwesomeIcons.trophy,
                  'ranking',
                  Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
