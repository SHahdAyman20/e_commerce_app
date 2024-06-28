import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/screens/product_details_screen/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool? videoCall;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProduct(id: widget.productId);
  }

  @override
  void didUpdateWidget(covariant ProductDetailsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    videoCall = false;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {

        if(state is ProductSuccessful){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                  state.product.name,
                maxLines: 1,
                textDirection: TextDirection.rtl,
                style:  TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  overflow: TextOverflow.ellipsis,
                  color: widgetTitleColor,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  // Product Images slider
                  CarouselSlider.builder(
                    itemCount: state.product.images.length ,
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                      return Container(
                        margin:const EdgeInsets.all(10),
                        child: Image.network(
                          state.product.images[itemIndex],
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      );
                    }, options: CarouselOptions(
                    initialPage: 1,
                    autoPlay: true,
                    onPageChanged: (index,reason){
                      debugPrint(reason.toString());
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  ),
                  // dots builder
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(int i =0 ; i<state.product.images.length ; i++)
                        Container(
                          height: currentIndex == i ? 15 : 9,
                          width: currentIndex == i ? 15 : 9,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: currentIndex == i ? primaryColor : textGrayColor,
                              shape: BoxShape.circle,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(2, 2)
                                )
                              ]
                          ),
                        )
                    ],
                  ),
                  // product name
                  Text(
                    state.product.name,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff223263),
                    ),
                  ),
                  // product price
                  Text(
                    '${state.product.price} EGP',
                    textDirection: TextDirection.ltr,
                    style:  TextStyle(
                      color: Colors.purple[900],
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  // product description
                  const Text(
                    'Description :',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  Text(
                    '${state.product.description} ',
                    textDirection: TextDirection.rtl,
                    style:  TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if(state is LoadingProduct) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if(state is ProductFailed) {
          return const Scaffold(
            body: Center(child: Text('Error try again!')),
          );
        }

        if(state is ProductNoInternetConnection) {
          return const Scaffold(
            body: Center(child: Text('No Internet Connection!')),
          );
        }

        return const SizedBox();

      },
    );
  }
}
