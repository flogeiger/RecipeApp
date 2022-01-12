import 'package:floor/floor.dart';

@Entity(tableName: 'fav_table')
class FavoriteRecip {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: "recipe_id")
  int? id;

  @ColumnInfo(name: "recipe_Name")
  String? recipeName;

  @ColumnInfo(name: "description")
  String? description;

  @ColumnInfo(name: "recipeTyp")
  String? recipeTyp;

  @ColumnInfo(name: "picUrl")
  String? picUrl;

  @ColumnInfo(name: "duration")
  int? duration;

  @ColumnInfo(name: "kilocal")
  int? kilocal;

  @ColumnInfo(name: "recipe_preparation")
  String? preparationList;

  @ColumnInfo(name: "recipe_ingredients")
  String? ingredientslist;

  @ColumnInfo(name: "Time_Recipe_save")
  String? savingTimerecipe;

  @ColumnInfo(name: "Saving_Flag")
  int? savingFlag;

  FavoriteRecip({
    this.id,
    this.recipeName,
    this.description,
    this.picUrl,
    this.ingredientslist,
    this.preparationList,
    this.kilocal,
    this.duration,
    this.recipeTyp,
    this.savingTimerecipe,
    this.savingFlag,
  });
}
