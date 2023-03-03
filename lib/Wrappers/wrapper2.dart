
import 'package:flutter/cupertino.dart';
import '../../View/Restaurant.dart';
import '../../View/SearchScreen.dart';
import '../bdd/classes.dart';
import '../bdd/restauinfo.dart';


class Wrapper2 extends StatelessWidget {
  const Wrapper2({Key? key}) : super(key: key);
  static   List<cat> list2 =[];
  static List<Restaurant> list = [];
  @override
  Widget build(BuildContext context) {


    return StreamBuilder<List<Restaurant>>(
        stream: RestauService().restaurantList ,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            list = snapshot.data!;

          }
          // SearchScreen.lo=list.obs;

          return StreamBuilder<List<cat>>(
              stream: RestauService().catlist(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  list2 = snapshot.data! ;

                //SearchScreen.li=list2.obs;
                return  SearchScreen();
              }
          );
        });
  }
}
