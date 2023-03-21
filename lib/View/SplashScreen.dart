import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../Controller/SplachScreenController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashScreenController controller =
    Get.put(SplashScreenController());
    return Scaffold(
      body: GetBuilder(
        init:SplashScreenController() ,
        builder:(controller){
         return Container(
            decoration: BoxDecoration(
              color: Color(0xffE6424B),
              /* image: DecorationImage(
              image: AssetImage('assets/images/backgroundImage.png'),
              fit: BoxFit.cover,
            )*/
            ),
            child: Center(
              child:  SpinKitThreeBounce(
                size: 30.sp,
                color: Colors.white,
              ),
            ),
          );
        }
      )
    );
  }
}
