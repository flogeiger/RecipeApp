import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample/Database/Helper.dart';
import 'package:sample/LoginPages/loginPage.dart';
import 'package:firebase_core/firebase_core.dart' as _firebasecore;
import 'package:path_provider/path_provider.dart';
import 'package:sample/utils/routes/routes.gr.dart';
import 'utils/Preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference().instance();
  await _firebasecore.Firebase.initializeApp();
  final addDocumentDirectory = await getApplicationDocumentsDirectory();
  await Helper().initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _appRouter = Routes();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive) return;
    final background = state == AppLifecycleState.paused;
    if (background) {
      Preference.shared.setBool(Preference.issorted, false);
      Preference.shared.setBool(Preference.issortedFav, false);
      Preference.shared.setBool(Preference.isfilterd, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      builder: (context, child) => child!,
      theme: ThemeData(
        primaryColor: Colors.black,
        canvasColor: Colors.white,
        secondaryHeaderColor: Color(0xffe3c291),
        bottomAppBarColor: Colors.grey,
        //primarySwatch: MaterialColor(
        //0xffffffff,
        //const <int, Color>{
        //50: const Color(0xffce5641), //10%
        //100: const Color(0xffb74c3a), //20%
        //200: const Color(0xffa04332), //30%
        //300: const Color(0xff89392b), //40%
        //400: const Color(0xff733024), //50%
        //500: const Color(0xff5c261d), //60%
        //600: const Color(0xff451c16), //70%
        //700: const Color(0xff2e130e), //80%
        //800: const Color(0xff170907), //90%
        //900: const Color(0xff000000), //100%
        //},
        //),
      ),
    );

    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Email And Password Login',
      theme: ThemeData(
        primaryColor: Colors.black,
        canvasColor: Colors.white,
        secondaryHeaderColor: Color(0xffe3c291),
        bottomAppBarColor: Colors.grey,
        //primarySwatch: MaterialColor(
        //0xffffffff,
        //const <int, Color>{
        //50: const Color(0xffce5641), //10%
        //100: const Color(0xffb74c3a), //20%
        //200: const Color(0xffa04332), //30%
        //300: const Color(0xff89392b), //40%
        //400: const Color(0xff733024), //50%
        //500: const Color(0xff5c261d), //60%
        //600: const Color(0xff451c16), //70%
        //700: const Color(0xff2e130e), //80%
        //800: const Color(0xff170907), //90%
        //900: const Color(0xff000000), //100%
        //},
        //),
      ),
    );
  }
}
