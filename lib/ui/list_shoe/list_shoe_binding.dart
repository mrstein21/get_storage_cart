import 'package:cart_shoe/ui/list_shoe/list_shoe_controller.dart';
import 'package:get/get.dart';

class ListShoeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ListShoeController());
    // TODO: implement dependencies
  }

}