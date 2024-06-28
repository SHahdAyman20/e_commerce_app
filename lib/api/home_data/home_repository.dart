
import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:e_commerce_app/models/product_card_model.dart';


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

}