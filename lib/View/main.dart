import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import '../auth/auth.dart';
import '../auth/user.dart';
import 'AdresseScreen.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'MesCommandes.dart';
import 'OTPScreen.dart';
import 'OrderConfirmer.dart';
import 'SplashScreen.dart';
import 'WelcomeScreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      catchError: (e, i) => null,
      builder: (context, snapshot) {
        return ScreenUtilInit(
            designSize: const Size(428, 926),
            splitScreenMode: true,
            minTextAdapt: true,
            builder: ( context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
          initialRoute: 'wrapper',
        routes: {
          '/': (context) => LoginScreen(),
          //'login':(context)=>LoginScreen(),
          '/acceuil': (context) => Home(),
          '/otp': (context) => OTPScreen(phoneNumber: null,),
          '/adresse': (context) => AdresseScreen(),
          '/welcome': (context) => WelcomeScreen(),
          '/orderconfirmer': (context) => OrderConfirmerScreen(),
          '/mescommandes': (context) => MesCommandesScreen(),
         },
        );
        }
   );
      }
    );
  }
}

