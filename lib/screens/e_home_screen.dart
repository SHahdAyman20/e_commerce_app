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
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
              height: screenHeight * 0.27,
              child: Banners()
          ),
          SizedBox(
              height: screenHeight * 0.12,
              child: Categories()),
          SizedBox(
              height: screenHeight * 0.7,
              child: ProductCard())
        ],
      )

    );
  }

}