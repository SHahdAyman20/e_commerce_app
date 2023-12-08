import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavProductScreen extends StatefulWidget {


  const FavProductScreen({super.key,});

  @override
  State<FavProductScreen> createState() => _FavProductScreenState();
}

class _FavProductScreenState extends State<FavProductScreen> {

  List<ProductCardModel> products = [
    ProductCardModel(
        productImage: 'assets/Mi-Smart.png',
        productDescription: 'Redmi Note 4',
        productPriceAfterSale: 1300,
        productPriceBeforeSale: 2000,
        discount: 35,
        isFav: false,
        category: 'Phones',
        size: '37',
        brand: 'Redmi',
        color: 'black',
        model: 'Note 4',
        type: 'flat'

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          'Favorite Products',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Image.asset(
                  product.productImage,
                  fit: BoxFit.fill,
                  width: 30.sp,
                  height: 30.sp,
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20,
                          right: 10,
                          bottom: 10
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productDescription,
                          maxLines: 2,
                          style:  TextStyle(
                            fontSize: 20.sp,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '${product.productPriceAfterSale} EG',
                              style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                                color: Colors.deepPurple,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${product.productPriceBeforeSale} EG',
                              style: TextStyle(
                                color: Colors.grey[700],
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[300],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${product.discount}%',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            IconButton(
                  icon: const Icon(Icons.favorite),
                  color: Colors.deepPurple,
                  onPressed: () {},
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
