
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/bdd/clientinfo.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/HomeScreenController.dart';
import '../Controller/LoginScreenController.dart';
import '../Themes/Theme.dart';
import '../auth/user.dart';
import '../bdd/classes.dart';
import '../bdd/restauinfo.dart';
import '../classes/promotion.dart';
import 'AdresseScreen.dart';
import 'Restaurant.dart';
import 'RestaurantScreen.dart';
import 'RestaurantsScreen.dart';
import 'categoryScreen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    HomeScreenController controller = Get.put(HomeScreenController(), permanent: true);

    var is_loaded = true ;
    /////////////////////////////////////////////////////////////////////////////////////////////


    /////////////////////////////////////////////////////////////////////////////////////////////

    return Scaffold(
        body: Column(children: [
          SizedBox(height: 20.h,),
          Row(
            children: [
              SizedBox(
            width: 13.w,
          ),
             GetX<HomeScreenController>(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 56.h,
                width: 401.w,
                decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(9.r)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 11.w,),
                    Image.asset('assets/images/camion.png'),
                    SizedBox(width: 7.w,),
                    Expanded(
                      child: GetX<HomeScreenController>(

                        builder: (controller) {
                          return AutoSizeText(
                            'Votre adresse\n${HomeScreenController.address.value}',
                            style: TextStyle(
                              fontFamily: 'Golos',
                              fontSize: 15.sp,
                            ),
                          );
                        }
                      ),
                    ),
                    TextButton(
                        onPressed: () {

                         Get.to(AdresseScreen()) ;
                        },
                        child: AutoSizeText(
                          'Modifier',
                          style: TextStyle(
                            color: Color(0xffE6424B),
                            fontSize: 15.sp,
                            fontFamily: 'Golos',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    SizedBox(width: 9.w,)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 26.h,),
          Row(
            children: [
               SizedBox(width: 13.w,),
               AutoSizeText(
                'Nouvelles offres',
                style: theme().textTheme.headline4
              ),
            ],
            ),
          SizedBox(height: 12.h,),
          Container(
            height: 153.h,
            child: is_loaded ?
            StreamBuilder<List<Promotion>>(
              stream: RestauService().promotion,
              builder: (context, snapshot) {
                List<Promotion> promoi=[];

                if (snapshot.hasData){
                  promoi=snapshot.data!;
                }
                return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:promoi.length,
                          itemBuilder: (context,index) {
                            final promo=promoi[index];
                            return Row(
                              children: [
                                SizedBox(width: 13.w,),
                                Promotion(
                                descriptionOffre: promo.descriptionOffre,
                                nameRestaurant:promo.nameRestaurant,
                                offre: promo.offre,
                                image: promo.image,
                                ResId: promo.ResId,),
                              ],
                            );
                          },
                         );
              }
            ): shimmer_promotion() ,
          ),
          SizedBox(height: 18.h,),
          Row(
           children: [
            SizedBox(
            width: 13.w,
            ),
          AutoSizeText(
            'Explorer les catégories',
            maxLines: 1,
            style: theme().textTheme.headline4
          ),]),
          Spacer(flex: 16,),
          Expanded(
            flex: 110,
            child: is_loaded ?
            StreamBuilder<List<cat>>(
              stream: RestauService().catlist(),
              builder: (context, snapshot) {
                List<cat> t =[];
                if (snapshot.hasData){
                  t=snapshot.data!;
                }
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: t.length,
                    itemBuilder: (context, index) {

                      String image = 'assets/images/sandwich.svg';
                      if (t[index].nom=='Soup'){
                        image = 'assets/images/soup.svg';
                      }else if(t[index].nom=='Pizza'){
                        image =  'assets/images/pizza.svg';
                      }else if(t[index].nom=='Sandwich'){
                        image =  'assets/images/Sandwich.svg';
                      }else if(t[index].nom=='Drink'){
                        image =  'assets/images/Drink.svg';
                      }else if(t[index].nom=='Burger'){
                        image =  'assets/images/burger.svg';
                      }else if(t[index].nom=='Tacos'){
                        image =  'assets/images/Tacos.svg';
                      }
                      final name =t[index].nom;
                      return Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 13.w,
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap:()=>Get.to(CategoryScreen(category_name: '$name',id:t[index].id)),
                                  child: Container(
                                   height: 71.h,
                                   width: 71.h,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(200.0)),
                                      border: Border.all(
                                        color: Color(0xffB8B4B4),
                                        width: 1.0.w,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 35.r,
                                      backgroundColor: Colors.white,
                                      child: SvgPicture.asset(image,
                                          height: 30.h,
                                          width:30.w,
                                          fit: BoxFit.scaleDown
                                      ),
                                    ),
                                  ),
                                ),
                                AutoSizeText(
                                  '$name',
                                style: theme().textTheme.bodyText2)
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }
            ) : shimmer_category() ,
          ),
         // Spacer(flex: 17,),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(width: 13.w,),
                    AutoSizeText(
                      'Restaurants',
                      maxLines: 1,
                      style: theme().textTheme.headline4
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: (){Get.to(()=>RestaurantsScreen());},
                  child: AutoSizeText(
                    'Afficher tout',
                    style: theme().textTheme.bodyText1?.copyWith(color: Color(0xffE6424B))
                  )),
              SizedBox(width: 13.w,),
            ],
          ),
          //Spacer(flex: 17,),
          Expanded(
            flex: 280,
            child: is_loaded ?
            StreamBuilder<List<Restaurant>>(
              stream: RestauService().restaurantList,
              builder: (context, snapshot) {
                List<Restaurant> l =[];

                if (snapshot.hasData){
                  l=snapshot.data!;
                }
                return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: l.length,
                      itemBuilder: (context, index) =>Row(
                        children: [
                          SizedBox(width: 13.w,),
                          l[index],
                        ],
                      )
                      );
              }
            ) : shimmer_restaurant() ,
            ),
          Spacer(flex: 26,) ,
        ],
      ),
    );
  }
  Widget shimmer_promotion() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: Duration(seconds: 3),
      child:

      ListView.builder(
        addAutomaticKeepAlives: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount:3 ,
        itemBuilder: (context,index) {
          return Row(
            children: [
              SizedBox(
                width: 13.w,
              ),
              Container(
                  height:153.h ,
                  width:396.w ,
                  decoration : BoxDecoration(
                    color : Colors.white,
                    borderRadius: BorderRadius.circular(9.r) ,

                  )
              )
            ],
          );
        },
      ),
    );
  }
  Widget shimmer_category () {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: Duration(seconds: 3),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount:7,
            itemBuilder: (context, index) {
              return
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 13.w,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(200.0)),
                                color: Colors.white
                            ),
                            child: CircleAvatar(
                              radius: 35.r,
                              backgroundColor: Colors.white,

                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Container(
                            height: 13.h,
                            width: 55.w,
                            decoration: BoxDecoration(
                                color: Colors.white ,
                                borderRadius: BorderRadius.circular(9.r)
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
            }) ) ;

  }
  Widget shimmer_restaurant () {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: Duration(seconds: 3),
        child:
        ListView.builder(
          addAutomaticKeepAlives: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount:3 ,
          itemBuilder: (context,index) {
            return
              Row(
                children: [
                  SizedBox(
                    width: 13.w,
                  ),
                  Container(

                    width:389.w ,
                    child : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 153.h ,
                            width:389.w ,
                            decoration : BoxDecoration(
                              color : Colors.white,
                              borderRadius: BorderRadius.circular(9.r) ,

                            )
                        ) ,
                        SizedBox(height: 10.h,) ,
                        Container(
                            height : 13.h ,
                            width: 150.w,
                            decoration : BoxDecoration(
                              color : Colors.white,
                              borderRadius: BorderRadius.circular(9.r) ,

                            )
                        ),
                        SizedBox(height: 10.h,) ,
                        Container(
                            height : 13.h ,
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
                                height: 13.h,
                                width: 150.w,
                                decoration : BoxDecoration(
                                  color : Colors.white,
                                  borderRadius: BorderRadius.circular(9.r) ,

                                )
                            ),
                            SizedBox(width: 8.w,) ,
                            Expanded(
                              child: Container(
                                  height: 13.h,

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

                  )

                ],
              );

          },
        ));
  }
}
