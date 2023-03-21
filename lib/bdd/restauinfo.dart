import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/View/Food_Search.dart';
import 'package:project/classes/OpenTime.dart';
import '../View/Food.dart';
import '../View/Restaurant.dart';
import '../classes/promotion.dart';
import 'classes.dart';



class RestauService {
  static String plasImage = "", foodImage = "", name = "";
  static List<Food> List_of_food =[];
  final CollectionReference restauCollection =
  FirebaseFirestore.instance.collection('Restaurant');

  ////////////////////////////////////////////////////////////////


  List<Promotion> _promotion(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Promotion(
        image: doc.get("pic").toString(),
        nameRestaurant: doc.get("name").toString(),
        offre: doc.get("offre").toString(),
        descriptionOffre: doc.get("descOffre").toString(),
        ResId:  doc.get("ResId"),);
    }).toList();
  }

  Stream<List<Promotion>> get promotion {
    return FirebaseFirestore.instance
        .collection('Promotion')
        .snapshots()
        .map((snapshot) => _promotion(snapshot));
  }

  ////////////////////////////////////////////////////////////////





  ////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////

  List<Food> _categoreList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {

      return  Food(

        id: doc.get("ID").toString(),
        name: doc.get("nom").toString(),
        resId: doc.get("ResId").toString(),
        prix: doc.get("prix").toDouble(),
        categore: doc.get("categorie").toString(),
        image: doc.get("ImageUrl").toString(),
        ajouter: false.obs,
        description: doc.get("description").toString(),
        nom_restaurant: doc.get("Resname").toString(),);
    }).toList();
  }

  Stream<List<Food>> categoreList(String uid, String categorie) {
    return restauCollection
        .doc(uid)
        .collection(categorie)
        .snapshots()
        .map((snapshot) => _categoreList(snapshot));
  }

///////////////////////////////////////////////////////

  List<String> _tabcate(DocumentSnapshot snapshot) {
    var t = snapshot.get("Categories");

    List<String> z = [];
    for (int i = 0; i < t.length; i++) {
      z.add(t[i].toString());
    }
    return z;
  }

  Stream<List<String>> tabcate(String id) {
    return restauCollection
        .doc(id)
        .snapshots()
        .map((snapshot) => _tabcate(snapshot));
  }
////////////////////////////////////////////////////




  String nom(String id) {
    restauCollection.doc(id).get().then((value) => name = value.get("nom"));

    return name;
  }
  writeCommande() async {


      await FirebaseFirestore.instance
          .collection('Client')
          .add({
        "nom":'' ,
        "description":'' ,
        "prix": 0,
        "ID":' ',
        "ResId": 'bgxt0iCCvObcRvpNVsXz',
        "categorie":'Pizzas',


      });

  }


  ///////////////////////////////////////////////////////



  ////////////////////////////////////////////////////////////////////
  List<Promotion> _promoListo(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {

      return Promotion(
          image: doc.get("pic").toString(),
      nameRestaurant: doc.get("name").toString(),
      offre: doc.get("offre").toString(),
      descriptionOffre: doc.get("descOffre").toString(), ResId:  doc.get("ResId"),);
    }).toList();
  }

  Stream<List<Promotion>> get promoList {
    return  FirebaseFirestore.instance.collection('Promotion')
        .snapshots()
        .map((snapshot) => _promoListo(snapshot));
  }

  ////////////////////////////////////////////////////////////////


  ///////////////////////////////////////


  List<cat> _catlist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {

      return cat(id: doc.id, nom: doc.get("nom"));

    }).toList();
  }

  Stream<List<cat>> catlist() {
    return FirebaseFirestore.instance.collection('Categories')
        .snapshots()
        .map((snapshot) => _catlist(snapshot));
  }



  List<Food> _foodlist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {

      return Food(

        id: doc.get("ID").toString(),
        name: doc.get("nom").toString(),
        resId: doc.get("ResId").toString(),
        prix: doc.get("prix").toDouble(),
        categore: doc.get("categorie").toString(),
        image: doc.get("ImageUrl").toString(),
        ajouter: false.obs,
        description: doc.get("description").toString(),
        nom_restaurant: doc.get("Resname").toString(),);

    }).toList();
  }
  Stream<List<Restaurant>>? get restaurantList {

    return restauCollection
        .snapshots()
        .map((snapshot) => _restaurant2List(snapshot));
  }

  List<Restaurant> _restaurant2List(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {


      DateTime opentime=DateTime.fromMillisecondsSinceEpoch(doc.get("closeTime").nanoseconds * 1000);

      DateTime closetime=DateTime.fromMillisecondsSinceEpoch(doc.get("openTime").nanoseconds * 1000);

      OpenTime open=OpenTime(TimeOfDay.fromDateTime(closetime), TimeOfDay.fromDateTime(opentime));


      return Restaurant(
          image: doc.get("ImageUrl").toString(),
        name: doc.get("nom").toString(),
        longitude: doc.get("Longitude").toDouble(),
        latitude: doc.get("Latitude").toDouble(),
        id: doc.get("ID").toString(),
        adress: doc.get("Adress").toString(),
        state: doc.get("state"), openTime:open);

    }).toList();
  }


  ////
  Stream<List<Food>> foodlist() {
    return FirebaseFirestore.instance.collection('Plats')
        .snapshots()
        .map((snapshot) => _foodlist(snapshot));
  }
  Stream<List<Food>>? food2list(String ui) {
    return FirebaseFirestore.instance.collection('Categories').doc(ui).collection("plats")
        .snapshots()
        .map((snapshot) => _foodlist(snapshot));
  }
  List<Food_Search> _Searchfoodlist(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {

      return Food_Search(

        id: doc.get("ID").toString(),
        name: doc.get("nom").toString(),
        resId: doc.get("ResId").toString(),
        prix: doc.get("prix").toDouble(),
        image: doc.get("ImageUrl").toString(),
        description: doc.get("description").toString());

    }).toList();
  }
  Stream<List<Food_Search>> Searchfoodlist() {
    return FirebaseFirestore.instance.collection('Plats')
        .snapshots()
        .map((snapshot) => _Searchfoodlist(snapshot));
  }
  Stream<List<Food_Search>>? Searchfood2list(String ui) {
    return FirebaseFirestore.instance.collection('Categories').doc(ui).collection("plats")
        .snapshots()
        .map((snapshot) => _Searchfoodlist(snapshot));
  }
}
// 11 fonction