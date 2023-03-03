import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controller/AdresseScreenController.dart';
import 'currentPage.dart';



class AdresseScreen extends StatelessWidget {

  AdresseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdresseScreenController controller = Get.put( AdresseScreenController(),permanent: true,);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Spacer(flex: 101,),
            Row(
              children: [
                SizedBox(width: 14.w,),
                Align(
                  alignment: Alignment.topLeft,
                  child: AutoSizeText(
                    'Ajouter votre adresse',
                    maxLines: 2,
                    style: TextStyle(fontSize: 28.sp, fontFamily: 'Golos'
                    ),
                  ),
                )
              ],
            ),
            Spacer(flex: 7,),
            Row(
              children: [
                SizedBox(width: 14.w,),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Pour faciliter la livraison de vos produits, vous\ndevez ajouter votre adresse .',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Color(0xff807F7F),
                        fontFamily: 'Golos',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14.w,),
              ],
            ),
            Spacer(flex: 35,),
            Row(
              children: [
                SizedBox(width: 14.w,),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Adresse',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Golos',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(flex: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(9)),
                  width: 401.w,
                  height: 56.h,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      style: TextStyle(
                          fontFamily: 'Golos',
                          fontSize: 18.sp),
                      cursorColor: Colors.grey,
                      autofocus: false,
                      enabled: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          EvaIcons.searchOutline,
                          color: Color(0xff9D9D9D),
                        ),
                        hintText: 'Ajouter votre adresse',
                        hintStyle: TextStyle(
                          fontFamily: 'Golos',
                          fontSize: 18.sp,
                          color: Color(0xff9D9D9D),
                        ),
                        counterText: "",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        isCollapsed: true,
                      ),
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.done,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.Adresse,
                      onChanged: (value){
                        controller.onSubmitAdresse();
                      },
                    ),
                  ),
                ),
              ],
            ),
            Spacer(flex: 34,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 56.h,
                  width: 401.w,
                  child: GetBuilder(
                    builder:(AdresseScreenController controller)=> ElevatedButton(
                      onPressed: controller.submitAdresse?()async {
                        FocusScope.of(context).unfocus();
                        controller.addAdresseUser(controller.Adresse.text);
                        Get.off(Main_Page());
                      }:null,
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontFamily: 'Golos',
                          fontSize: 22.sp,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffE6424B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(flex:529,),
          ],
        ),
      ),
    );
  }
}
