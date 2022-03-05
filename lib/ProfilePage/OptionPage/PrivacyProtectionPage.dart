import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class PrivacyProtectionPage extends StatefulWidget {
  @override
  State<PrivacyProtectionPage> createState() => _PrivacyProtectionPageState();
}

class _PrivacyProtectionPageState extends State<PrivacyProtectionPage> {
  LocalAuthentication auth = LocalAuthentication();
  bool prefboolvar = false;
  List<BiometricType>? availableBiometrics;
  String Authent = 'Test';

  Future<void> _checkBiometrics() async {
    bool? canCheckBiometrics;

    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      prefboolvar = canCheckBiometrics!;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType>? _availableBiometrics;
    try {
      _availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      availableBiometrics = _availableBiometrics!;
    });
  }

  Future<void> _authenticate() async {
    bool _authenticate = false;
    try {
      _authenticate = await auth.authenticate(
          localizedReason: 'Bitte entsperren Sie das Gerät mit dem Daumen',
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      Authent = _authenticate ? "Authorized" : "Not Authorized";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: const Icon(
              Icons.arrow_back,
              size: 35,
              color: Colors.blue,
            ),
          ),
          title: const Text(
            'Nutzungsbedingungen',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
