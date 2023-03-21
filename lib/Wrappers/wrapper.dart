
import 'package:flutter/cupertino.dart';
import 'package:project/View/HomeScreen.dart';
import 'package:project/View/LoginScreen.dart';
import 'package:project/View/currentPage.dart';
import 'package:provider/provider.dart';
import '../View/AdresseScreen.dart';
import '../View/OnBoardingScreen.dart';
import '../auth/auth.dart';
import '../auth/user.dart';



class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      return OnBoardingScreen();
    } else {
      return Main_Page();
    }
  }
}

