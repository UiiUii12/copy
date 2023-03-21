import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/View/Food.dart';
import 'package:project/bdd/restauinfo.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/RestaurantController.dart';
import '../Controller/Restaurants_controller.dart';
import '../Themes/Theme.dart';


class CategoryScreen extends StatelessWidget {
  final String category_name,id ;
  CategoryScreen({Key? key, required this.category_name, required this.id}) : super(key: key);

  Restaurants_controller controller = Get.put(Restaurants_controller()) ;

  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantController()) ;
    return

      StreamBuilder<List<Food>>(
        stream: RestauService().food2list(id),
        builder: (context, snapshot) {

          List<Food> food=[];
          if (snapshot.hasData){
            food=snapshot.data!;
          }
          return SafeArea(
              child: Scaffold(
                  body:
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25.h,),
                        Positioned(
                          top: 10.h,
                          left: 13.w,
                          child: SizedBox(
                            height: 28.h,
                            width: 29.w,
                            child: FloatingActionButton(
                              foregroundColor:  Color(0xffDFDFDF) ,
                              onPressed: () {
                                Get.back() ;
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 20.sp,
                              ),
                              backgroundColor: Color(0xffDFDFDF),
                            ),
                          ),
                        ),
                        SizedBox(height:10.h) ,
                        Row(
                          children: [
                            Spacer(flex: 14,),
                            Expanded(
                              flex: 400,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: AutoSizeText(
                                  '$category_name',
                                  maxLines: 1,
                                  style: theme().textTheme.headline1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        GetBuilder<Restaurants_controller>(
                            builder: (controller){return controller.is_loaded ?
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: food.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      SizedBox(width: 15.w,),
                                      Container(
                                        height: 270.h,
                                        width:281.w ,
                                        child: food[index] ,
                                      ),
                                      // Spacer(flex: 14,)
                                    ],
                                  ) ;
                                }) : shimmer_restaurant(controller.restaurants) ;})
                      ],
                    ),
                  )
              )
          );
        }
      )  ;
  }
  Widget shimmer_restaurant ( List restaurant){
    return
      Shimmer.fromColors (
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          period: Duration(seconds: 3),
          child:  ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 300.h,
                  width: double.maxFinite,
                  child:
                  Column(
                    children: [
                      Container(
                        height: 300.h,
                        width: double.maxFinite,
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 174.h ,
                                width:398.w ,
                                decoration : BoxDecoration(
                                  color : Colors.white,
                                  borderRadius: BorderRadius.circular(9.r) ,

                                )
                            ) ,
                            SizedBox(height: 10.h,) ,
                            Container(
                                height : 20.h ,
                                width: 150.w,
                                decoration : BoxDecoration(
                                  color : Colors.white,
                                  borderRadius: BorderRadius.circular(9.r) ,

                                )
                            ),
                            SizedBox(height: 10.h,) ,
                            Container(
                                height : 20.h ,
                                width: 250.w,
                                decoration : BoxDecoration(
                                  color : Colors.white,
                                  borderRadius: BorderRadius.circular(9.r) ,

                                )
                            ),


                            SizedBox(height: 10.h,) ,
                            Row(
                              crossAxisAlignment:CrossAxisAlignment.center ,
                              children: [
                                Container(
                                    height: 20.h,
                                    width: 150.w,
                                    decoration : BoxDecoration(
                                      color : Colors.white,
                                      borderRadius: BorderRadius.circular(9.r) ,

                                    )
                                ),
                                SizedBox(width: 8.w,) ,
                                Expanded(
                                  child: Container(
                                      height: 20.h,

                                      decoration : BoxDecoration(
                                        color : Colors.white,
                                        borderRadius: BorderRadius.circular(9.r) ,

                                      )
                                  ),
                                ),


                              ],
                            )
                          ],
                        ),

                      ),

                    ],
                  ),
                ) ;
              }) );

  }
}
