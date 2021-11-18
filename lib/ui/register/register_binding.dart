import 'package:cart_shoe/ui/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    // TODO: implement dependencies
  }

}