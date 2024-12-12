import 'package:bloc/bloc.dart';
import 'package:waie/features/products_list/data/model/product_models/product.dart';
import 'package:waie/features/products_list/data/repository/product_repo.dart';
import 'package:waie/features/products_list/logic/cubit/product_state.dart';

class SimilarProductsCubit extends Cubit<ProductState> {
  final ProductRepo _productRepo;

  SimilarProductsCubit(this._productRepo) : super(const ProductState.initial());

  Future<void> fetchProducts({
    int pageNumber = 1,
    int pageSize = 8,
    int? categoryId,
    int? materialId,
    int? brandId,
    int? styleId,
  }) async {
    var currentProducts = state.maybeWhen(
      productSuccess: (products) => products,
      orElse: () => <Product>[],
    );

    emit(ProductState.productLoading(currentProducts));

    final response = await _productRepo.getProduct(
      pageNumber: pageNumber,
      pageSize: pageSize,
      categoryId: categoryId,
      materialId: materialId,
      brandId: brandId,
      styleId: styleId,
    );

    response.when(
      success: (productResponse) {
        final similarProducts = productResponse.result.whereType<Product>().toList();
        emit(ProductState.productSuccess(similarProducts));
      },
      failure: (errorHandler) {
        emit(ProductState.productError(errorHandler));
      },
    );
  }
}
