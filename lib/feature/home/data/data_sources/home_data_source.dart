import '../model/category_model.dart';
import '../model/meal_model.dart';

abstract class HomeDataSource {
  Future<List<MealModel>> getMealsByCategory(String category);
  Future<List<CategoryModel>> getCategories();
}
