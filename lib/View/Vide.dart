import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';


@override
Widget Vide() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 151.h,),
      Container(
        height: 300.h,
        width: 300.w,
        child: Lottie.asset('assets/json/empty.json',animate: true,repeat: true),),
      SizedBox(height: 236.h,)
    ],
  );

}

