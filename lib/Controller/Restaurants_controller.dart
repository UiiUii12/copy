import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../View/Restaurant.dart';


class Restaurants_controller extends GetxController {
  bool is_loaded = false;
  final List<Restaurant> restaurants = [

  ];
  @override
  void onInit() {
    super.onInit();
    loading();
  }

  @override
  Future loading() async {
    is_loaded = false;
    await Future.delayed(Duration(seconds: 1), () {});
    is_loaded = true;
    update();
  }
  @override
  void onClose() {
    super.onClose();
  }
}
