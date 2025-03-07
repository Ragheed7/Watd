import 'package:bloc/bloc.dart';
import 'package:watd/core/shared_models/category_data_model/category_data.dart';
import 'package:watd/features/home/data/repository/home_repo.dart';
import 'package:watd/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  final HomeRepo _homeRepo;

  List<CategoryData?>? CategoriesList = [];

  void getCategories() async {
    emit(const HomeState.categoriesLoading());
    final response = await _homeRepo.getCategories();
    response.when(
      success: (categoryResponse) {
        CategoriesList =
            categoryResponse.categories ?? [];
        emit(HomeState.categoriesSuccess(
            categoryResponse.categories));
      },
      failure: (errorHandler) {
        emit(HomeState.categoriesError(errorHandler));
      },
    );
  }
}