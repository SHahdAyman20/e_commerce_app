part of 'product_cubit.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductSuccessful extends ProductState {

  final ProductModel product;
  ProductSuccessful(this.product);
}

class ProductFailed extends ProductState {}

class ProductNoInternetConnection extends ProductState {}

class LoadingProduct extends ProductState {}