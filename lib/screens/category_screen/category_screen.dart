import 'package:e_commerce_app/api/home_data/home_repository.dart';
import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/screens/product_details_screen/product_details_screen.dart';
import 'package:e_commerce_app/widgets/home_widgets/product_widget.dart';
import 'package:e_commerce_app/widgets/some_widgets.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;
  final int id;

  const CategoryScreen({
    super.key,
    required this.id,
    required this.categoryName,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  dynamic category;
  @override
  void initState() {
    super.initState();
    category = HomeRepository().getCategory(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.6,
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
                      child: productCart(
                        image: product.image,
                        name: product.name,
                        description: product.description,
                        oldPrice: product.oldPrice,
                        price: product.price,
                        discount: product.discount,
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: Text('There is no data'),
              );
            }),
      ),
    );
  }
}
