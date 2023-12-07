import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductCardModel product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          widget.product.productDescription,
          style: const TextStyle(
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.sp, right: 20.sp, left: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Product image
              Image.asset(
                widget.product.productImage,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
              ),
              // product name && fav icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // product name
                  Text(
                    widget.product.productDescription,
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 23.sp,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  // Favorite icon
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.deepPurple : null,
                      size: 25.sp,
                    ),
                  ),
                ],
              ),
              // Price before and after sales && discount
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //product Price After Sale
                    Text(
                      '${widget.product.productPriceAfterSale} EG',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.deepPurple),
                    ),
                    //productPriceBeforeSale
                    Text(
                      '${widget.product.productPriceBeforeSale} EG',
                      style: TextStyle(
                          color: Colors.grey[700],
                          decoration: TextDecoration.lineThrough,
                          fontSize: 18.sp),
                    ),
                    // Discount
                    Container(
                        padding: EdgeInsets.all(10.sp),
                        margin: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${widget.product.discount}% ',
                          style:
                              TextStyle(color: Colors.white, fontSize: 17.sp),
                        )),
                  ],
                ),
              ),
              // description text
              Text('Description :',
              style: TextStyle(
                fontSize: 23.sp,
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple
              ),),
              // Brand, color, model, type, size, etc.
              Text(
                'Brand: ${widget.product.brand}',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              Text(
                'Color: ${widget.product.color}',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              Text(
                'Model: ${widget.product.model}',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              Text(
                'Type: ${widget.product.type}',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              Text(
                'Size: ${widget.product.size}',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 20.sp,),
              // Add to Cart button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0.sp),

                  ),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ),
              SizedBox(height: 20.sp,),

            ],
          ),
        ),
      ),
    );
  }
}
