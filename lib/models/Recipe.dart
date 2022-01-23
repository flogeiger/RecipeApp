class Recipe {
  String? name, description, recipeTyp, picUrl, savingTimerecipe;
  List<dynamic>? preparationsteps, ingredientslist, nutritionlist;
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
    this.nutritionlist,
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
        nutritionlist = parsedJSON['nutritionlist'],
        savingTimerecipe = parsedJSON['recipesavingtime'];
}
