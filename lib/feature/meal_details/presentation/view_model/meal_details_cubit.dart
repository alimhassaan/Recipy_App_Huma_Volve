import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_case/meal_get_details_use_case.dart';
import 'meal_details_state.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  final MealGetDetailsUseCase mealGetDetailsUseCase;
  MealDetailsCubit(this.mealGetDetailsUseCase) : super(MealDetailsInitial());

  Future<void> fetchMealDetails(String mealId) async {
    emit(MealDetailsLoading());
    final result = await mealGetDetailsUseCase.invoke(mealId);
    result.fold(
      (failure) => emit(MealDetailsFailure(failure.errorMessage)),
      (mealDetail) => emit(MealDetailsSuccess(mealDetail)),
    );
  }
}
