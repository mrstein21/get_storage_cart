import 'package:cart_shoe/ui/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    // TODO: implement dependencies
  }

}