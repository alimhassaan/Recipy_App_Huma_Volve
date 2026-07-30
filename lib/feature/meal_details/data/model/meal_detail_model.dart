import '../../domain/entity/meal_detail_entity.dart';

class IngredientModel {
  final String name;
  final String measure;

  IngredientModel({required this.name, required this.measure});

  IngredientEntity toEntity() {
    return IngredientEntity(name: name, measure: measure);
  }
}

class MealDetailModel {
  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  String? strSource;
  List<IngredientModel> ingredients;

  MealDetailModel({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strSource,
    this.ingredients = const [],
  });

  factory MealDetailModel.fromJson(Map<String, dynamic> json) {
    List<IngredientModel> extractedIngredients = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        extractedIngredients.add(
          IngredientModel(
            name: ingredient.toString().trim(),
            measure: measure != null ? measure.toString().trim() : '',
          ),
        );
      }
    }

    return MealDetailModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      strSource: json['strSource'],
      ingredients: extractedIngredients,
    );
  }

  MealDetailEntity toEntity() {
    return MealDetailEntity(
      idMeal: idMeal ?? '',
      strMeal: strMeal ?? '',
      strCategory: strCategory ?? '',
      strArea: strArea ?? '',
      strInstructions: strInstructions ?? '',
      strMealThumb: strMealThumb ?? '',
      strTags: strTags ?? '',
      strYoutube: strYoutube ?? '',
      strSource: strSource ?? '',
      ingredients: ingredients.map((e) => e.toEntity()).toList(),
    );
  }
}
