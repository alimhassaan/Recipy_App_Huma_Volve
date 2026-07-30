import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/meal_detail_entity.dart';
import '../repository/meal_details_repository.dart';

class MealGetDetailsUseCase {
  final MealDetailsRepository repository;
  MealGetDetailsUseCase(this.repository);

  Future<Either<Failure, MealDetailEntity>> invoke(String mealId) async {
    return await repository.getMealDetails(mealId);
  }
}
