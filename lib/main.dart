import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample/LoginPages/login_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart' as _firebasecore;
import 'models/DatabaseRecipes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sample/models/FileManager.dart';

import 'Controller/file_controller.dart';
import 'models/DatabaseBox.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _firebasecore.Firebase.initializeApp();
  final addDocumentDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(addDocumentDirectory.path);
  Hive.registerAdapter(DatabaseRecipesAdapter());
  await Hive.openBox<DatabaseRecipes>('Recipe');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FileController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //context.read<FileController>().readRecipe();
    return MaterialApp(
      home: Pages(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email And Password Login',
      theme: ThemeData(
          primaryColor: Colors.black,
          canvasColor: Colors.white,
          secondaryHeaderColor: Color(0xffe3c291),
          bottomAppBarColor: Colors.grey,
          primarySwatch: MaterialColor(
            0xffffffff,
            const <int, Color>{
              50: const Color(0xffce5641), //10%
              100: const Color(0xffb74c3a), //20%
              200: const Color(0xffa04332), //30%
              300: const Color(0xff89392b), //40%
              400: const Color(0xff733024), //50%
              500: const Color(0xff5c261d), //60%
              600: const Color(0xff451c16), //70%
              700: const Color(0xff2e130e), //80%
              800: const Color(0xff170907), //90%
              900: const Color(0xff000000), //100%
            },
          )),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
