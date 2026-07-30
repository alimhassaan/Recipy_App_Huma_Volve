import '../model/meal_detail_model.dart';

abstract class MealDetailsDataSource {
  Future<MealDetailModel> getMealDetails(String mealId);
}
