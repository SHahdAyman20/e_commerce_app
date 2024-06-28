import 'package:e_commerce_app/const/const.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 35.sp,
        title: Text(
          'Account',
          style: TextStyle(
              color: widgetTitleColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          profileSections(
            icon: const Icon(Icons.person_outline_sharp),
            text: 'Profile',
            onPressed: () {},
          ),
          profileSections(
            icon: const Icon(Icons.shopping_bag_outlined),
            text: 'Order',
            onPressed: () {},
          ),
          profileSections(
            icon: const Icon(Icons.location_on_outlined),
            text: 'Address',
            onPressed: () {},
          ),
          profileSections(
            icon: const Icon(Icons.payment),
            text: 'Payment',
            onPressed: () {},
          ),
          SizedBox(height: 20.sp,),
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
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Icon(
            icon.icon,
            color: primaryColor,
            size: 23.sp,
          ),
          Text(
            '  $text',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: widgetTitleColor),
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.navigate_next_rounded,
              size: 25.sp,
              color: Colors.deepPurple[700],
            ),
          ),
        ],
      ),
    );
  }
}
