import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/screens/cart_screen/screen/cart_card_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
   const CartScreen({super.key, required this.productId});
   final int productId;

   @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
      appBar: appBar(),
       body:  CartCardModel(productId: productId)
    );
  }


   PreferredSizeWidget appBar(){
     return AppBar(
       backgroundColor: Colors.white,
       title: const Text(
         'Your Cart',
         style: TextStyle(
           color: widgetTitleColor,
           fontWeight: FontWeight.w700,
         ),

       ),
     );
   }


}
