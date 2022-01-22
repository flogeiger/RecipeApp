import 'package:googleapis/content/v2_1.dart';

class Recipe {
  String? name, description, recipeTyp, picUrl, savingTimerecipe;
  List<dynamic>? preparationsteps, ingredientslist;
  int? duration, kilocal;
  bool? giftedRecipe;
  Recipe(
    this.name,
    this.description,
    this.recipeTyp,
    this.picUrl,
    this.savingTimerecipe,
    this.duration,
    this.giftedRecipe,
    this.ingredientslist,
    this.kilocal,
    this.preparationsteps,
  );
  Recipe.fromJson(Map<String, dynamic> parsedJSON)
      : picUrl = parsedJSON['picUrl'],
        description = parsedJSON['description'],
        duration = parsedJSON['duration'],
        kilocal = parsedJSON['kcal'],
        name = parsedJSON['title'],
        recipeTyp = parsedJSON['recipeTyp'],
        giftedRecipe = parsedJSON['giftedrecipe'],
        preparationsteps = parsedJSON['preparationsteps'],
        ingredientslist = parsedJSON['ingredientslist'],
        savingTimerecipe = parsedJSON['recipesavingtime'];
}
