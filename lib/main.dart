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
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
