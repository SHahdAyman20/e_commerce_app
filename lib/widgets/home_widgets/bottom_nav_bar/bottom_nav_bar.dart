import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/screens/cart_screen/screen/cart_screen.dart';
import 'package:e_commerce_app/screens/fav_screen/fav_product_screen.dart';
import 'package:e_commerce_app/screens/home_screen/e_home_screen.dart';
import 'package:e_commerce_app/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class ScreensBottomNavBar extends StatefulWidget {
    const ScreensBottomNavBar({super.key});


  @override
  State<ScreensBottomNavBar> createState() => _ScreensBottomNavBarState();
}

class _ScreensBottomNavBarState extends State<ScreensBottomNavBar> {

  int currentIndex = 0;
  final List<Widget> screens = const [
    EHomeScreen(id: 44,),
    FavProductScreen(),
    CartScreen(productId: 44),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: textGrayColor,
        currentIndex: currentIndex,
        selectedIconTheme: const IconThemeData(size: 37),
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        iconSize: 24,
        items: const [
          //home
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          //fav screen
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: 'Favourites',
          ),
          // cart screen
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          //profile
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
            label: 'Account',
          ),
        ],
      ),
    );

  }
}
