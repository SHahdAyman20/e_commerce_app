import 'package:e_commerce_app/screens/e_home_screen.dart';
import 'package:flutter/material.dart';

class EMainScreen extends StatefulWidget {
  const EMainScreen({super.key});

  @override
  State<EMainScreen> createState() => _EMainScreenState();
}

class _EMainScreenState extends State<EMainScreen> {
  int currentIndex = 0;

  final List<String> title = [
    'Home',
    'Search',
    'Profile',
  ];

  final List<Widget> screens =[
  const EHomeScreen(),
  const SizedBox(),
  const SizedBox()
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.11,
        title:  const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Welcome,',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                  ),
                  Text(
                    ' Shahd',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What would you like to buy today?',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.notifications_active),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: categoriesBottomNavigationBar(),
    );
  }

  Widget categoriesBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.deepPurple,
      selectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[400],
      currentIndex: currentIndex,
      selectedIconTheme: const IconThemeData(size: 37),
      onTap: (selectedIndex) {
        setState(() {
          currentIndex = selectedIndex;
        });
      },
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
