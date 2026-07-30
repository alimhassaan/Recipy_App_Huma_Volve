import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../data_sources/meal_details_data_source.dart';
import '../../domain/entity/meal_detail_entity.dart';
import '../../domain/repository/meal_details_repository.dart';

class MealDetailsRepositoryImp implements MealDetailsRepository {
  final MealDetailsDataSource dataSource;

  MealDetailsRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, MealDetailEntity>> getMealDetails(
    String mealId,
  ) async {
    try {
      final response = await dataSource.getMealDetails(mealId);
      return right(response.toEntity());
    } on DioException catch (e) {
      return left(HandleError.handle(e));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}