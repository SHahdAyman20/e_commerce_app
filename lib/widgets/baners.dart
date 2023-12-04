import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  Banners({super.key});

  List<String> banners = [
    'assets/banner 1.png',
    'assets/banner 2.png',
    'assets/banner 3.png'
  ];

  @override
  Widget build(BuildContext context) {
        return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: banners.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding:const EdgeInsets.all(10),
          child: SizedBox(
            child: Image.asset(banners[index]),
          ),
        );
      },
    );
  }
}
