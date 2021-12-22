class Recipe {
  String name, description, recipeTyp, picUrl, savingTimerecipe;
  List<dynamic> preparationsteps, ingredientslist;
  int duration, kilocal;
  bool giftedRecipe;
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

  Map<String, dynamic> toJson() => {
        'title': name,
        'picUrl': picUrl,
        'description': description,
        'duration': duration,
        'recipeType': recipeTyp,
        'recipesavingtime': savingTimerecipe,
        'kilocal': kilocal,
        'preparaitonsteps': preparationsteps,
        'ingredientslist': ingredientslist,
      };
}
