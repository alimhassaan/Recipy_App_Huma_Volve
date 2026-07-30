import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/home_category_entity.dart';
import '../entity/home_meal_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<MealEntity>>> getMealsByCategory(String category);
}
