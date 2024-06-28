import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<String> productImage = [];
  List<String> productDescription = [];
  List<String> productName = [];
  List<String> productOldPrice = [];
  List<String> productPrice = [];
  List<String> productDiscount = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37.h,
      child: ListView.builder(
        itemCount: productImage.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return productImage.isNotEmpty
              ? Container(
                  width: 42.w,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        productImage[index],
                        height: 18.h,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        productDescription[index],
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines:
                            productDescription[index].toString().length > 12
                                ? 2
                                : 1,
                        style: TextStyle(
                          color: widgetTitleColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          productPrice[index],
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${productOldPrice[index]}',
                            style: const TextStyle(
                              color: textGrayColor,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '%${productDiscount[index]} OFF',
                            style: const TextStyle(
                              color: discountTextColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              : const Center(
                  child:
                      CircularProgressIndicator(), // Show a loading indicator while fetching banners
                );
        },
      ),
    );
  }

  Future<void> fetchProducts() async {
    try {
      final response = await AppDio.get(endpoint: Endpoints.products);
      if (response.statusCode == 200) {
        final homeData = response.data;
        final productsData = homeData['data']['products'];
        if (productsData != null && productsData is List<dynamic>) {
          setState(() {
            productImage = productsData
                .map((product) => product['image'] as String)
                .toList();
            productDescription = productsData
                .map((product) => product['description'] as String)
                .toList();
            productName = productsData
                .map((product) => product['name'] as String)
                .toList();
            productOldPrice = productsData
                .map((product) => product['old_price'] as String)
                .toList();
            productPrice = productsData
                .map((product) => product['price'] as String)
                .toList();
            productDiscount = productsData
                .map((product) => product['discount'] as String)
                .toList();
          });
          debugPrint('details ========> $productName');
          debugPrint('productImage ========> $productImage');
          debugPrint('productOldPrice ========> $productOldPrice');
        }
      }
    } catch (error) {
      // Handle Dio error
      debugPrint('product error ===> $error');
    }
  }
}
