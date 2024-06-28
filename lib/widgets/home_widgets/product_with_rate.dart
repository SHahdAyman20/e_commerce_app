import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/models/product_with_rate_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductWithRate extends StatelessWidget {
  ProductWithRate({super.key});

  final List<ProductWithRateModel> productData = [

    ProductWithRateModel(
      productImage: 'assets/product/image 46.png',
      productDescription: 'Nike Air Max 270 React ENG',
      price: 534.33,
      priceAfterSale: 299.43,
      discount: 24,
      rate: 4
    ),
    ProductWithRateModel(
      productImage: 'assets/product/image 47.png',
      productDescription: 'Nike Air Max 270 React ENG',
      price: 534.33,
      priceAfterSale: 299.43,
      discount: 24,
      rate: 2,
    ),
    ProductWithRateModel(
      productImage: 'assets/product/image 48.png',
      productDescription: 'Nike Air Max 270 React ENG',
      price: 534.33,
      priceAfterSale: 299.43,
      discount: 24,
      rate: 5,

    ),
    ProductWithRateModel(
      productImage: 'assets/product/image 49.png',
      productDescription: 'Nike Air Max 270 React ENG',
      price: 534.33,
      priceAfterSale: 299.43,
      discount: 24,
      rate: 1
    ),
    ProductWithRateModel(
      productImage: 'assets/product/image 52.png',
      productDescription: 'Nike Air Max 270 React ENG',
      price: 534.33,
      priceAfterSale: 299.43,
      discount: 24,
        rate: 4,
    ),
    ProductWithRateModel(
      productImage: 'assets/product/image 53.png',
      productDescription: 'Nike Air Max 270 React ENG',
      price: 534.33,
      priceAfterSale: 299.43,
      discount: 24,
      rate: 5

    ),
    ProductWithRateModel(
      productImage: 'assets/product/image 54.png',
      productDescription: 'Nike Air Max 270 React ENG',
      price: 534.33,
      priceAfterSale: 299.43,
      discount: 24,
  rate: 1,
    )
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        itemCount: productData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          //Skip products with a rate less than 4
          if (productData[index].rate < 4) {
            return Container();
          }
          return Container(
            width: 42.w,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black.withOpacity(0.2), // Border color
                width: 1.0, // Border thickness
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  productData[index].productImage,
                  height: 18.h,
                  fit: BoxFit.fill,
                ),
                Text(
                  productData[index].productDescription,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: productData[index].productDescription.toString().length >12 ?
                  2 : 1,
                  style:  TextStyle(
                      color: widgetTitleColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.sp
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Icon(
                        Icons.star,
                        color: i < productData[index].rate ? Colors.yellow : Colors.grey,
                      ),
                  ],
                ),
                const SizedBox(height: 4,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${ productData[index].priceAfterSale}',
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w700,

                    ),
                  ),
                ),
                const SizedBox(height: 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${productData[index].price}',
                      style: const TextStyle(
                          color: textGrayColor,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough
                      ),
                    ),
                    Text(
                      '%${productData[index].discount}OFF',
                      style: const TextStyle(
                          color: discountTextColor,
                          fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
