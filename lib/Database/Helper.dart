import 'package:sample/Database/Datamodel/PointsData.dart';

import 'Datamodel/FavoriteData.dart';
import 'Datamodel/StepData.dart';
import 'package:sample/models/Recipe.dart';
import 'Database.dart';
import 'data_access_object/Fav_dao.dart';

class Helper {
  static CostumeDatabase? _database;

  Future<CostumeDatabase?> initialize() async {
    _database =
        await $FloorCostumeDatabase.databaseBuilder('floorDatabase.db').build();
    return _database;
  }

  static Future<void> insertDataFav(FavoriteRecip recip) async {
    final fav_Dao = _database!.favoriteRecipedao;
    await fav_Dao.insertRecipe(recip);
  }

  static Future<List<FavoriteRecip>> selectAllDataFromFavtable() async {
    final fav_Dao = _database!.favoriteRecipedao;
    final src = await fav_Dao.getAllEntrysfromTable();
    return src;
  }

  static Future<FavoriteRecip> selectdeleteData(Recipe recip) async {
    final fav_dao = _database!.favoriteRecipedao;
    final src = await fav_dao.checkingifDatabaseContainRecipe(
      recip.name!,
      recip.picUrl!,
    );
    return src!;
  }

  static Future<FavoriteRecip> selectdeleteDataFav(Recipe recip) async {
    final fav_dao = _database!.favoriteRecipedao;
    final src = await fav_dao.checkingifDatabaseContainRecipe(
      recip.name!,
      recip.picUrl!,
    );
    return src!;
  }

  static Future<List<FavoriteRecip>> selectAllDataLikeinput(
      String input) async {
    final fav_dao = _database!.favoriteRecipedao;
    final src = await fav_dao.findPersonsWithNamesLike(input);
    return src;
  }

  static Future<bool> checkingifDataisSaved(Recipe recipe) async {
    final fav_dao = _database!.favoriteRecipedao;
    final src = await fav_dao.checkingifDatabaseContainRecipe(
      recipe.name!,
      recipe.picUrl!,
    );

    if (src != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> deletefavData(FavoriteRecip recip) async {
    final Fav_dao = _database!.favoriteRecipedao;
    await Fav_dao.deleteRecipe(recip);
  }

  static Future<List<PointsData>> selectAllDataFrompointstable() async {
    final fav_Dao = _database!.pointsdao;
    final src = await fav_Dao.getAllEntrysfromTable();
    return src;
  }

  static Future<void> insertPoints(PointsData pointsData) async {
    final points_Dao = _database!.pointsdao;
    await points_Dao.insertPointData(pointsData);
  }
}
