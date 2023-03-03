import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../Controller/MesCommandesScreenController.dart';
import '../auth/user.dart';

import '../bdd/classes.dart';
import '../bdd/clientinfo.dart';
import 'Vide.dart';

class MesCommandesScreen extends StatelessWidget {

  MesCommandesScreen({Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MesCommandesScreenController controllerM =
    Get.put(MesCommandesScreenController(), permanent: true);
    List list_of_commands=[];
    //final user = Provider.of<MyUser?>(context);
    return StreamBuilder<List<MaCommande>>(
        stream:DatabaseService(uid:'ines').MaCommand ,
        builder: (context, snapshot) {
           list_of_commands =controllerM.Data(snapshot);
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 34.h,
                      ),
                      Row(
                        children: [
                          Spacer(
                            flex: 14,
                          ),
                          Expanded(
                            flex: 400,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: AutoSizeText(
                                'Mes commandes',
                                maxLines: 1,
                                style:
                                TextStyle(fontSize: 28.sp, fontFamily: 'Golos'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Spacer(
                            flex: 14,
                          ),
                          Expanded(
                            flex: 400,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: AutoSizeText(
                                'Veuillez vérifier vos commandes, une fois que\n'
                                    'vous aurez confirmé votre achat, vous n’aurez pas\n'
                                    'le droit d’annuler.',
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Color(0xff807F7F),
                                  fontFamily: 'Golos',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:20.h),
                      GetBuilder<MesCommandesScreenController>(
                        builder: (controller) {
                          return
                               ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:list_of_commands.length ,
                              itemBuilder: (context, index) {
                                return

                                  Row(
                                    children: [
                                      Spacer(
                                        flex: 14,
                                      ),
                                      Expanded(
                                        flex: 400,
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xffF6F6F6),
                                                borderRadius:
                                                BorderRadius.circular(9),
                                              ),
                                              child: Row(
                                                children: [
                                                  Spacer(flex: 12),
                                                  Expanded(
                                                    flex: 376,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 22.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: AutoSizeText(
                                                                '${list_of_commands[index].restaurant}',
                                                                style: TextStyle(
                                                                  fontSize: 18.sp,
                                                                  fontFamily:
                                                                  'Golos',
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                            Spacer(
                                                              flex: 1,
                                                            ),
                                                            Container(
                                                              width: 86.w,
                                                              height: 26.h,
                                                              decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      9),
                                                                  color: list_of_commands[index].etat ==
                                                                      'Completée'
                                                                      ? Color(
                                                                      0xffE8F7E5)
                                                                      : list_of_commands[index].etat ==
                                                                      'En cours'
                                                                      ? Color(0xffFCF5E4)
                                                                      : Color(0xffFAB4B8)),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                    Alignment
                                                                        .center,
                                                                    child:
                                                                    AutoSizeText(
                                                                      '${list_of_commands[index].etat}',
                                                                      style:
                                                                      TextStyle(
                                                                        color: list_of_commands[index].etat ==
                                                                            'Completée'
                                                                            ? Color(
                                                                            0xff669965)
                                                                            : list_of_commands[index].etat == 'En cours'
                                                                            ? Color(0xffCFAA72)
                                                                            : Color(0xffE6424B),
                                                                        fontFamily:
                                                                        'Golos',
                                                                        fontSize:
                                                                        15.sp,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 17.h,
                                                        ),
                                                        Column(
                                                            mainAxisSize:
                                                            MainAxisSize.min,
                                                            children: [
                                                              ...List.generate(
                                                                  list_of_commands[index].plats.length,
                                                                      (index1) =>
                                                                      Column(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                            Alignment.centerLeft,
                                                                            child:
                                                                            AutoSizeText(
                                                                              '${list_of_commands[index].plats[index1].counter}x ${list_of_commands[index].plats[index1].name} ${list_of_commands[index].plats[index1].prix}DA',
                                                                              style:
                                                                              TextStyle(
                                                                                fontSize: 15.sp,
                                                                                fontWeight: FontWeight.w400,
                                                                                fontFamily: 'Golos',
                                                                              ),
                                                                              maxLines:
                                                                              1,
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                            Alignment.centerLeft,
                                                                            child:
                                                                            AutoSizeText(
                                                                              '${list_of_commands[index].plats[index1].description}',
                                                                              style: TextStyle(
                                                                                  fontSize: 15.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  fontFamily: 'Golos',
                                                                                  color: Color(0xff9D9D9D)),
                                                                              maxLines:
                                                                              2,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                            13.h,
                                                                          ),
                                                                        ],
                                                                      ))
                                                            ]),
                                                        SizedBox(
                                                          height: 8.h,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: AutoSizeText(
                                                            'Date',
                                                            style: TextStyle(
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              fontFamily: 'Golos',
                                                            ),
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: AutoSizeText(
                                                            '${list_of_commands[index].date}',
                                                            style: TextStyle(
                                                                fontSize: 15.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontFamily:
                                                                'Golos',
                                                                color: Color(
                                                                    0xff9D9D9D)),
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 8.h,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: AutoSizeText(
                                                            'Numéro de commande',
                                                            style: TextStyle(
                                                              fontSize: 15.sp,
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              fontFamily: 'Golos',
                                                            ),
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: AutoSizeText(
                                                            '${list_of_commands[index].numero_commande}',
                                                            style: TextStyle(
                                                                fontSize: 15.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontFamily:
                                                                'Golos',
                                                                color: Color(
                                                                    0xff9D9D9D)),
                                                            maxLines: 1,
                                                          ),
                                                        ),







                                                        SizedBox(
                                                          height: 8.h,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: AutoSizeText(
                                                            'Coût total',
                                                            style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                              fontFamily: 'Golos',
                                                            ),
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 11.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: AutoSizeText(
                                                                'Vos commandes',
                                                                style: TextStyle(
                                                                  fontSize: 17.sp,
                                                                  fontFamily:
                                                                  'Golos',
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                            Spacer(
                                                              flex: 1,
                                                            ),
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: AutoSizeText(
                                                                '${controllerM.coutPartiel(list_of_commands[index].plats)}',
                                                                style: TextStyle(
                                                                  color: Color(
                                                                      0xffE6424B),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                                  fontSize: 17.sp,
                                                                  fontFamily:
                                                                  'Golos',
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 7.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: AutoSizeText(
                                                                'Livraison',
                                                                style: TextStyle(
                                                                  fontSize: 17.sp,
                                                                  fontFamily:
                                                                  'Golos',
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                            Spacer(
                                                              flex: 1,
                                                            ),
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: AutoSizeText(
                                                                '${list_of_commands[index].livraison}DA',
                                                                style: TextStyle(
                                                                  color: Color(
                                                                      0xffE6424B),
                                                                  fontSize: 17.sp,
                                                                  fontFamily:
                                                                  'Golos',
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 7.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: AutoSizeText(
                                                                'Total',
                                                                style: TextStyle(
                                                                  fontSize: 17.sp,
                                                                  fontFamily:
                                                                  'Golos',
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                            Spacer(
                                                              flex: 1,
                                                            ),
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: AutoSizeText(
                                                                '${controllerM.coutTotal(list_of_commands[index].plats)}',
                                                                style: TextStyle(
                                                                  color: Color(
                                                                      0xffE6424B),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                                  fontSize: 17.sp,
                                                                  fontFamily:
                                                                  'Golos',
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 22.h,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Spacer(
                                                    flex: 12,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 32.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(
                                        flex: 14,
                                      ),
                                    ],
                                  );
                              });

                        },
                      )
                    ],
                  )
              ),
            ),
          );
        }
    );
  }
}
