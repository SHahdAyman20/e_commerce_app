import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/screens/product_details_screen/product_details_screen.dart';
import 'package:e_commerce_app/widgets/home_widgets/products/product_item_widget/product_cart_widget.dart';
import 'package:e_commerce_app/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';

Widget productGridList({required category }){
  return FutureBuilder(
      future: category,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        if (snapshot.hasData) {
          debugPrint('${snapshot.data}');
          final listOfCategories =
          (snapshot.data as Map<String, dynamic>)['data']['data'];
          return GridView.builder(
            physics: const
            NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 8,
              childAspectRatio: 0.57,

            ),
            itemCount: listOfCategories.length,
            itemBuilder: (_, index) {
              final product =
              CategoryItemModel.fromJson(listOfCategories[index]);
              return GestureDetector(
                onTap: () {
                  navToScreen(
                    context,
                    navToScreen: ProductDetailsScreen(
                      productId: product.id,
                    ),);

                },
                child: ProductCartWidget(
                  image: product.image,
                  name: product.name,
                  description: product.description,
                  oldPrice: product.oldPrice.toInt(),
                  price: product.price.toInt(),
                  discount: product.discount,
                  isFav: product.inFavorites,
                ),
              );
            },
          );
        }
        return const Center(
          child: Text('There is no data'),
        );
      });
}
