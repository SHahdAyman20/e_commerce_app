import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    'laptops',
    'Phones',
    'Accessories',
    'fashions',
    'Electronics',
    'Shoes'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding:const EdgeInsets.all(7),
          child: ChoiceChip(
            padding:const EdgeInsets.all(10),
            label: Text(categories[index]),
            selected: selectedIndex == index,
            selectedColor: Colors.deepPurple,
            labelStyle: TextStyle(
              color: selectedIndex == index ? Colors.white : Colors.black,
              fontSize: 18
            ),
            onSelected: (bool selected) {
              setState(() {
                selectedIndex = selected ? index : -1;
              });
            },
          ),
        );
      }
        );

  }
}