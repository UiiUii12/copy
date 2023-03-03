import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../View/Restaurant.dart';
import '../classes/Category.dart';
import '../classes/promotion.dart';

class HomeScreenController extends GetxController {
  List list_of_data =[];

  final List<Restaurant> restaurants = [

  ];
  List<Promotion> promotion = [

  ];

  List<Category> Cat = [
    Category(
      'Pizza',
      'assets/images/pizza.svg',
      []
    ),
    Category(
      'Soup',
      'assets/images/soup.svg',
      []
    ),
    Category(
      'Sandwich',
      'assets/images/sandwich.svg',
      []
    ),
    Category(
      'Drink',
      'assets/images/drink.svg',
      []
    ),
    Category(
      'Burger',
      'assets/images/burger.svg',
      []
    ),
    Category(
      'Tacos',
      'assets/images/tacos.svg',
      []
    ),

  ];
  List Data (AsyncSnapshot snapshot){

    if (snapshot.hasData){
      list_of_data=snapshot.data!;
    }
    return list_of_data;
  }
  static List<Color> ColorsPromo = [
    Color(0xffE6424B),
    Color(0xff3F3D56),
    Color(0xfff9a825),
    Color(0xffff6584),
    Color(0xff8b4e56),
    Color(0xff6b667c),
    Color(0xffe1e0e1)
  ];
  static var ind = Random();
}
