import 'package:e_commerce_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ProductCartWidget extends StatefulWidget {
   ProductCartWidget({super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.oldPrice,
    required this.price,
    required this.discount,
    required this.isFav,
  });

  final String image;
  final String name;
  final String description;
  final int oldPrice;
  final int price;
  final int discount;
  bool isFav;

  @override
  State<ProductCartWidget> createState() => _ProductCartWidgetState();
}

class _ProductCartWidgetState extends State<ProductCartWidget> {
  @override
  Widget build(BuildContext context) {
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
          // product image
          Image.network(
            widget.image,
            height: 16.h,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          // product description
          Text(
            widget.name,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: widget.name.toString().length > 12 ? 2 : 1,
            style: TextStyle(
              color: widgetTitleColor,
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
            ),
          ),
          // product price and is fav ?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.price} EGP',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp),
              ),
              IconButton(
                onPressed: (){
                  widget.isFav =! widget.isFav ;
                  setState((){});
                },
                icon: widget.isFav?
                const Icon(Icons.favorite,color: primaryColor,)
                    :
                const Icon(Icons.favorite_outline),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EGP${widget.oldPrice}',
                style:  TextStyle(
                    color: textGrayColor,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 15.sp
                ),
              ),
              Text(
                '%${widget.discount} OFF',
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
}

