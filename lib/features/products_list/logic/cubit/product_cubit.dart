import 'package:bloc/bloc.dart';
import 'package:waie/features/products_list/data/repository/product_repo.dart';
import 'package:waie/features/products_list/logic/cubit/product_state.dart';

import '../../data/model/product_models/product.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepo) : super(const ProductState.initial());

  final ProductRepo _productRepo;

  List<Product?> productsList = [];
  int currentPage = 1;
  final int pageSize = 8;
  bool isLoadingMore = false;
  bool hasMoreData = true;

  int? categoryId;

  void getProducts({bool isInitialLoad = false, int? categoryId}) async {
    if (isInitialLoad) {
      // Reset pagination variables for initial load
      currentPage = 1;
      productsList.clear();
      hasMoreData = true;
      this.categoryId = categoryId; // Set the categoryId (could be null)
    }

    if (isLoadingMore || !hasMoreData) {
      return; // Prevent multiple requests or if no more data
    }

    isLoadingMore = true;
    emit(ProductState.productLoading(productsList));

    final response = await _productRepo.getProduct(
      pageNumber: currentPage,
      pageSize: pageSize,
      categoryId: this.categoryId, // Pass categoryId (could be null)
    );

    response.when(
      success: (productResponse) {
        final newProducts = productResponse.result ?? [];

        if (newProducts.isEmpty) {
          hasMoreData = false;
        } else {
          productsList.addAll(newProducts);
          currentPage++;
        }

        isLoadingMore = false;
        emit(ProductState.productSuccess(productsList));
      },
      failure: (errorHandler) {
        isLoadingMore = false;
        emit(ProductState.productError(errorHandler));
      },
    );
  }
}

