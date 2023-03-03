import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controller/CartController.dart';

import '../Themes/Theme.dart';
import 'ConfirmationOrdersScreen.dart';
import 'Vide.dart';


class CartScreen extends StatelessWidget {

  CartScreen(
      {Key? key,
      })
      : super(key: key);

  @override

  Widget build(BuildContext context) {
    CartController controller=Get.put(CartController() , permanent: true);
    var total = CartController.commande.plats.length.obs;
    var cout_total = controller.initial_price().obs;
    var item_index = 0.obs;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 34.h,
                ),
                Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 29,
                      child: AutoSizeText(
                        'Vos commandes',
                        textAlign: TextAlign.start,
                        style: theme().textTheme.headline1,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 29,
                      child: AutoSizeText(
                          "Veuillez vérifier vos commandes, une fois que vous aurez confirmé votre achat, vous n’aurez pas le droit d’annuler.",
                          textAlign: TextAlign.start,
                          style: theme().textTheme.headline5),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),

                GetBuilder<CartController>(
                  builder: (controller) {
                    return CartController.commande.plats.isNotEmpty? ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: CartController.commande.plats.length,
                        itemBuilder: (context, index) {
                          item_index.value = index;
                          return Row(
                            children: [
                              Spacer(flex: 1),
                              Expanded(
                                flex: 29,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Dismissible(
                                      key: UniqueKey(),
                                      onDismissed: (direction) {

                                        CartController.commande.plats[index].ajouter.value =
                                        !CartController.commande.plats[index].ajouter.value;
                                        controller.Delete(
                                            CartController.commande.plats[index], cout_total);
                                        controller.Remove_from_cart(
                                            CartController.commande.plats,CartController.commande.plats[index]);
                                      },
                                      background: Container(
                                        alignment: Alignment.centerRight,
                                        color: Colors.white,
                                        child: Icon(
                                          Icons.delete,
                                          size: 30.sp,
                                          color: Color(0xff9D9D9D),
                                        ),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(9.r),
                                          color: Color(0xffE4E4E4),
                                        ),
                                        height: 56.h,
                                        width: 401.w,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Expanded(
                                              flex: 29,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    '${CartController.commande.plats[index].name} ${CartController.commande.plats[index].prix} DA' ,
                                                    textAlign: TextAlign.start,
                                                    style: theme()
                                                        .textTheme
                                                        .bodyText1,
                                                  ) ,
                                                  AutoSizeText(
                                                      '${CartController.commande.plats[index].description}',
                                                      textAlign:
                                                      TextAlign.start,
                                                      style: theme()
                                                          .textTheme
                                                          .bodyText1)
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24.h,
                                              width: 26.w,
                                              child: FloatingActionButton(
                                                heroTag: 'Remove',
                                                onPressed: () =>
                                                    controller.decrement(
                                                        total,
                                                        CartController.commande.plats[index].counter,
                                                        CartController.commande.plats[index].prix,
                                                        cout_total),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                  size: 15.sp,
                                                ),
                                                backgroundColor:
                                                Color(0xffE6424B),
                                              ),
                                            ),
                                            GetX<CartController>(
                                                builder: (controller) {
                                                  return AutoSizeText(
                                                      ' ${CartController.commande.plats[index].counter} ',
                                                      style: theme()
                                                          .textTheme
                                                          .headline3);
                                                }),
                                            SizedBox(
                                              height: 24.h,
                                              width: 26.w,
                                              child: FloatingActionButton(
                                                heroTag: 'Add',
                                                onPressed: () =>
                                                    controller.increment(
                                                        total,
                                                        CartController.commande.plats[index].counter,
                                                        CartController.commande.plats[index].prix,
                                                        cout_total),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 15.sp,
                                                ),
                                                backgroundColor:
                                                Color(0xffE6424B),
                                              ),
                                            ),
                                            Spacer(
                                              flex: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 18.h),
                                    (item_index.value == CartController.commande.plats.length - 1 &&
                                        CartController.commande.plats.isNotEmpty)
                                        ? Container(
                                      height: 400.h,
                                      width: 400.w,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Spacer(flex: 1),
                                          AutoSizeText('Coût total',
                                              textAlign:
                                              TextAlign.start,
                                              style: theme()
                                                  .textTheme
                                                  .headline1), // Cout total
                                          Spacer(flex: 1),
                                          Row(children: [
                                            Expanded(
                                                child: AutoSizeText(
                                                  'Vos commandes',
                                                  textAlign:
                                                  TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17.sp,
                                                      fontFamily: 'Golos'),
                                                )),
                                            GetX<CartController>(
                                              builder: (controller) {
                                                return AutoSizeText(
                                                  '${cout_total} DA',
                                                  textAlign:
                                                  TextAlign.start,
                                                  style: TextStyle(
                                                      color: Color(
                                                          0xffE6424B),
                                                      fontSize: 17.sp,
                                                      fontFamily:
                                                      'Golos'),
                                                );
                                              },
                                            ),
                                          ]), // Vos commandes
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(children: [
                                            Expanded(
                                                child: AutoSizeText(
                                                  'Livraison',
                                                  textAlign:
                                                  TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17.sp,
                                                      fontFamily: 'Golos'),
                                                )),
                                            AutoSizeText(
                                              '500 DA',
                                              textAlign:
                                              TextAlign.start,
                                              style: TextStyle(
                                                  color:
                                                  Color(0xffE6424B),
                                                  fontSize: 17.sp,
                                                  fontFamily: 'Golos'),
                                            ),
                                          ]), //Livraison
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(children: [
                                            Expanded(
                                                child: AutoSizeText(
                                                  'Total',
                                                  textAlign:
                                                  TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17.sp,
                                                      fontFamily: 'Golos'),
                                                )),
                                            GetX<CartController>(
                                              builder: (controller) {
                                                return AutoSizeText(
                                                  '${cout_total.value + 500} DA',
                                                  textAlign:
                                                  TextAlign.start,
                                                  style: TextStyle(
                                                      color: Color(
                                                          0xffE6424B),
                                                      fontSize: 17.sp,
                                                      fontFamily:
                                                      'Golos'),
                                                );
                                              },
                                            ),
                                          ]), // Total
                                          Spacer(
                                            flex: 2,
                                          ),

                                          Container(
                                            height: 56.h,
                                            width: 401.w,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                    theme()
                                                        .primaryColor,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            9.0),
                                                        side: BorderSide(
                                                            color: Colors
                                                                .red))),
                                                onPressed: () {

                                                  Get.to(ConfirmationOrdersScreen());
                                                },
                                                child: AutoSizeText(
                                                    'Continue',
                                                    style: theme()
                                                        .textTheme
                                                        .headline2)),
                                          ), // Button
                                          Spacer(
                                            flex: 5,
                                          ),
                                        ],
                                      ),
                                    )
                                        : Container()
                                  ],
                                ),
                              ),
                              Spacer(flex: 1),
                            ],
                          );
                        }):
                    Vide();
                  },
                ),

              ],
            ),
          )),
    );

  }
}
