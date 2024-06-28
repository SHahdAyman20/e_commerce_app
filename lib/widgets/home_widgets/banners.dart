import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/cores/app_dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Banners extends StatefulWidget {
  const Banners({super.key});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {

  List<String> apiBanners = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
          child:apiBanners.isNotEmpty
              ? CarouselSlider.builder(
            itemCount: apiBanners.length ,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              return Container(
                margin:const EdgeInsets.all(10),
                child: Image.network(
                  apiBanners[itemIndex],
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
        )
              :const Center(
                 child: CircularProgressIndicator(), // Show a loading indicator while fetching banners
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i =0 ; i<apiBanners.length ; i++)
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
        )
      ],
    );
  }
  Future<void> fetchBanners() async {
    try {
      final response = await AppDio.get(endpoint: Endpoints.banners);
      if (response.statusCode == 200) {
        final homeData = response.data;
        final data = homeData['data'] as List<dynamic>;
        setState(() {
          apiBanners = data.map((banner) => banner['image'] as String).toList();
        });
      }
    } catch (error) {
      // Handle Dio error
      debugPrint('banners error ======> $error');
    }
  }
}
