import 'package:e_commerce_app/const/const.dart';
import 'package:flutter/material.dart';

Widget homeAppBar(context,{required TextEditingController searchController,required ValueChanged onChanged}){
  return Row(
    children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                onChanged: onChanged,
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
    ],
  );
}