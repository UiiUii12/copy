import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../View/Food.dart';

import '../classes/commande.dart';

class CartController extends GetxController {
  static   Commande commande=Commande( '','' , '' ,restaurant:'',plats:<Food>[].obs,etat: '');

  void increment(var total , var counter , double prix , var cout_total) {


    total.value < 30 ? (){ counter++ ; cout_total.value = (cout_total.value)+  prix ; total.value ++ ; }() : counter ;
    update() ;
  }
  void decrement (var total ,var counter, double prix , var cout_total){
    counter.value >1 ? (){ counter-- ; cout_total.value = (cout_total.value)-  prix ; total.value -- ; } (): counter ;
    update();
  }

  void Delete ( Food food , var cout_total ){
    Get.snackbar(
        'Supprimer', 'Cet élément a été supprimé' ,
        duration: Duration(seconds: 1) ,
        snackPosition: SnackPosition.BOTTOM ,
        backgroundColor: Color(0xffE4E4E4)
    ) ;
    cout_total.value = cout_total.value - food.prix * food.counter.value ;
    print(food.counter) ;
    update() ;

  }
  void Remove_from_cart(List<Food> cart   ,Food food) {
    int index= cart.indexOf(food) ;
    index!= -1 ?  cart.removeAt(index)  : null ;
    cart.length==0 ?  commande= Commande('', '' , '' ,restaurant:'',plats:<Food>[].obs,etat: ''): null ;
    update() ;
  }

  double initial_price( ) {
    double somme= 0 ;
    for (var plat in commande.plats) {
      somme = somme + plat.prix * plat.counter.value;
    }
    return somme ;
  }
}