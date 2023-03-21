import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../View/Food.dart';
import '../View/OnBoarding_Pages.dart';
import '../Widgets/customDialog.dart';
import '../Widgets/customWithButtonDialog.dart';


class AppController extends GetxController{


  static void showDialogButton(String title,String ligne1,String ligne2,String asset,void function)async{
    Get.dialog(
      barrierDismissible:true,
      customWithButtonDialog(
        fonction: ()=>function,
        title:title,
        ligne1: ligne1,
        ligne2: ligne2,
        asset: asset,
      ),
    );
  }
  static void showDialogLogin(ligne1,ligne2)async{
    Get.dialog(
      barrierDismissible:false,
      customDialog(
        title:'S''il vous plaît, attendez',
        ligne1: ligne1,
        ligne2: ligne2,
        asset: 'assets/json/sending.json',),

    );}

}