import 'package:flutter/material.dart';
import 'package:sample/LoginPages/login_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart' as _firebasecore;
import 'package:sample/models/DatabaseRecipe.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _firebasecore.Firebase.initializeApp();
  final addDocumentDirectory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(addDocumentDirectory.path);
  Hive.registerAdapter(DatabaseRecipeAdapter());
  final recipeBox = await Hive.openBox<DatabaseRecipe>('Recipes');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
