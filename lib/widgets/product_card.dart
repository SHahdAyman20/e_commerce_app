import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductCardState();
  }
}

class ProductCardState extends State<ProductCard> {
  List<ProductCardModel> product = [
    ProductCardModel(
      productImage: 'assets/Mi-Smart.png',
      productDescription: 'ProductCardModel',
      productPriceAfterSale: 1300,
      productPriceBeforeSale: 2000,
      discount: 35,
    ),
    ProductCardModel(
      productImage: 'assets/headphone.png',
      productDescription: 'SONY premium wireless headphone',
      productPriceAfterSale: 700,
      productPriceBeforeSale: 1000,
      discount: 30,
    ),
    ProductCardModel(
      productImage: 'assets/shirt.png',
      productDescription: 'Lycra Men’s shirt',
      productPriceAfterSale: 250,
      productPriceBeforeSale: 500,
      discount: 50,
    ),
    ProductCardModel(
      productImage: 'assets/shoes.png',
      productDescription: 'Nike/L v Air-force 1',
      productPriceAfterSale: 1000,
      productPriceBeforeSale: 1200,
      discount: 17,
    ),
  ];
bool isFav= false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(

      child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          childAspectRatio: 0.75, // Adjust this value to change the card size

          children: List.generate(
              product.length, (index) {
            return Container(
              // width: screenWidth *0.3,
              // height: 600,
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:  Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                            ' ${product[index].discount} % '
                        ),
                      ),
                      IconButton(
                          onPressed: (){},
                          icon:const Icon(Icons.favorite_border,),
                      )
                    ],
                  ),
                  Image.asset(product[index].productImage,height: 100,),
                  const SizedBox(height: 10,),
                  Text(
                    product[index].productDescription,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          '${product[index].productPriceAfterSale} EG',
                        style:const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '${product[index].productPriceBeforeSale} EG',
                        style: TextStyle(
                            color: Colors.grey[700],
                            decoration: TextDecoration.lineThrough
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
      )
          ),
    );
  }
}
