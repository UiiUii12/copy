import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../View/Food.dart';

class Commande {
 late  String restaurant;
 late var date;
 late List<Food> plats;
 late String etat;
 final double livraison = 500;
 final String adresse_restaurant;
 final String adresse_client ;
 late var  message;
 var numero_commande;
 Commande(this.numero_commande,this.adresse_restaurant, this.adresse_client, {required this.restaurant,this.date,required this.plats,required this.etat,this.message});
}
