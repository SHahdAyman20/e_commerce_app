import 'package:e_commerce_app/api/home_data/home_repository.dart';
import 'package:e_commerce_app/widgets/home_widgets/banners/banners.dart';
import 'package:e_commerce_app/widgets/home_widgets/category/categories.dart';
import 'package:e_commerce_app/widgets/app_bar/home_appbar.dart';
import 'package:e_commerce_app/widgets/home_widgets/products/products_design_and_build/products_grid_list.dart';
import 'package:e_commerce_app/widgets/widget_title_and_view_more.dart';
import 'package:flutter/material.dart';

class EHomeScreen extends StatefulWidget {
  const EHomeScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<StatefulWidget> createState() {
    return EHomeScreenState();
  }
}

class EHomeScreenState extends State<EHomeScreen> {
  int selectedIndex = 0;
  dynamic category;
  String? ad;

  @override
  void initState() {
    super.initState();
    category = HomeRepository().getCategory(
        id: widget.id); // Call the function to fetch category data
    ad = HomeRepository().getAd().toString();
  }

  final searchController = TextEditingController();

  // searchBar - banners - categories - products

  @override
  Widget build(BuildContext context) {
    // final cubit = BlocProvider.of<LayoutCubit>(context);
    //
    // return BlocConsumer<LayoutCubit, LayoutState>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  // Top widget [ search bar & fav icon & notification icon ]
                  homeAppBar(
                    context,
                    searchController: searchController,
                    onChanged: (input){
                     // cubit.filteredProduct(input: input);
                    }
                  ),
                  // Second widget [ slider for banners ]
                  const Banners(),
                  // Third widget [ categories title & see more ]
                  widgetTitleAndViewMore(widgetTile: 'Categories',),
                  // forth widget [ categories ]
                  const Categories(),
                  // Fifth widget [ flash sale title & see more ]
                  widgetTitleAndViewMore(widgetTile: 'Products',),
                  // sixth widget [ products ]
                  productGridList(category: category),
                  // showAd(image: ad.toString()),
                  //Ad(image: ad.toString())
                ],
              ),
            ),
          ),
        );
    //   },
    // );
  }
}
