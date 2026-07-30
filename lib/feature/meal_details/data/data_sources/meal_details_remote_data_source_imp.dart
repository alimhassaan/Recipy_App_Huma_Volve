import '../../../../core/network/api_service.dart';
import 'meal_details_data_source.dart';
import '../model/meal_detail_model.dart';

class MealDetailsRemoteDataSourceImp implements MealDetailsDataSource {
  ApiService apiService;
  MealDetailsRemoteDataSourceImp(this.apiService);

  late final dio = apiService.dio;

  @override
  Future<MealDetailModel> getMealDetails(String mealId) async {
    final response = await dio.get(
      "/lookup.php",
      queryParameters: {"i": mealId},
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final jsonRes = response.data["meals"] as List?;
      if (jsonRes == null || jsonRes.isEmpty) {
        throw Exception("Meal details not found");
      }
      return MealDetailModel.fromJson(jsonRes.first);
    } else {
      final errorMessage = response.data["message"];
      throw Exception(errorMessage);
    }
  }
}
