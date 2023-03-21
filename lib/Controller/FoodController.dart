import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../View/Food.dart';
import 'AppController.dart';
import 'CartController.dart';


class FoodController extends GetxController {
  void ajouter_annuler( RxList list , Food food, String restaurant) {
    CartController.commande.restaurant==restaurant || CartController.commande.restaurant=="" ? ()
    {
      food.ajouter.value = !food.ajouter.value;
      int index=list.indexOf(food);
      if (food.ajouter.value) {
        list.add(food);
      }else
      {
        if(index !=-1) list.removeAt(index);
      }
    } ():AppController.showDialogButton(
        'le code de vérification est erroné',
        'votre code est erroné, veuillez ajouter',
        'un code valide',
        'assets/json/exclamation.json',
        null);
  }


}