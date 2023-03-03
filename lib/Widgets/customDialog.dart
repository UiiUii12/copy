import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

Widget customDialog({required title,required ligne1,required ligne2,required asset }){
  return Column(
    children: [
      Spacer(flex: 230,),
      Expanded(
        flex:361,
        child: Dialog(
          child: Container(
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(30)
            ),
            child:Column(
              children: [
                Expanded(
                    flex:80,
                    child: Lottie.asset(asset)),
                Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(title,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w500,color: Colors.black,fontFamily: 'Golos'),)),
                SizedBox(height: 15.h,),
                AutoSizeText.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text:  "$ligne1\n"
                        ),
                        TextSpan(
                            text: "$ligne2"
                        ),
                      ]
                  )
                  ,
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400,color: Color(0xffB8B4B4,),fontFamily: 'Golos'),),
                Spacer(flex: 15,),
              ],
            ),
          ),
        ),
      ),
      Spacer(flex: 230,),
    ],
  );

}