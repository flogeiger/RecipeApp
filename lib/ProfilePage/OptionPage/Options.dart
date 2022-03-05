import 'package:flutter/material.dart';
import 'package:sample/ProfilePage/OptionPage/PrivacyProtectionPage.dart';

import 'dart:io';

import 'TermsofUsagePage.dart';
import 'ImpressumPage.dart';

import '../Helper.dart';
import 'AccountDetailsPage.dart';
import 'NotificationPage.dart';
import 'SecurityPage.dart';

class OptionPageconfig extends StatefulWidget {
  @override
  State<OptionPageconfig> createState() => _OptionPageconfigState();
}

class _OptionPageconfigState extends State<OptionPageconfig> {
  File? prefFile;
  showAlertDialog(BuildContext ctx) {
    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text('Abbrechen'),
    );
    Widget continueButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                InkWell(
                  onTap: (() => Helper.getFromGallery(prefFile!)),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.people_alt_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 50,
                      ),
                    ),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AccountDetailsPage(),
                      ),
                    );
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => NotificationPage(),
                      ),
                    );
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PrivacyProtectionPage(),
                      ),
                    );
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SecurityPage(),
                      ),
                    );
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => TermsofUsagePage(),
                      ),
                    );
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ImpressumPage(),
                      ),
                    );
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
