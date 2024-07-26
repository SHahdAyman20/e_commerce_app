part of 'layout_cubit.dart';

abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class ProductSuccessful extends LayoutState {

  final ProductModel product;
  ProductSuccessful(this.product);
}

class ProductFailed extends LayoutState {}

class ProductNoInternetConnection extends LayoutState {}

class LoadingProduct extends LayoutState {}

class UpdateProductNumSuccessState extends LayoutState{}

class FilterProductSuccessState extends LayoutState{}


class GetFavoritesSuccessState extends LayoutState{}

class FailedToGetFavoritesState extends LayoutState{}

class AddOrRemoveItemFromFavoritesSuccessState extends LayoutState{}

class FailedToAddOrRemoveItemFromFavoritesState extends LayoutState{}
