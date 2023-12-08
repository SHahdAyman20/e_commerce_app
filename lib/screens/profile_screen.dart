import 'package:e_commerce_app/screens/fav_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {


   const ProfileScreen({super.key,});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.sp,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Shahd Ayman',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
              ),
            ),
          ),
          Text(
            'shahdayman@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          profileSections(
            icon: const Icon(Icons.edit_outlined),
            text: 'Edit Profile',
            onPressed: () {},
          ),
          profileSections(
            icon: const Icon(Icons.settings),
            text: 'Settings',
            onPressed: () {},
          ),
          profileSections(
            icon: const Icon(Icons.favorite_border),
            text: 'Fav Product',
            onPressed: () {
              Navigator.push(
                  context,
                MaterialPageRoute (
                  builder: (BuildContext context) => const FavProductScreen(),
                ),
              );
            },
          ),
          profileSections(
            icon: const Icon(Icons.shopping_cart),
            text: 'Orders',
            onPressed: () {},
          ),
          SizedBox(height: 20.sp,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                color: Colors.red,
                size: 23.sp,
              ),
              Text(
                '  LogOut',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget profileSections({
    required Icon icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.deepPurple[100],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(
            icon.icon,
            color: Colors.deepPurple[800],
            size: 23.sp,
          ),
          Text(
            '  $text',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: Colors.deepPurple),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: Colors.deepPurple[300],
            radius: 21.sp,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.navigate_next_rounded,
                size: 25.sp,
                color: Colors.deepPurple[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
