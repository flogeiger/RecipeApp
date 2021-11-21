import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample/models/DatabaseRecipe.dart';

class Boxes {
  static Box<DatabaseRecipe> getRecipe() => Hive.box<DatabaseRecipe>('Recipes');
}
