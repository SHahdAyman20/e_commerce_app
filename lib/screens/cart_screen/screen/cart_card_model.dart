import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/models/product_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../cubit/layout_cubit.dart';

class CartCardModel extends StatefulWidget {
    const CartCardModel({super.key, required this.productId});

   final int productId;


  @override
  State<CartCardModel> createState() => _CartCardModelState();
}

class _CartCardModelState extends State<CartCardModel> {

  @override
  void initState() {
    super.initState();
    context.read<LayoutCubit>().getProduct(id: widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    ProductModel? product;

    final cubit = LayoutCubit();

    return  BlocBuilder<LayoutCubit, LayoutState>(
  builder: (context, state) {
    if (product != null) {
      return Container(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context,index){
            return Container(
              height: 18.h,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: const Color(0xffc7cad7),
                      width: 1
                  )
              ),
              child: Row(
                children: [
                  Image.network(
                    product.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,

                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: widgetTitleColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.sp
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.delete_outline_rounded),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product.price.toString(),
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    height: 12.h,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadiusDirectional.circular(5),
                                        border: Border.all(
                                            color: textGrayColor
                                        )
                                    ),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:
                                      [
                                        SizedBox(width: 2.w,),
                                        GestureDetector(
                                          onTap: () {
                                            cubit.decrement();
                                          },
                                          child:  Text('-',style: TextStyle(fontSize: 20.sp,color: Colors.red,fontWeight: FontWeight.bold),),
                                        ),
                                        SizedBox(width: 2.w,),
                                          Text(
                                            cubit.productNum.toString(),
                                            //cubit.productNum.toString(),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        SizedBox(width: 2.w,),
                                        GestureDetector(
                                          onTap: () {
                                            cubit.increment();
                                          },
                                          child:  Text('+',style: TextStyle(fontSize: 20.sp,color: Colors.green),),
                                        ),
                                        SizedBox(width: 2.w,),

                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
      ),
    );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/cart_empty.png'
          )
        ],
        
      );
    }
  },
);
  }
}
