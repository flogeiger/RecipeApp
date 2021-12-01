import 'package:hive/hive.dart';

part 'DatabaseRecipes.g.dart';

@HiveType(typeId: 0)
class DatabaseRecipes extends HiveObject {
  @HiveField(0)
  String recipeName;

  @HiveField(1)
  String description;

  @HiveField(2)
  String recipeTyp;

  @HiveField(3)
  String picUrl;

  @HiveField(4)
  int duration;

  @HiveField(5)
  int kilocal;

  @HiveField(6)
  bool giftedrecipe;

  @HiveField(7)
  bool kfav;

  @HiveField(8)
  List<dynamic> preparationList;

  @HiveField(9)
  List<dynamic> ingredientslist;
}
