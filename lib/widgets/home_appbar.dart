import 'package:e_commerce_app/const/const.dart';
import 'package:flutter/material.dart';

Widget homeAppBar({required TextEditingController searchController,required VoidCallback favIconOnPressed,required VoidCallback notificationOnPresses}){
  return Row(
    children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                controller: searchController,
                decoration: InputDecoration(
                    hintText: 'Search Product',
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: const Icon(Icons.search,color: primaryColor,),
                    prefixIconColor: textGrayColor,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: textGrayColor), // Change the border color here
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: textGrayColor), // Change the border color when focused
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                    )
                ),
                validator: (searchKey){
                  if (searchKey!.isEmpty) {
                    return 'this field is required!';
                  }
                },
              ),
            ),
          ),
          IconButton(
              onPressed: favIconOnPressed,
              icon: const Icon(Icons.favorite_border,color: textGrayColor,)
          ),
          IconButton(
              onPressed: notificationOnPresses,
              icon:const Icon(Icons.notifications_on,color: textGrayColor)
          ),
    ],
  );
}