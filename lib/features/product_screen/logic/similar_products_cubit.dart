import 'package:bloc/bloc.dart';
import 'package:watd/features/products_list/data/model/product_models/product.dart';
import 'package:watd/features/products_list/data/repository/product_repo.dart';
import 'package:watd/features/products_list/logic/cubit/product_state.dart';

class SimilarProductsCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;

  SimilarProductsCubit(this._productRepo) : super(const ProductState.initial());

  Future<void> fetchSimilarProductsOr({
    required int currentProductId,
    int pageNumber = 1,
    int pageSize = 5,
    int? categoryId,
    int? materialId,
    int? brandId,
    int? styleId,
  }) async {
    emit(ProductState.productLoading([]));

    // All products in a Set to avoid duplicates
    Set<Product> allResults = {};

    // Helper function to fetch products by a single criterion
    Future<void> fetchByCriterion({
      int? catId,
      int? matId,
      int? brId,
      int? stId,
    }) async {
      final response = await _productRepo.getProduct(
        pageNumber: pageNumber,
        pageSize: pageSize,
        categoryId: catId,
        materialId: matId,
        brandId: brId,
        styleId: stId,
      );

      response.when(
        success: (productResponse) {
          final products = productResponse.result.whereType<Product>();
          for (var p in products) {
            if (p.productId != currentProductId) {
              allResults.add(p);
            }
          }
        },
        failure: (errorHandler) {
        },
      );
    }

    // Fetch each filter independently 
    if (categoryId != null) {
      await fetchByCriterion(catId: categoryId);
    }
    if (materialId != null) {
      await fetchByCriterion(matId: materialId);
    }
    if (brandId != null) {
      await fetchByCriterion(brId: brandId);
    }
    if (styleId != null) {
      await fetchByCriterion(stId: styleId);
    }

    // Now 'allResults' contains products from any of the provided filters (OR logic)
    emit(ProductState.productSuccess(allResults.toList().take(5).toList()));
  }
}

