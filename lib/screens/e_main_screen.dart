import 'package:e_commerce_app/screens/e_home_screen.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:e_commerce_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class EMainScreen extends StatefulWidget {
  const EMainScreen({super.key});

  @override
  State<EMainScreen> createState() => _EMainScreenState();
}

class _EMainScreenState extends State<EMainScreen> {
  int currentIndex = 0;

  final List<Widget> screens =[
  const EHomeScreen(),
  const SizedBox(),
   ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: currentIndex==0? AppBar(
        toolbarHeight: screenHeight * 0.11,
        backgroundColor: Colors.deepPurple,
        titleTextStyle:const TextStyle(
          color: Colors.white
        ),
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
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),
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
            icon: const Icon(Icons.notifications_active,color: Colors.white,),
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart,color: Colors.white,),
          ),
        ],
      ): null,
      body: screens[currentIndex],
      bottomNavigationBar: CategoriesBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (selectedIndex) {
          setState(() {
            currentIndex = selectedIndex;
          });
        },),
    );
  }


}
