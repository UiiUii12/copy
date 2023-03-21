
import 'package:flutter/cupertino.dart';
import 'package:project/View/HomeScreen.dart';

import 'package:provider/provider.dart';

import '../../View/Restaurant.dart';
import '../auth/user.dart';
import '../bdd/restauinfo.dart';



class Wrapper3 extends StatelessWidget {
  const Wrapper3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return StreamBuilder<List<Restaurant>>(
        stream:  RestauService().restaurantList,
        builder: (context, snapshot) {
          List<Restaurant> list = [];


          if (snapshot.hasData) {
            list = snapshot.data!;

          }

          //Home.lo=list;

          return  Home();


        });
  }
}
