import 'dart:io';
import 'package:e_commerce_app/api/home_data/home_repository.dart';
import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  bool inCart = false;
  bool isFav = false;
  int productNum = 0;

  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];


  void increment() {
    productNum++;
    emit(UpdateProductNumSuccessState());
  }

  void decrement() {
    if (productNum > 1) {
      productNum--;
    }
    emit(UpdateProductNumSuccessState());
  }

  void getProduct({required int id, }) async {
    try {
      emit(LoadingProduct());
      final product = await HomeRepository()!.getProductById(id);
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

  void filteredProduct({required String input}){

    filteredProducts =
                      products.where(
            (element) => element.name.toLowerCase().contains(input)
    ).toList();

    emit(FilterProductSuccessState());
  }
}