import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample/models/DatabaseRecipes.dart';

class Boxes {
  static Box<DatabaseRecipes> getRecipe() =>
      Hive.box<DatabaseRecipes>('Recipe');
}
