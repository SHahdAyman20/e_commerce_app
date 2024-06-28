import 'dart:io';

import 'package:e_commerce_app/api/home_data/home_repository.dart';
import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getProduct({required int id}) async {
    try {
      emit(LoadingProduct());
      final product = await HomeRepository().getProductById(id);
      if (product != null) {
        emit(ProductSuccessful(product));
      }
    } on SocketException catch (e) {
      emit(ProductNoInternetConnection());
    } on Exception catch (e) {
      emit(ProductFailed());
    } catch (e) {
      emit(ProductFailed());
    }
  }
}