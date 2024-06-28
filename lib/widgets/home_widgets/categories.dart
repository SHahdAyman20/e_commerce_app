import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:e_commerce_app/screens/category_screen/category_screen.dart';
import 'package:e_commerce_app/widgets/some_widgets.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<String> categoryImage = [];
  List<String> categoryName = [];
  List<int> categoryId = [];


  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 14.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryImage.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              navToScreen(
                  context,
                  navToScreen:  CategoryScreen(
                    categoryName: categoryName[index],
                    id : categoryId[index],
                  ),
              );
            },
            child: categoryItemBuilder(
                index: index,
            ),
          );
        },
      ),
    );
  }

  Future<void> fetchCategories() async {
    try {
      final response = await AppDio.get(endpoint: Endpoints.categories);
      if (response.statusCode == 200) {
        final homeData = response.data;
        final data = homeData['data']['data'] as List<dynamic>;
        setState(() {
          categoryId =
              data.map((category) => category['id'] as int).toList();
          categoryImage =
              data.map((category) => category['image'] as String).toList();
          categoryName =
              data.map((category) => category['name'] as String).toList();
          debugPrint('categoriesImage ---->$categoryImage');
          debugPrint('categoriesLabel ---->$categoryName');

        });
      }
    } catch (error) {
      // Handle Dio error
      debugPrint('categories error ===> $error');
    }
  }

  Widget categoryItemBuilder({required int index}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          categoryImage.isNotEmpty
              ? Column(
            children: [
              CircleAvatar(
                radius: 25.sp,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black
                          .withOpacity(0.2), // Border color
                      width: 1.0, // Border thickness
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 24.sp,
                    backgroundColor: Colors.white,
                    child: InkWell(
                      onTap: () {},
                      child: Image.network(
                        categoryImage[index],
                        height: 4.5.h,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                categoryName[index],
                style: TextStyle(fontSize: 14.sp),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
              : const Center(
            child:
            CircularProgressIndicator(), // Show a loading indicator while fetching banners
          )
        ],
      ),
    );
  }
}
