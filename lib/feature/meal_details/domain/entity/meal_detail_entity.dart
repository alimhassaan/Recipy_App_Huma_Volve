class IngredientEntity {
  String name;
  String measure;

  IngredientEntity({this.name = "", this.measure = ""});
}

class MealDetailEntity {
  String idMeal;
  String strMeal;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strTags;
  String strYoutube;
  String strSource;
  List<IngredientEntity> ingredients;

  MealDetailEntity({
    this.idMeal = "",
    this.strMeal = "",
    this.strCategory = "",
    this.strArea = "",
    this.strInstructions = "",
    this.strMealThumb = "",
    this.strTags = "",
    this.strYoutube = "",
    this.strSource = "",
    this.ingredients = const [],
  });
}
