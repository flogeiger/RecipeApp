import 'package:floor/floor.dart';
import 'package:sample/Database/Datamodel/FavoriteData.dart';

@dao
abstract class Fav_dao {
  @Query('SELECT * FROM fav_table')
  Future<List<FavoriteRecip>> getAllEntrysfromTable();

  @Query(
      'SELECT * FROM fav_table WHERE recipe_Name = :recipName AND picUrl = :url')
  Future<FavoriteRecip?> checkingifDatabaseContainRecipe(
      String recipName, String url);

  @delete
  Future<void> deleteRecipe(FavoriteRecip recip);

  @insert
  Future<void> insertRecipe(FavoriteRecip recip);
}
