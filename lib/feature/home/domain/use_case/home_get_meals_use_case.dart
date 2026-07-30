import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/home_meal_entity.dart';
import '../repository/home_repository.dart';

class HomeGetMealsUseCase {
  final HomeRepository repository;
  HomeGetMealsUseCase(this.repository);
  Future<Either<Failure, List<MealEntity>>> invoke(String category) async {
    return await repository.getMealsByCategory(category);
  }
}
