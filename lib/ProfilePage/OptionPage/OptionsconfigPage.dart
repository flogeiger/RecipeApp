import 'package:flutter/material.dart';
import 'package:sample/utils/Preference.dart';
import 'package:sample/utils/routes/routes.gr.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:auto_route/auto_route.dart';

class OptionconfigPage extends StatefulWidget {
  @override
  State<OptionconfigPage> createState() => _OptionconfigPageState();
}

class _OptionconfigPageState extends State<OptionconfigPage> {
  Future<void>? _launched;
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    )) {
      throw 'Could not launch $url';
    }
  }

  File? prefFile;
  showAlertDialog(BuildContext ctx) {
    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text('Abbrechen'),
    );
    Widget continueButton = TextButton(
      onPressed: () async {
        await _signOut();
        context.router.popUntilRouteWithName('/');
        context.navigateNamedTo('/');
      },
      child: Text('Abmelden'),
    );
    AlertDialog alert = AlertDialog(
      title: Text('Abmelden'),
      content: Text('Möchten Sie sich wirklich abmelden?'),
      actions: [continueButton, cancelButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext cont) {
          return alert;
        });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  String? filename;
  @override
  void initState() {
    filename = Preference.shared.getString(Preference.profileImage) ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunchimpressum = 'https://mycarbcrew.com/impressum/';
    const String toLauchownSite = 'https://mycarbcrew.com/';
    const String toLaunchprivacyterms =
        'https://mycarbcrew.com/datenschutzerklaerung/';
    const String toLaunchTiktok = 'https://www.tiktok.com/@mycarbcrew';
    const String toLaunchInstagramm = 'https://www.instagram.com/mycarbcrew/';

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Einstellungen',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).secondaryHeaderColor,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  child: filename == ''
                      ? CircleAvatar(
                          radius: 57,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.people_alt_outlined,
                            color: Theme.of(context).secondaryHeaderColor,
                            size: 50,
                          ),
                        )
                      : CircleAvatar(
                          radius: 57,
                          backgroundColor: Colors.white,
                          backgroundImage: FileImage(File(Preference.shared
                              .getString(Preference.profileImage)!)),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      'Florian',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Persönliche Informationen',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_outline_rounded,
                    size: 40,
                  ),
                  onTap: () {
                    context.router.push(AccountDetailsRoute());
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 40,
                  ),
                  title: Text('Account Informationen'),
                  subtitle: Text('Name, E-Mail usw'),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Allgemeine Einstellungen',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications_on_outlined,
                    size: 40,
                  ),
                  onTap: () {
                    context.router.push(NotificationRoute());
                  },
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 40,
                  ),
                  title: Text('Push-Benachrichtigung'),
                  subtitle: Text('Push & E-Mail Benachrichtigung'),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      _launched = _launchInBrowser(toLaunchprivacyterms);
                    });
                  },
                  leading: Icon(
                    Icons.privacy_tip,
                    size: 40,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 40,
                  ),
                  title: Text('Datenschutzbestimmungen'),
                  subtitle: Text('Unsere Datenschutzrichtlinien'),
                ),
                ListTile(
                  //Hier wird eine HinterlegteSeite Aufgerufen
                  onTap: () {
                    context.router.push(SecurityRoute());
                  },
                  leading: Icon(
                    Icons.security_outlined,
                    size: 40,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 40,
                  ),
                  title: Text('Sicherheit'),
                  subtitle: Text('Password ändern & Fingerabdruck'),
                ),
                ListTile(
                  onTap: () {
                    context.router.push(TermsofUsageRoute());
                  },
                  leading: Icon(
                    Icons.library_books_outlined,
                    size: 40,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 40,
                  ),
                  title: Text('Nutzungsbedingungen'),
                  subtitle: Text('Allgemeine Geschäftsbedingungen'),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      _launched = _launchInBrowser(toLaunchimpressum);
                    });
                  },
                  leading: Icon(
                    Icons.privacy_tip,
                    size: 40,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 40,
                  ),
                  title: Text('Impressum'),
                  subtitle: Text('Unsere Impressum'),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Social Media',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      _launched = _launchInBrowser(toLaunchInstagramm);
                    });
                  },
                  leading: Icon(
                    //Instagramm Icon!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    Icons.inbox,
                    size: 40,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 40,
                  ),
                  title: Text('Instagram'),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      _launched = _launchInBrowser(toLaunchTiktok);
                    });
                  },
                  leading: Icon(
                    //Instagramm Icon!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    Icons.inbox,
                    size: 40,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 40,
                  ),
                  title: Text('TikTok'),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      _launched = _launchInBrowser(toLauchownSite);
                    });
                  },
                  leading: Icon(
                    //Instagramm Icon!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    Icons.inbox,
                    size: 40,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 40,
                  ),
                  title: Text('Online shop'),
                ),
                InkWell(
                  onTap: () => showAlertDialog(context),
                  child: const Center(
                    child: Text(
                      'Ausloggen',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
