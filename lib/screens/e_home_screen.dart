import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:e_commerce_app/widgets/baners.dart';
import 'package:e_commerce_app/widgets/categories.dart';
import 'package:e_commerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class EHomeScreen extends StatefulWidget{
  const EHomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EHomeScreenState();
  }
  
}
class EHomeScreenState extends State<EHomeScreen>{

  List<String> categories = [
    'General',
    'laptops',
    'Phones',
    'Accessories',
    'fashions',
    'Electronics',
    'Shoes',
  ];

  List<ProductCardModel> product = [
    ProductCardModel(
      productImage: 'assets/Mi-Smart.png',
      productDescription: 'Redmi Note 4',
      productPriceAfterSale: 1300,
      productPriceBeforeSale: 2000,
      discount: 35,
      isFav: false,
      category: 'Phones',
    ),
    ProductCardModel(
      productImage: 'assets/headphone.png',
      productDescription: 'SONY premium wireless headphone',
      productPriceAfterSale: 700,
      productPriceBeforeSale: 1000,
      discount: 30,
      isFav: false,
      category: 'Accessories',
    ),
    ProductCardModel(
      productImage: 'assets/shirt.png',
      productDescription: 'Lycra Men’s shirt',
      productPriceAfterSale: 250,
      productPriceBeforeSale: 500,
      discount: 50,
      isFav: false,
      category: 'fashions',

    ),
    ProductCardModel(
      productImage: 'assets/shoes.png',
      productDescription: 'Nike/L v Air-force 1',
      productPriceAfterSale: 1000,
      productPriceBeforeSale: 1200,
      discount: 17,
      isFav: false,
      category: 'Shoes',

    ),
  ];

  List<ProductCardModel> filteredProducts = [];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    filterProducts();
  }

  void filterProducts() {
    if (selectedIndex == 0) {
      filteredProducts = List.from(product);
    } else{
      filteredProducts = product.where((p) => p.category == categories[selectedIndex]).toList();
  }
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    //final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          // banners
          SizedBox(
              height: screenHeight * 0.27,
              child: Banners()
          ),
          // categories
          SizedBox(
              height: screenHeight * 0.12,
              child:  Categories(
                categories: categories,
                selectedIndex: selectedIndex,
                onCategorySelected: (index) {
                  setState(() {
                    selectedIndex = index;
                    filterProducts();
                  });
                },
              ),
          ),
          // products
          SizedBox(
              height: screenHeight * 0.7,
              child:  ProductCard(
                  products: filteredProducts,
              ),
          )
        ],
      )

    );
  }

}