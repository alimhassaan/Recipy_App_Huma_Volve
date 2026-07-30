import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../data_sources/home_data_source.dart';
import '../../domain/entity/home_category_entity.dart';
import '../../domain/entity/home_meal_entity.dart';
import '../../domain/repository/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDataSource dataSource;
  HomeRepositoryImp(this.dataSource);
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await dataSource.getCategories();
      final categories = response.map((e) => e.toEntity()).toList();
      return right(categories);
    } on DioException catch (e) {
      return left(HandleError.handle(e));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getMealsByCategory(
    String category,
  ) async {
    try {
      final response = await dataSource.getMealsByCategory(category);
      final meals = response.map((e) => e.toEntity()).toList();
      return right(meals);
    } on DioException catch (e) {
      return left(HandleError.handle(e));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
