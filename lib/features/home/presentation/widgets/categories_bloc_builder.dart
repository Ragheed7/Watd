import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watd/core/shared_models/category_data_model/category_data.dart';
import 'package:watd/core/theming/colors.dart';
import 'package:watd/features/home/logic/cubit/home_cubit.dart';
import 'package:watd/features/home/logic/cubit/home_state.dart';
import 'package:watd/features/home/presentation/widgets/categories_grid_view.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is CategoriesLoading ||
          current is CategoriesSuccess ||
          current is CategoriesError,
      builder: (context, state) {
        return state.maybeWhen(
          categoriesLoading: () {
            return setupLoading();
          },
          categoriesSuccess: (categories) {
            var list = categories;
            return setupSuccess(list);
          },
          categoriesError: (errorHandler) => setUpError(),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}

setUpError() {
  return const SizedBox.shrink();
}

Widget setupSuccess(List<CategoryData?>? list) {
  final categories = list
      ?.where((category) => category != null)
      .cast<CategoryData>()
      .toList() ?? [];

  return CategoriesGridView(
    categories: categories,
  );
}


Widget setupLoading() {
  return const SizedBox(
    height: 100,
    child: Center(
      child: CircularProgressIndicator(color: ColorsManager.mainGreen),
    ),
  );
}

// Widget setupLoading() {
//    return Expanded(
//       child: Column(
//         children: [
//           const CategoriesLoading(),
//           verticalSpace(8),
//           const DoctorsShimmerLoading(),
//         ],
//       ),
//     );
// }