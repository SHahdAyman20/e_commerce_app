import 'package:e_commerce_app/api/home_data/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:convert';

Widget showAd({required String image}) { // Update the parameter type to String?
  return SizedBox(
    width: double.infinity,
    height: 50.h,
    child: Image.network(
      image,
      fit: BoxFit.fill,
    ),
  );
}

class Ad extends StatelessWidget {
  String image;
  Ad({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: HomeRepository().getAd(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            final ad = snapshot.data!.ad;
            return Image.network(
              ad,
              height: 100,
              width: 100,
            );
          } else if (snapshot.hasError) {
            return Text('Error loading image:${snapshot.error.toString()}');
          } else {
            return const CircularProgressIndicator();
          }
        }
    );
  }
}


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  bool status;
  dynamic message;
  Data data;

  Welcome({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String ad;

  Data({
    required this.ad,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    ad: json["ad"],
  );

  Map<String, dynamic> toJson() => {
    "ad": ad,
  };
}
