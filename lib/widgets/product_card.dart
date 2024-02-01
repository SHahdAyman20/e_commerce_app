import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:e_commerce_app/screens/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCard extends StatefulWidget {

  final List<ProductCardModel> products;

  const ProductCard({Key? key, required this.products}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ProductCardState();
  }
}

class ProductCardState extends State<ProductCard> {


  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        childAspectRatio: 0.65,
        mainAxisSpacing: 2,
        // Adjust this value to change the card size
        children: List.generate(
          widget.products.length,
          (index) {
            return GestureDetector(
              onTap: () async{
                final updatedProduct = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      product: widget.products[index],
                      isFav: widget.products[index].isFav,
                    ),
                  ),
                );
                // Updating the product if a result is received
                if (updatedProduct != null) {
                  setState(() {
                    widget.products[index] = updatedProduct;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.sp),
                margin: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  color: const Color(0xfff3eeee),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // discount%% and fav icon
                    discountAndFavIcon(index),
                    // product image
                    productImage(index),
                    // product details
                    productDetails(index),
                   //s const SizedBox(height: 10,),
                    priceBeforeAndAfterSales(index)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


  Widget discountAndFavIcon(index){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(5.sp),
          margin: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(' ${widget.products[index].discount}% OFF '),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.products[index].isFav = !widget.products[index].isFav;

            });
          },
          icon: Icon(
            Icons.favorite,
            color: (widget.products[index].isFav)
                ? Colors.deepPurple
                : const Color(0xff9A9A9A),
          ),
        ),
      ],
    );
  }

  Widget productImage(index){
    return Expanded(
      child: Image.asset(
        widget.products[index].productImage,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget productDetails(index){
      return IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.products[index].productDescription,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
    );
  }

  Widget priceBeforeAndAfterSales(index){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.products[index].productPriceAfterSale} EG',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 0,),
        Text(
          '${widget.products[index].productPriceBeforeSale} EG',
          style: TextStyle(
              color: Colors.grey[700],
              decoration: TextDecoration.lineThrough),
        ),
        const SizedBox(height: 15,)
      ],
    );
  }
}
