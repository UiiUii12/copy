import 'package:get/get.dart';
import '../View/Food.dart';
import '../classes/commande.dart';
import 'AppController.dart';
import 'CartController.dart';

class OrderConfirmerController extends GetxController{
  void archiveCurrentCommand(Commande c){

    for(Food food in CartController.commande.plats) {
      food.ajouter.value=false;
    }
   // CartController.commande= Commande('', '' , '' ,restaurant:'',plats:<Food>[].obs,etat: '');
    update() ;

  }
}