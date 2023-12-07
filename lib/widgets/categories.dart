import 'package:flutter/material.dart';

class Categories extends StatefulWidget {

  final List<String> categories;
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const Categories({
    Key? key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding:const EdgeInsets.all(7),
          child: ChoiceChip(
            padding:const EdgeInsets.all(10),
            label: Text(widget.categories[index]),
            selected: widget.selectedIndex == index,
            selectedColor: Colors.deepPurple,
            labelStyle: TextStyle(
              color: widget.selectedIndex == index ? Colors.white : Colors.black,
              fontSize: 18
            ),
            onSelected: (bool selected) {
              setState(() {
                widget.onCategorySelected( selected ? index : -1);
              });
            },
          ),
        );
      }
        );

  }
}