import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

Widget customWithButtonDialog({required title,required ligne1,required ligne2,required asset,fonction} ){
  return Column(
    children: [
      Spacer(flex: 210,),
      Expanded(
        flex:362,
        child: Dialog(
          //  insetAnimationDuration: Duration(milliseconds: 100),

          child: Container(
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(30)
            ),
            child:Column(
              children: [
                Expanded(
                    flex:150,
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
                  ),
                  textAlign:TextAlign.center,
                  style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400,color: Color(0xffB8B4B4,),fontFamily: 'Golos'),),
                Spacer(flex: 15,),
                Row(
                  children: [
                    Spacer(flex: 1,),
                    Expanded(
                      flex:16,
                      child: Container(
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed:()=>fonction,
                          child: Text(
                            'Réessayer',
                            style: TextStyle(
                              fontFamily: 'Golos',
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffE6424B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9.0),
                              )),),
                      ),
                    ),
                    Spacer(flex: 1,),
                  ],
                ),
                Spacer(flex: 20,),

              ],
            ),
          ),
        ),
      ),
      Spacer(flex: 210,),
    ],
  );

}