import 'package:cart_shoe/ui/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
    // TODO: implement dependencies
  }
}