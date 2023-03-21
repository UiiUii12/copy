import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controller/RestaurantScreen_controller.dart';

import '../Themes/Theme.dart';
import '../bdd/restauinfo.dart';
import 'Restaurant.dart';
import 'RestaurantScreen.dart';

class Food_Search extends StatelessWidget {
  final String image;

  final String name;

  final double prix;

  final String description;
  final String id ;
  final String resId ;
   var restaurant;


  Food_Search(
      {Key? key, required this.image, required this.name, required this.prix, required this.description, this.restaurant, required this.id, required this.resId,})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<String> tableau = [];
    return
      StreamBuilder<List<String>>(
          stream: RestauService().tabcate(resId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              tableau = snapshot.data!;
            }
            return InkWell(
                onTap: () {
                  RestaurantScreen_controller tab = Get.put(
                      RestaurantScreen_controller(), permanent: true);
                  tab.inisialize(tableau.length, 0);

                  Get.to(
                      RestaurantScreen(image: restaurant.image,
                        name: restaurant.name,
                        adress: restaurant.adress,
                        state: restaurant.state,
                        openTime: restaurant.openTime,
                        id: resId,
                        longitude: restaurant.longitude,
                        latitude: restaurant.latitude,)
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 161.h,
                        width: 281.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(image), fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(9.r),

                        )

                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(name,
                                style: theme().textTheme.subtitle1,
                                textAlign: TextAlign.start,),
                              AutoSizeText('$prix' + ' DA',
                                  textAlign: TextAlign.start,
                                  style: theme().textTheme.subtitle1
                              ),
                            ],
                          ),
                        ),

                      ],),

                  ],

                ));
          }
      );
  }
}
