import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'Datamodel/FavoriteData.dart';
import 'Datamodel/StepData.dart';
import 'data_access_object/Fav_dao.dart';
import 'data_access_object/Step_dao.dart';

part 'Database.g.dart';

@Database(version: 1, entities: [StepData, FavoriteRecip])
abstract class CostumeDatabase extends FloorDatabase {
  Step_dao get stepsdao;

  Fav_dao get favoriteRecipedao;
}
