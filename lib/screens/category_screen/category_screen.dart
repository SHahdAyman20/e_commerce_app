import 'package:e_commerce_app/api/home_data/home_repository.dart';
import 'package:e_commerce_app/widgets/home_widgets/products/products_design_and_build/products_grid_list.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;
  final int id;

  const CategoryScreen({
    super.key,
    required this.id,
    required this.categoryName,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  dynamic category;
  @override
  void initState() {
    super.initState();
    category = HomeRepository().getCategory(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: productGridList(category: category),
        ),
      ),
    );
  }
}
