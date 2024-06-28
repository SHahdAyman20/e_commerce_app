import 'package:e_commerce_app/api/home_data/home_repository.dart';
import 'package:e_commerce_app/models/categories_model.dart';
import 'package:e_commerce_app/screens/product_details_screen/product_details_screen.dart';
import 'package:e_commerce_app/widgets/home_widgets/banners.dart';
import 'package:e_commerce_app/widgets/home_widgets/categories.dart';
import 'package:e_commerce_app/widgets/home_appbar.dart';
import 'package:e_commerce_app/widgets/home_widgets/product_widget.dart';
import 'package:e_commerce_app/widgets/some_widgets.dart';
import 'package:e_commerce_app/widgets/widget_title_and_view_more.dart';
import 'package:flutter/material.dart';

class EHomeScreen extends StatefulWidget {
  const EHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EHomeScreenState();
  }
}

class EHomeScreenState extends State<EHomeScreen> {
  int selectedIndex = 0;
  dynamic category;
  int? id;

  @override
  void initState() {
    super.initState();
    category = HomeRepository().getCategory(id: id); // Call the function to fetch category data
    // filterProducts();
  }

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [

              // Top widget [ search bar & fav icon & notification icon ]
              homeAppBar(
                searchController: searchController,
                favIconOnPressed: () {},
                notificationOnPresses: () {},
              ),
              // Second widget [ slider for banners ]
              const Banners(),
              // Third widget [ categories title & see more ]
              widgetTitleAndViewMore(
                widgetTile: 'Category',
                seeMoreTitle: 'More Category',
                onTap: () {
                },
              ),
              // forth widget [ categories ]
              const Categories(),
              // Fifth widget [ flash sale title & see more ]
              widgetTitleAndViewMore(
                widgetTile: 'Flash Sale',
                seeMoreTitle: 'See more',
                onTap: () {},
              ),
              // sixth widget [ flash sale product ]
              product(),
            ],
          ),
        ),
      ),
    );
  }

  Widget product() {
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
        final data= snapshot.data;

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
                    ),
                  );
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
        }else {
          debugPrint('Invalid data structure: $data');
          return const Center(
            child: Text('Invalid data structure'),
          );
        }

      },
    );
  }

}