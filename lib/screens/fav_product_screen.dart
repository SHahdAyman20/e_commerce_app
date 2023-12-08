import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:flutter/material.dart';


class FavProductScreen extends StatefulWidget {
  const FavProductScreen({super.key});

  @override
  State<FavProductScreen> createState() => _FavProductScreenState();
}

class _FavProductScreenState extends State<FavProductScreen> {
  List<ProductCardModel> favoriteProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: const BackButton(
          color: Colors.white,
        ),
        title:const Text('Favorite Products',style:  TextStyle(
          color: Colors.white,
        ),),
      ),
      body: ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];
          return ListTile(
            leading: Image.asset(
              product.productImage,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productDescription,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '${product.productPriceAfterSale} EG',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${product.productPriceBeforeSale} EG',
                      style: TextStyle(
                        color: Colors.grey[700],
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${product.discount}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.favorite),
              color: Colors.deepPurple,
              onPressed: () {
                setState(() {
                  favoriteProducts.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}