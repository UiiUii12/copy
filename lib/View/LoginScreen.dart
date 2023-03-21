import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project/View/OTPScreen.dart';

import '../Controller/LoginScreenController.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    LoginScreenController controller = Get.put(
      LoginScreenController(),
      permanent: true,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Spacer(
              flex: 101,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: AutoSizeText(
                    'Bienvenue dans notre\nlivraison de nourriture',
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 28.sp, fontFamily: 'Golos'),
                  ),
                )
              ],
            ),
            Spacer(
              flex: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: AutoSizeText(
                    'Ajoutez vos informations personnelles pour faciliter\nle contact avec notre service',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Color(0xff807F7F),
                      fontFamily: 'Golos',
                    ),
                  ),
                ),
                SizedBox(
                  width: 14.w,
                )
              ],
            ),
            Spacer(
              flex: 32,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Nom',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Golos',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius: BorderRadius.circular(9)),
                  height: 56.h,
                  width: 401.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: 'Golos', fontSize: 18.sp),
                      cursorColor: Colors.grey,
                      enabled: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsetsDirectional.only(start: 11.w),
                        hintText: 'Ajouter votre nom',
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
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller.nom,
                      onChanged: (value) {
                        controller.onSubmitLogin();
                      },
                    ),
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 32,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Numéro de téléphone',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Golos',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 10,
            ),
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
                    alignment: Alignment.center,
                    child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(fontFamily: 'Golos', fontSize: 18.sp),
                        cursorColor: Colors.grey,
                        enabled: true,
                        decoration: InputDecoration(
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 11.w),
                              SvgPicture.asset('assets/images/icons8-algérie-48.svg'
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "+213",
                                  style: TextStyle(
                                      fontSize: 18.sp, fontFamily: 'Golos'),
                                ),
                              )
                            ],
                          ),
                          counterText: "",
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.transparent,
                          isCollapsed: true,
                        ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        maxLength: 9,
                        //textAlignVertical: TextAlignVertical.center,
                        controller: controller.phoneNumber,
                        onChanged: (phoneNumber) {
                          controller.onSubmitLogin();
                          if (controller.submit1 && controller.submit2) {
                            FocusScope.of(context).unfocus();
                          }
                          ;
                        }),
                  ),
                ),
                // SizedBox(width: 14.w,),
              ],
            ),
            Spacer(
              flex: 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 401.w,
                  height: 56.h,
                  child: GetBuilder(
                    builder: (LoginScreenController controller) =>
                        ElevatedButton(
                          onPressed: controller.submit1 && controller.submit2
                              ? () async {
                            controller.createNewUser(controller.phoneNumber.text,controller.nom.text,);
                            controller.signInWithPhoneNumber();
                           // Get.to(OTPScreen(phoneNumber: controller.phoneNumber.text));
                          } : null,
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
            Spacer(
              flex: 36,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                maxLines: 1,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Vous avez un problème ?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: 'Golos',
                      )),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => controller.onInDirectCall(),
                      text: ' Contactez-nous',
                      style: TextStyle(
                        color: Color(0xffE6424B),
                        fontSize: 18.sp,
                        fontFamily: 'Golos',
                      ))
                ]),
              ),
            ),
            Spacer(
              flex: 350,
            ),
          ],
        ),
      ),
    );
  }
}
