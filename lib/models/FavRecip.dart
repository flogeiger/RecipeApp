class FavRecip {
  String? name, description, recipeTyp, picUrl, savingTimerecipe;
  List<dynamic>? preparationsteps, ingredientslist;
  int? duration, kilocal;

  FavRecip(
    this.name,
    this.description,
    this.recipeTyp,
    this.picUrl,
    this.savingTimerecipe,
    this.preparationsteps,
    this.ingredientslist,
    this.duration,
    this.kilocal,
  );
}
