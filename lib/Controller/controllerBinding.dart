import 'package:get/get.dart';

import 'AppController.dart';

class controllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() =>AppController());

  }
}