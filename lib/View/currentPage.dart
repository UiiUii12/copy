
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../Themes/Theme.dart';
import 'CartScreen.dart';
import '../Controller/Current_Page_Controller.dart';
import 'HomeScreen.dart';
import 'MesCommandes.dart';
import 'SearchScreen.dart';


class Main_Page extends StatelessWidget {

  Main_Page({Key? key,  }) : super(key: key);

  Current_Page_Controller controller= Get.put(Current_Page_Controller(),permanent: true);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> history=
    [
      {"index" :controller.Home_previous, "Screen" : Home()},
      {"index":controller.Search_previous, "Screen" :SearchScreen()} ,
      {"index" :controller.Cart_previous, "Screen":CartScreen()},
      {"index":controller.MesCommandes_previous,"Screen":MesCommandesScreen()}
    ];

    return WillPopScope(
        onWillPop: () async{


          print(controller.currentindex);
          print(history[controller.currentindex.value]["index"]);
          print('///////////////////////////////');
          controller.currentindex.value=history[controller.currentindex.value]["index"];
          print('///////////////////////////////');
          print(controller.currentindex);


          return false;
        },
        child: SafeArea(child:
        GetX<Current_Page_Controller>(

            builder: (controller) =>
                Scaffold(
                  body:
                  history[controller.currentindex.value]["Screen"],

                  bottomNavigationBar:
                  BottomNavigationBar(
                    type : BottomNavigationBarType.fixed ,
                    onTap : (int index){

                      print(history[index]["index"]);
                      history[index]["index"]=controller.currentindex.value ;
                      print(history[index]["index"]);
                      controller.currentindex.value=index;

                    } ,
                    backgroundColor: Colors.white,
                    currentIndex : controller.currentindex.value ,
                    selectedItemColor: Color(0xffE6424B),
                    unselectedItemColor: Color(0xffADADAD),
                    elevation: 8.0,
                    selectedLabelStyle: theme().textTheme.bodyText2 ,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                            EvaIcons.homeOutline
                        ),
                        label: 'Accueil',
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(
                              EvaIcons.searchOutline
                          ),
                          label:'Recherche'
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                            EvaIcons.shoppingCartOutline
                        ),
                        label: 'Panier',
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(
                              EvaIcons.personOutline
                          ),
                          label: 'Compte'
                      ),

                    ],
                  ),
                )),
        ));
  }



}