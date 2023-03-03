import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project/View/AdresseScreen.dart';
import 'package:project/View/WelcomeScreen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../View/LoginScreen.dart';
import '../auth/auth.dart';
import '../bdd/clientinfo.dart';
import 'AppController.dart';
import 'LoginScreenController.dart';

class OTPScreenController extends GetxController{

  final Uri _number = Uri.parse('tel:+213556000010');
  bool codeTrue=true;
  bool submitOTP=false;
  bool submit1=false;
  bool submit2=false;
  bool submit3=false;
  bool submit4=false;
  bool submit5=false;
  bool submit6=false;
  final digitCode1=new TextEditingController();
  final digitCode2=new TextEditingController();
  final digitCode3=new TextEditingController();
  final digitCode4=new TextEditingController();
  final digitCode5=new TextEditingController();
  final digitCode6=new TextEditingController();
  String code ="";
  @override
  void onInit() {
    super.onInit();
  }
  void onSubmitOTP() {
    submit1=digitCode1.text.isNotEmpty;
    submit2=digitCode2.text.isNotEmpty;
    submit3=digitCode3.text.isNotEmpty;
    submit4=digitCode4.text.isNotEmpty;
    submit5=digitCode5.text.isNotEmpty;
    submit6=digitCode6.text.isNotEmpty;
    update();
  }
  void onInDirectCall()async {
    if (!await launchUrl(_number))
      throw 'Could not launch $_number';
    update();
  }
  Future<void> verificationCodeOTP() async {
    code = digitCode1.text+digitCode2.text+digitCode3.text+digitCode4.text+digitCode5.text+digitCode6.text;
    try {
      UserCredential result = await FirebaseAuth
          .instance
          .signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: LoginScreenController.verificationCode,
              smsCode: code));
      DatabaseService(uid: result.user!.uid)
          .updatUserdata();
      Get.toNamed('/welcome');
      AuthService().singeOut(); //hadiiiiiii lazam ftest
    } catch (e) {
      AppController.showDialogButton(
          'le code de vérification est erroné',
          'votre code est erroné veuillez ajouter',
          'un code valide',
          'assets/json/exclamation.json',Get.back()
      );
      // Get.off(()=>WelcomeScreen());
    }
  }

  @override
  void onClose() {
    digitCode1.dispose();
    digitCode2.dispose();
    digitCode3.dispose();
    digitCode4.dispose();
    digitCode5.dispose();
    digitCode6.dispose();;
    super.onClose();
  }

}