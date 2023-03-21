import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:project/View/Food_Search.dart';
import '../Controller/LoginScreenController.dart';
import '../Controller/SearchController.dart';

import '../Themes/Theme.dart';
import '../Wrappers/wrapper2.dart';
import '../bdd/clientinfo.dart';
import '../bdd/restauinfo.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  SearchController controller = Get.put(SearchController(), permanent: true);
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 39.h,),
              Row(
                children: [
                  SizedBox(
                    width: 13.w,
                  ),
                  GetX<SearchController>(
                      builder: (controller) {

                        return AutoSizeText(
                            'Salut ${controller.nom} ,\nBienvenue dans notre magasin !',
                            style: theme().textTheme.bodyText1?.copyWith(color: Colors.black)
                        );
                      }
                  ),
                ],
              ),
              SizedBox(height: 26.h,),
              Row(
                  children: [
                    SizedBox(
                      width: 13.w,
                    ),
                    Container(
                      height: 56.h,
                      width: 401.w,
                      child: TextField(
                        onSubmitted: (value){
                          print("////////////////////////:");
                          controller.sug( );
                          print(controller.food_result.length);
                          controller.sug2();
                          print(controller.food_result.length);
                        },
                        controller: controller.input,
                        textAlign: TextAlign.left,
                        cursorColor: Colors.grey,
                        enabled: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(EvaIcons.search, color: Color(0xff9D9D9D)),
                          hintText: 'Trouvez votre restaurant, votre produit',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.h,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.r),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor:  Color(0xffF6F6F6),
                        ),

                      ),
                    ),
                  ]
              ),
              SizedBox(height: 24.h,),
              GetBuilder<SearchController>(
                builder: (controller) {
                  return Column(
                    children: [
                      controller.lo.length != 0 ?
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 13.w,),
                              AutoSizeText( 'Restaurant',
                                  style:theme().textTheme.headline4

                              ) ,
                            ],
                          ),
                          SizedBox(height: 17.h,),
                          Container(
                              height: 290.h,
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount:controller.lo.length ,
                                  itemBuilder: (context, index) => Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 13.w,),
                                      Container(
                                          height: 310.h,
                                          width: 389.w,
                                          child: controller.lo[index])
                                    ],
                                  ))),
                        ],
                      ): Container(),


                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: Wrapper2.list2.length,
                          itemBuilder: (context, index2) {
                            return Column(
                              children: [

                                StreamBuilder<List<Food_Search>>(
                                    stream: RestauService().Searchfood2list(Wrapper2.list2[index2].id),
                                    builder: (context, snapshot) {
                                      controller.remplir(snapshot,Wrapper2.list2[index2].nom);

                                      return Container();
                                    }
                                ) ,
                              ],
                            );

                          }),
                      ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.food_result.length,
                        itemBuilder: (context , index4) =>Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  SizedBox(width:13.w) ,
                                  AutoSizeText(
                                    controller.food_result[index4].nom_cat,
                                    style:theme().textTheme.headline4 , textAlign: TextAlign.start,
                                  ) , ]),
                            SizedBox(height: 17.h,),
                            Container(
                              height : 220.h ,
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount : controller.food_result[index4].plat.length,
                                  itemBuilder: (context , index3) {

                                    return Row(

                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 13.w,) ,
                                        Container(
                                          height: 220.h ,
                                          width:281.w ,
                                          child:
                                          controller.food_result[index4].plat[index3],
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
