import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../View/OnBoarding_Pages.dart';

class OnBoardingController extends GetxController {


  late PageController controller ;
  int page_index=0 ;

  final List<OnBoard> pages = [
    OnBoard(image: 'lib/Asset/Images/onBoardingImage1.png', title: "Le temps est précieux , n'est-ce pas?",
        description:
        "Avec notre service rapide , vous n’aurez plus à vous soucier de l’heure de votre repas") ,
    OnBoard(image: 'lib/Asset/Ivar onBoardingImage2.png', title: "Un seul clic et vous avez terminé",
        description:
        "Le reste est sur nous, nous vous apportons vos aliments préférés") ,
    OnBoard(image: 'lib/Asset/Images/onBoardingImage3.png', title: "Nous somme là!",
        description:
        "Avec notre service rapide , vous n’aurez plus à vous soucier de l’heure de votre repas") ,
  ] ;
  void onchange (int index ){
    page_index =index ;
    update () ;
  }
  @override
  void onInit() {

    controller = PageController(initialPage: 0) ;

    super.onInit();
  }
}