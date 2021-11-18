import 'package:cart_shoe/model/shoe.dart';
import 'package:cart_shoe/repository/auth_repository.dart';
import 'package:cart_shoe/repository/cart_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListShoeController extends GetxController{
  GetStorage storage=GetStorage();
  List<Shoe>list_shoe= [
    Shoe(id: 1,name: "Addidas SL 80",price: 100,image: "assets/adidas_sl_80.jpg"),
    Shoe(id: 2,name: "Classic Brown",price: 24,image: "assets/classic_brown.jpg"),
    Shoe(id:3,name: "Black Calfskin Leather",price: 120,image: "assets/black_calfskin_leather.jpg"),
    Shoe(id:4,name: "Frasoicus Classic Shoe",price: 150,image: "assets/frasoicus_classic.jpg"),
    Shoe(id:5,name: "La Martina Classic",price: 80,image: "assets/la_martina.jpg"),
    Shoe(id:6,name: "Nike Sneaker",price: 150,image: "assets/nike_sneaker.jpg"),
    Shoe(id:7,name: "Misalwa Classic",price: 100,image: "assets/misalwa_classic.jpg"),

  ];
  List<Shoe>shoe_in_cart= new List<Shoe>();



  void minusQty(Shoe data){
    CartRepository().minusQty(data);
  }

  void addToCart(Shoe data){
    CartRepository().addToCart(data);
  }

  void updateQty(Shoe data){
    CartRepository().updateQty(data);
  }

  ///test data
  //test  dadada

  void getData(){
     storage.listenKey("shoe", (data){
       shoe_in_cart.clear();
       if(data is List){
         shoe_in_cart.addAll(data.map((e) => Shoe.fromJson(Map<String,dynamic>.from(e))).toList());
         update();
       }
     });
     shoe_in_cart=CartRepository().getShoeFromStorage();
     update();
  }

  void logout(){
    AuthRepository().deleteSession();
    Get.offAllNamed("/splash");
  }

}