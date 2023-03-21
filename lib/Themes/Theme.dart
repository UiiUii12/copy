 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


ThemeData theme (){
  return ThemeData(
    primaryColor: Color(0xffE6424B),
    scaffoldBackgroundColor: Colors.white ,
    backgroundColor: Colors.white ,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: ScreenUtil().setSp(28),
        color: Colors.black,
       // fontWeight: FontWeight.bold,
        fontFamily: 'Golos',
      ) ,
      headline2: TextStyle(
          fontFamily: 'Golos',
          fontSize: ScreenUtil().setSp(22),
         // fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: ScreenUtil().setSp(20),
        fontFamily: 'Golos',
      ),
      headline4: TextStyle(
          fontFamily: 'Golos',
          fontSize: ScreenUtil().setSp(18),
          color : Colors.black ,
         // fontWeight: FontWeight.w500
      ),
      headline5: TextStyle(
        color: Color(0xff807F7F),
        fontSize: ScreenUtil().setSp(17),
       // fontWeight: FontWeight.normal,
        fontFamily: 'Golos',
      ),

      bodyText1: TextStyle(
        color: Color(0xff9D9D9D),
        fontSize: ScreenUtil().setSp(15),
        fontFamily: 'Golos',
       // fontWeight: FontWeight.normal
      ),
      bodyText2: TextStyle(
          fontFamily: 'Golos' ,
          fontSize: ScreenUtil().setSp(14) ,
        //  fontWeight: FontWeight.bold
      ),

      subtitle1: TextStyle(
        color: Colors.black ,
        fontSize: ScreenUtil().setSp(13) ,
       // fontWeight: FontWeight.bold ,
        fontFamily: 'Golos' ,
      ),
    ) ,











  );
}