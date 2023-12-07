import 'package:flutter/material.dart';

class CategoriesBottomNavigationBar extends StatefulWidget {
    CategoriesBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

    int currentIndex = 0;
    ValueChanged onTap;

  @override
  State<CategoriesBottomNavigationBar> createState() => _CategoriesBottomNavigationBarState();
}

class _CategoriesBottomNavigationBarState extends State<CategoriesBottomNavigationBar> {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.deepPurple,
      selectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[400],
      currentIndex: widget.currentIndex,
      selectedIconTheme: const IconThemeData(size: 37),
      onTap: widget.onTap,
      iconSize: 24,
      items: const [
        //home
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        //search
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        //profile
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
