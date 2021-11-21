import 'package:hive/hive.dart';

part 'DatabaseRecipe.g.dart';

@HiveType(typeId: 0)
class DatabaseRecipe extends HiveObject {
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
  String recipestep1;

  @HiveField(7)
  String recipestep2;

  @HiveField(8)
  String recipestep3;

  @HiveField(9)
  String recipestep4;

  @HiveField(10)
  String recipestep5;

  @HiveField(11)
  String recipestep6;
  @HiveField(12)
  bool giftedrecipe;
}
