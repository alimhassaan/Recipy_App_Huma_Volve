import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/meal_detail_entity.dart';

abstract class MealDetailsRepository {
  Future<Either<Failure, MealDetailEntity>> getMealDetails(String mealId);
}
