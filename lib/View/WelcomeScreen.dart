import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project/View/AdresseScreen.dart';


class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Spacer(flex: 308,),
            Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                'Vous êtes les bienvenus',
                style: TextStyle(
                    fontSize: 28.sp,
                    fontFamily: 'Golos'
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                'dans notre application',
                style: TextStyle(
                    fontSize: 28.sp,
                    fontFamily: 'Golos'
                ),
              ),
              // 'dans notre application'
            ),
            Spacer(flex: 10,),
            Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                'Nous apprécions chacun de nos clients et\nespérons que vous apprécierez avec nous',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Color(0xff807F7F),
                  fontFamily: 'Golos',
                ),
              ),
            ),
            Spacer(flex: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 401.w,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(()=>AdresseScreen());
                    },
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
                            side: BorderSide(color: Colors.red))),
                  ),
                ),
              ],
            ),
            Spacer(flex: 407,),
          ],
        ),
      ),
    );
  }
}
