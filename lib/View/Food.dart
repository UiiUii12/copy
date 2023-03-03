import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Controller/FoodController.dart';
import '../Themes/Theme.dart';


class Food extends StatelessWidget {
  final String image ;
  final String name ;
  final double prix ;
  final String description ;
  var  List_of_food;
  var nom_restaurant ;
  String id ;
  String resId ;
  String categore ;
  Food( {Key? key,  required this.image,  required this.name, required this.prix , required this.ajouter , this.nom_restaurant ,  required this.description,this.List_of_food, required this.id, required this.resId, required this.categore,  }) : super(key: key) ;
  var ajouter = false.obs  ;
  final counter = 1.obs ;
  @override
  bool operator == ( Object food) {
    return food is Food && food.name == name && food.image == image && food.prix == prix && food.description == description ;
  }
  FoodController controller = Get.put(FoodController())  ;
  @override
  Widget build(BuildContext context) {


    return
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 161.h ,
              width:281.w ,
              decoration : BoxDecoration(
                image : DecorationImage(image: NetworkImage(image) , fit: BoxFit.cover ) ,
                borderRadius: BorderRadius.circular(9.r) ,

              )

          ) ,
          SizedBox(height: 10.h,) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(name  ,
                      style: theme().textTheme.subtitle1 ,
                      textAlign: TextAlign.start,) ,
                    AutoSizeText('$prix'+ ' DA' ,
                        textAlign: TextAlign.start,
                        style: theme().textTheme.subtitle1
                    ) ,
                  ],
                ),
              ) ,
              GetX<FoodController>(
                builder: ( controller){
                  return ElevatedButton(onPressed:(){
                    controller.ajouter_annuler(
                        List_of_food  ,
                        Food(image: image, name: name, prix: prix, description: description, ajouter: ajouter, id: id, resId: resId, categore: categore,    ) , nom_restaurant ) ;
                  },
                    child: AutoSizeText(ajouter.value ? 'Annuler' : 'Ajouter' ,
                        style: ajouter.value ? theme().textTheme.bodyText2?.copyWith(color: Color(0xffE6424B)) : theme().textTheme.bodyText2?.copyWith(color: Color(0xff669965))
                    ) ,
                    style: ElevatedButton.styleFrom(
                        primary: ajouter.value? Color(0xffFAB4B8) : Color(0xffE8F7E5),
                        onPrimary:ajouter.value ? Color(0xffE6424B) : Color(0xff669965) ,
                        minimumSize: Size(100.w, 32.h) ,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r))
                    ),
                  );
                },

              )
            ],) ,

        ],

      );
  }
}