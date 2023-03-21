import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Themes/Theme.dart';


class Dots extends StatelessWidget {
   final bool isActive ;
  const Dots({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.h,
      width: isActive ? 40.w : 15.w ,
      decoration: BoxDecoration(
        color: theme().primaryColor ,
        borderRadius: BorderRadius.all(Radius.circular(5.5.r)) ,
      ),


    );
  }
}
