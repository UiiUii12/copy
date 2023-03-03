import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

import '../View/Restaurant.dart';
import '../classes/OpenTime.dart';


class RestaurantController extends GetxController {
  var time = DateTime.now().obs;
  final List<Restaurant> restaurants = [
  ];

  void time_change_detector(OpenTime range, var isOpened) {
    var now = DateTime.now().obs;
    var nextMinute = DateTime(now.value.year, now.value.month, now.value.day,
        now.value.hour, now.value.minute + 1);
    Timer(nextMinute.difference(now.value), () {
      Timer.periodic(Duration(minutes: 1), (timer) {
        is_opened(DateTime.now(), range, isOpened);
        update();
      });
      update();
    });
  }

  void is_opened(DateTime time, OpenTime range, var is_opened) {
    if (time.hour < range.openHour.hour ||
        time.hour > range.closeHour.hour ||
        (time.hour == range.openHour.hour &&
            time.minute < range.openHour.minute) ||
        (time.hour == range.closeHour.hour &&
            time.minute > range.closeHour.minute)) {
      is_opened.value = false;
    } else {
      is_opened.value = true;
    }
    update();
  }
  List Data (AsyncSnapshot snapshot){
    List list_of_data =[];
    if (snapshot.hasData){
      list_of_data=snapshot.data!;
    }
    return list_of_data ;
  }
}
