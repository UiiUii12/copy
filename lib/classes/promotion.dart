
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Controller/HomeScreenController.dart';

class Promotion extends StatefulWidget {
  final String image;
  final String nameRestaurant;
  final String offre;
  final String descriptionOffre;
  final String ResId;
  const Promotion({Key? key,
    required this.image,
    required this.nameRestaurant,
    required this.offre,
    required this.descriptionOffre, required this.ResId,
  }) : super(key: key);

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  @override
  Widget build(BuildContext context) {
    //AppController controller=Get.put(permanent: true , AppController()) ;
     return Column(
       children: [
         Expanded(
           flex: 190,
           child: Container(
             width: 396.w,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(9.r),
                 color: HomeScreenController.ColorsPromo[HomeScreenController.ind.nextInt(7)],
             ),
             child: Row(
               children: [
                 SizedBox(width: 10.w,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Spacer(flex:20,),
                     AutoSizeText('${widget.nameRestaurant}',
                       style: TextStyle(fontFamily: 'Golos',fontWeight: FontWeight.w500,fontSize: 15.sp,color: Colors.white),),
                     Spacer(flex:4,),
                     AutoSizeText('${widget.offre}',style:TextStyle(fontFamily: 'Golos',fontWeight: FontWeight.w500,fontSize: 16.sp,color: Colors.white),),
                     Spacer(flex: 4,),
                     AutoSizeText('${widget.descriptionOffre}',style: TextStyle(fontFamily: 'Golos',fontWeight: FontWeight.w400,fontSize: 15.sp,color: Colors.white),),
                     Spacer(flex: 20,),

                   ],
                 ),
                 SizedBox(width: 15.w,),
                 Column(
                   children: [
                     Spacer(flex: 20,),
                     Expanded(
                      flex:112,
                      child: Container(
                          width:112.w,
                          child: Image.network(widget.image)),
                    ),
                     Spacer(flex: 20,),
                   ],)
               ],
             ),
           ),
         ),
       ],
     );
  }

}
