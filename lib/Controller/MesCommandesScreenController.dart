import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../View/Food.dart';


class MesCommandesScreenController extends GetxController{


  double coutPartiel(List<Food> plats){
    double somme=0;
    for(int i=0;i<plats.length;i++){
      somme=somme+plats[i].prix;
    }
    return somme;
  }
  double coutTotal(List<Food> plats){
    return coutPartiel(plats)+500;
  }
  List Data (AsyncSnapshot snapshot){
    List list_of_data =[];
    if (snapshot.hasData){
      list_of_data=snapshot.data!;
    }
    return list_of_data ;
  }
  /*@override
  String toString(){
    return this.date+' '+this.etat;
  }*/
  @override
  void onInit() {
    //archiveCurrentCommand();
    super.onInit();
  }
}