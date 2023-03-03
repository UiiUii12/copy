import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project/Controller/CartController.dart';
import '../View/Food.dart';
import 'classes.dart';


class DatabaseService {
  final String uid;
  static String? nom;
  static bool exist = false;
  static double? long, lat;
  static List<Food> list=[];
  static int nbrPanier = 0,  nbPlat = 0;

  DatabaseService({required this.uid});
  final CollectionReference clientCollection =
  FirebaseFirestore.instance.collection('Client');


  CartController controller = Get.put(CartController() , permanent: true) ;




  updatUserdata() {
    clientCollection.doc(uid).get().then((value) {
      if (!value.exists) {
        clientCollection.doc(uid).set(
            { "panier": 0.toInt()});
      }
    });
  }

  int _existpanier(DocumentSnapshot snapshot) {
    return snapshot.get("panier").toInt();
  }

  Stream<int> get existpanier {
    return clientCollection
        .doc(uid)
        .snapshots()
        .map((snapshot) => _existpanier(snapshot));
  }
  //*******************************************************************************************
  String _Lenom(DocumentSnapshot snapshot) {
    return snapshot.get("nom").toString();
  }

  Stream<String> get Lenom {
    return clientCollection
        .doc(uid)
        .snapshots()
        .map((snapshot) => _Lenom(snapshot));
  }
//********************************************************************************************



  Future updatePanier(Plat plat, int cont, String message) async {
    await clientCollection
        .doc(uid)
        .collection("Panier")
        .doc(plat.resId + "" + plat.id)
        .set({
      "nom": plat.nom,
      "description": plat.descreption,
      "prix": plat.prix,
      "ID": plat.id,
      "ResId": plat.resId,
      "categorie": plat.categore,
      "quentite": cont.toInt(),
      "message": message
    });
  }

  Future deletePanier(Panier panier) async {
    await clientCollection
        .doc(uid)
        .collection("Panier")
        .doc(panier.resId + "" + panier.id)
        .delete();
  }







  UpdatePanierPlus() async {
    await clientCollection
        .doc(uid)
        .get()
        .then((value) => nbrPanier = value.get("panier").toInt());

    await clientCollection.doc(uid).update({"panier": nbrPanier + 1});
  }

  UpdatePanierMoin() async {
    await clientCollection
        .doc(uid)
        .get()
        .then((value) => nbrPanier = value.get("panier").toInt());

    await clientCollection.doc(uid).update({"panier": nbrPanier - 1});
  }
  latitude(num n)async{
    await clientCollection.doc(uid).update({"latitude": n});
    lat=n.toDouble();

  }
  longitude(num n)async{
    await clientCollection.doc(uid).update({"longitude": n});
    long=n.toDouble();
  }

  UpdatePlatPlus(String uid) async {
    await clientCollection
        .doc(this.uid)
        .collection("Panier")
        .doc(uid)
        .get()
        .then((value) => nbPlat = value.get("quentite").toInt());

    await clientCollection
        .doc(this.uid)
        .collection("Panier")
        .doc(uid)
        .update({"quentite": nbPlat + 1});
  }

  UpdatePlatMoin(String uid) async {
    await clientCollection
        .doc(this.uid)
        .collection("Panier")
        .doc(uid)
        .get()
        .then((value) => nbPlat = value.get("quentite").toInt());

    await clientCollection
        .doc(this.uid)
        .collection("Panier")
        .doc(uid)
        .update({"quentite": nbPlat - 1});
  }


  ////////////////////////////////////////////////////////////////



langlat()async{
  await clientCollection
      .doc(uid)
      .get()
      .then((value) => long = value.get("longitude"));
  await clientCollection
      .doc(uid)
      .get()
      .then((value) => lat = value.get("latitude"));
}
  writeCommande(String s) async {
    var dt = DateTime.now();
    String time;
    if (dt.hour < 10 && dt.minute < 10) {
      time = "0" + dt.hour.toString() + ":0" + dt.minute.toString();
    } else if (dt.hour < 10) {
      time = "0" + dt.hour.toString() + "0" + dt.minute.toString();
    } else if (dt.minute < 10) {
      time = dt.hour.toString() + ":0" + dt.minute.toString();
    } else {
      time = dt.hour.toString() + ":" + dt.minute.toString();
    }



    await clientCollection
        .doc(uid)
        .get()
        .then((value) => long = value.get("longitude"));
    await clientCollection
        .doc(uid)
        .get()
        .then((value) => lat = value.get("latitude"));

    double p =0;
    for (int i=0;i<CartController.commande.plats.length;i++) {
      p=p+CartController.commande.plats[i].prix*CartController.commande.plats[i].counter.toDouble();

    }

    var t= await FirebaseFirestore.instance
        .collection('Commandes')
        .add({
      "nom": CartController.commande.restaurant,
      "date": time.toString(),
      'Livraison':CartController.commande.livraison,
      'etat':'En cours',
      'Prix de plats':p,
      'description':s,
      "Latitude": lat,
      'Longitude':long,
    });


    for (int i=0;i<CartController.commande.plats.length;i++) {
      await FirebaseFirestore.instance
          .collection('Commandes')
          .doc(t.id)
          .collection("commande")
          .add({
        "nom": CartController.commande.plats[i].name,
        "prix": CartController.commande.plats[i].prix.toInt(),
        "ID": CartController.commande.plats[i].id.toString(),
        "ResId": CartController.commande.plats[i].resId.toString(),
        "categorie": CartController.commande.plats[i].categore.toString(),
        "UserID": uid,
        'description':CartController.commande.plats[i].description,
        'quentite':CartController.commande.plats[i].counter.toInt(),
      });

    }
  }
  writecommandetouser() async {

    var dt = DateTime.now();
    String time;
    if (dt.hour < 10 && dt.minute < 10) {
      time = "0" + dt.hour.toString() + ":0" + dt.minute.toString();
    } else if (dt.hour < 10) {
      time = "0" + dt.hour.toString() + "0" + dt.minute.toString();
    } else if (dt.minute < 10) {
      time = dt.hour.toString() + ":0" + dt.minute.toString();
    } else {
      time = dt.hour.toString() + ":" + dt.minute.toString();
    }
    double s=0;
    for (int i=0;i<CartController.commande.plats.length;i++) {
      s=s+CartController.commande.plats[i].prix*CartController.commande.plats[i].counter.toDouble();
      
    }

   var t= await FirebaseFirestore.instance
        .collection('Client')
        .doc(uid)
        .collection("commande")
        .add({
      "nom": CartController.commande.restaurant,
      "date": time.toString(),
      'Livraison':CartController.commande.livraison,
      'etat':'En cours',
      'Vos commandes':s.toDouble(),
    });
    for (int i=0;i<CartController.commande.plats.length;i++) {
    await FirebaseFirestore.instance
        .collection('Client')
        .doc(uid)
        .collection("commande").doc(t.id).collection('plat').add({

    "nom" :CartController.commande.plats[i].name,
    "description":CartController.commande.plats[i].description,
    "prix":CartController.commande.plats[i].prix.toInt(),
    "quantite":CartController.commande.plats[i].counter.toInt(),

    });}

  }
////////////////////////////////////////////////////////////////




////////////////////////////////////////////////////////////////

  List<MaCommande> _MacommandList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MaCommande(
        nom: doc.get("nom").toString(),
          id: doc.id.toString(),
          date: doc.get("date").toString(),
          livraison: doc.get("Livraison").toInt(),
          total: doc.get("Livraison").toInt()+doc.get("Livraison").toInt(),
          etat:doc.get("etat").toString(),
          voscommande: doc.get("Vos commandes").toInt());
    }).toList();
  }

  Stream<List<MaCommande>> get MaCommand {
    return clientCollection
        .doc(uid)
        .collection("commande")
        .snapshots()
        .map((snapshot) => _MacommandList(snapshot));
  }


////////////////////////////////////////////////////////////////

  List<Maplat> _MaplatList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Maplat(
          nom: doc.get("nom").toString(),
          descreption:  doc.get("description").toString(),
          prix:  doc.get("prix").toInt(),
          quantite:  doc.get("quantite").toInt());
    }).toList();
  }

  Stream< List<Maplat>> Mapla( String id) {
    return clientCollection
        .doc(uid)
        .collection("commande").doc(id).collection("plat")
        .snapshots()
        .map((snapshot) => _MaplatList(snapshot));
  }

  ////////////////////////////////////////////////////////////////


  writeMaplat() async {


    await FirebaseFirestore.instance
        .collection('Client').doc(uid).collection("commande").doc("sxU7Li2Cma5yGSZ7ukyt").collection("plat")
        .add({
      "nom":'Magic pizza' ,
      "description": "bla bla bla ",
      "prix":0,
      "quantite": 0,



    });
  }

////////////////////////////////////////////////////////////////

  writeMescommande() async {


    await FirebaseFirestore.instance
        .collection('Client').doc(uid).collection("commande")
        .add({
      "nom":'Magic pizza' ,

      "date": "2022",
      "cout total":0,
      "Livraison": 0,
      "Vos commandes":0,
      "Total":0,


    });
  }
}



 // 5 fonction
