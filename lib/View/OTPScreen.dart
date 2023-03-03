
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controller/OTPScreenController.dart';
import 'LoginScreen.dart';

class OTPScreen extends StatefulWidget {
  final phoneNumber;
  OTPScreen({Key? key,required this.phoneNumber}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  OTPScreenController controller = Get.put( OTPScreenController(),permanent: true,);


  Widget build(BuildContext context) {
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
                    'Vérification OTP',
                    maxLines: 2,
                    style: TextStyle(fontSize: 28.sp, fontFamily: 'Golos'),
                  ),
                )
              ],
            ),
            Spacer(flex:10,),
            Row(
              children: [
                SizedBox(width: 14.w,),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                            'Vous recevrez un code de 6 chiffres sur votre\nnuméro de téléphone +213${widget.phoneNumber}, ',
                            style: TextStyle(
                              color: Color(0xff807F7F),
                              fontSize: 17.sp,
                              fontFamily: 'Golos',
                            )),
                        TextSpan(
                            text: 'Changer le numéro de téléphone ?',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushReplacementNamed(
                                  context, '/'),
                            style: TextStyle(
                              color: Color(0xffE6424B),
                              fontSize: 17.sp,
                              fontFamily: 'Golos',
                            ))
                      ]),
                    ),
                  ),
                ),
                SizedBox(width: 14.w,),
              ],
            ),
            Spacer(flex: 41,),
            Row(
              children: [
                SizedBox(width: 14.w,),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Code de vérfication',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'Golos',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(flex: 15,),
            Row(
              children: [
                SizedBox(width: 14.w,),
                _textFieldOTP(
                  first: true,
                  last: false,
                  numero: 1,
                  digitCodeN: controller.digitCode1,
                ),
                SizedBox(width: 11.4.w,),
                _textFieldOTP(
                  first: false,
                  last: false,
                  numero: 2,
                  digitCodeN: controller.digitCode2,
                ),
                SizedBox(width: 11.4.w,),
                _textFieldOTP(
                  first: false,
                  last: false,
                  numero: 3,
                  digitCodeN: controller.digitCode3,
                ),
                SizedBox(width: 11.4.w,),
                _textFieldOTP(
                  first: false,
                  last: false,
                  numero: 4,
                  digitCodeN: controller.digitCode4,
                ),
                SizedBox(width: 11.4.w,),
                _textFieldOTP(
                  first: false,
                  last: false,
                  numero: 5,
                  digitCodeN: controller.digitCode5,
                ),
                SizedBox(width: 11.4.w,),
                _textFieldOTP(
                  first: false,
                  last: true,
                  numero: 6,
                  digitCodeN: controller.digitCode6,
                ),
                SizedBox(width: 15.w,),
              ],
            ),
            Spacer(flex: 33,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder(
                  builder: (OTPScreenController controller) => Container(
                    height: 56.h,
                    width: 401.w,
                    child: ElevatedButton(
                      onPressed:
                      controller.submit1 &&
                          controller.submit2 &&
                          controller.submit3 &&
                          controller.submit4 &&
                          controller.submit5 &&
                          controller.submit6
                          ? () =>controller.verificationCodeOTP()
                          : null,
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
            Spacer(flex: 36,),
            Align(
              alignment: Alignment.center,
              child: RichText(
                maxLines: 1,
                text: TextSpan(children: [
                  TextSpan(
                      text:'Vous avez un problème ?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontFamily: 'Golos',
                      )),
                  TextSpan(
                      recognizer:  TapGestureRecognizer()
                        ..onTap = () => controller.onInDirectCall(),
                      text:' Contactez-nous',
                      style: TextStyle(
                        color: Color(0xffE6424B),
                        fontSize: 18.sp,
                        fontFamily: 'Golos',
                      ))
                ]),
              ),
            ),
            Spacer(flex: 430,)
          ],
        ),
      ),
    );
  }

  Widget _textFieldOTP(
      {required bool first,
        required bool last,
        required int numero,
        required TextEditingController digitCodeN}) {
    return Container(
      height: 54.h,
      width: 57.w,
      decoration: BoxDecoration(
          color: Color(0xffF6F6F6), borderRadius: BorderRadius.circular(9)),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        showCursor: false,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Colors.black,
        textAlign: TextAlign.center,
        controller: digitCodeN,
        style: TextStyle(
          fontSize: 28.sp,
          fontFamily: 'Golos',
        ),
        onChanged: (value) {
          controller.onSubmitOTP();
          if ((value.length == 1) && (last == false)) {
            FocusScope.of(context).nextFocus();
          } else if ((value.length == 0) && (first == false)) {
            FocusScope.of(context).previousFocus();
          } else if ((value.length == 1) && (last == true)) {
            FocusScope.of(context).unfocus();
          }
        },
      ),
    );
  }
}
