import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
class OnBoardContent extends StatelessWidget {
  final String image ;
  final String title ;
  final String description ;
  const OnBoardContent({Key? key, required this.image, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 13.w,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer() ,
               Image.asset(image) ,
                SizedBox(height: 32.h,) ,
                AutoSizeText(title , style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.black), textAlign: TextAlign.center,maxLines: 1,) ,
                SizedBox(height: 31.h,) ,
                AutoSizeText(description , style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.normal , color:Color(0xff807F7F)), textAlign: TextAlign.center, maxLines: 2,),
              //  SizedBox(height : 215.h),
              ],
            ),
          ),
          SizedBox(width: 13.w,),
        ],
      )
      ,);
  }
}