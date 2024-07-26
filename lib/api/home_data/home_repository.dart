
import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:e_commerce_app/widgets/home_widgets/advertisment/ad.dart';


class HomeRepository{


  Future <dynamic> getCategory({id}) async{
    final res = await AppDio.get(endpoint: '${Endpoints.categories}/$id');
    return res.data;
  }

  Future<ProductModel?> getProductById(int id) async {
    try {
      final response =
      await AppDio.get(endpoint: '${Endpoints.products}/$id');

      return ProductModel.fromJson(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setFavourite(num id) async {
    await AppDio.post(
      endpoint: Endpoints.favorites,
      body: {'product_id': id},
    );
  }

  Future<void> setItemToCart(num id) async {
    await AppDio.post(
      endpoint: Endpoints.carts,
      body: {"product_id": id},
    );
  }

  Future <Data> getAd() async{
    final res = await AppDio.get(endpoint: Endpoints.ad);
    try{
      print('Data.fromJson(res.data[])-----------------${Data.fromJson(res.data['data'])}');
      return Data.fromJson(res.data['data']);
    } catch(e){
      print('e--------------------$e');
      rethrow;
    }
  }

}