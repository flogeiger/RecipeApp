class Recipe {
  Recipe();
  String name,
      description,
      recipeTyp,
      picUrl,
      recipestep1,
      recipestep2,
      recipestep3,
      recipestep4,
      recipestep5,
      recipestep6;
  int duration, kilocal;
  bool giftedRecipe;
  //Reihnfolge der attribute niemals verändern!!!!!!!!
  Recipe.fromJson(Map<String, dynamic> parsedJSON)
      : picUrl = parsedJSON['picUrl'],
        recipestep1 = parsedJSON['Zubereitungsschritt 1'],
        description = parsedJSON['Beschreibung'],
        duration = parsedJSON['Dauer'],
        recipestep6 = parsedJSON['Zubereitungsschritt 6'],
        kilocal = parsedJSON['Kalorienzahl'],
        name = parsedJSON['title'],
        recipestep3 = parsedJSON['Zubereitungsschritt 3'],
        recipeTyp = parsedJSON['Ernährungsart'],
        recipestep2 = parsedJSON['Zubereitungsschritt 2'],
        recipestep5 = parsedJSON['Zubereitungsschritt 5'],
        recipestep4 = parsedJSON['Zubereitungsschritt 4'],
        giftedRecipe = parsedJSON['giftedrecipe'];
}
