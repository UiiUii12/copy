import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/Controller/HomeScreenController.dart';

import '../Controller/LoginScreenController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdresseScreenController extends GetxController{
@override
  void onClose() {
    Adresse.dispose();
    super.onClose();
  }
  bool submitAdresse=false;
  final Adresse= new TextEditingController();
  void onSubmitAdresse() {
    submitAdresse=Adresse.text.isNotEmpty;
    update();
  }


Future<void> addAdresseUser() async {

  SharedPreferences address = await SharedPreferences.getInstance() ;
  address.setString("address", Adresse.text);
  HomeScreenController.address.value=address.getString("address")!;
}

}