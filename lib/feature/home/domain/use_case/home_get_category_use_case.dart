import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/home_category_entity.dart';
import '../repository/home_repository.dart';

class HomeGetCategoryUseCase {
  final HomeRepository repository;
  HomeGetCategoryUseCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> invoke() async {
    return await repository.getCategories();
  }
}
