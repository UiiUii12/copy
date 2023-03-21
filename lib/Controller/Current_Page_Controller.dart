import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class Current_Page_Controller extends GetxController{

  static RxInt currentindex= 0.obs ;
  int Home_previous=0;
  int Search_previous=0;
  int Cart_previous=0;
  int MesCommandes_previous=0 ;
}