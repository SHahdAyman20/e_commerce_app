import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

ProductModel? product;

Widget productCart({
  required image,
  required name,
  required description,
  required oldPrice,
  required price,
  required discount,
}) {
  return Container(
    padding: const EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
      ),
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Image.network(
          image,
          height: 16.h,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: name.toString().length > 12 ? 2 : 1,
          style: TextStyle(
            color: widgetTitleColor,
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '\$ $price',
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w900,
                fontSize: 18.sp),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$$oldPrice',
              style: const TextStyle(
                color: textGrayColor,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            Text(
              '%$discount OFF',
              style: const TextStyle(
                color: discountTextColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
