import 'package:cart_shoe/model/shoe.dart';
import 'package:get_storage/get_storage.dart';

class CartRepository{
  GetStorage storage=GetStorage();

  List<Shoe>getShoeFromStorage(){
    List<Shoe>list=new List<Shoe>();
    if(storage.hasData("shoe")){
      var data = storage.read("shoe");
      if(data is List){
        list.addAll(data.map((e) => Shoe.fromJson(Map<String,dynamic>.from(e))).toList());
      }
      return list;
    }
    return list;
  }

   List<Shoe> updateQty(Shoe shoe,{int index}){
    shoe.qty=shoe.qty+1;
    List<Shoe>list=getShoeFromStorage();
    list.removeWhere((Shoe data) => data.id==shoe.id);
    if(index!=null){
      list.insert(index, shoe);
    }else{
      list.add(shoe);
    }
    storage.write("shoe",list.map((Shoe data) =>data.toJson()).toList());
    return list;
  }


  List<Shoe> minusQty(Shoe shoe,{int index}){
    List<Shoe>list=getShoeFromStorage();
    if(shoe.qty==1){
      list.removeWhere((Shoe data) => data.id==shoe.id);
    }else{
      list.removeWhere((Shoe data) => data.id==shoe.id);
      print("to hwews");
      shoe.qty=shoe.qty-1;
      if(index!=null){
        list.insert(index, shoe);
      }else{
        list.add(shoe);
      }
    }
    // await cartBox.put("items_cart", cart.map((Airsoft airsoft) =>airsoft.toJson()).toList());
    storage.write("shoe",list.map((Shoe data) =>data.toJson()).toList());
    return list;
  }


  List<Shoe> addToCart(Shoe shoe){
    shoe.qty=1;
    List<Shoe>list=getShoeFromStorage();
    list.add(shoe);
    storage.write("shoe",list.map((Shoe data) =>data.toJson()).toList());
    return list;
  }


  List<Shoe>deleteCart(Shoe shoe,{int index}){
    List<Shoe>list=getShoeFromStorage();
    list.removeWhere((Shoe data) =>data.id==shoe.id);
    storage.write("shoe",list.map((Shoe data) =>data.toJson()).toList());
    return list;
  }

  //if you delete the key "shoe" get_storage wont listen again the changed of value in key "shoe"
  //so i empty the value in key "shoe" with empty list array,
  void deleteAllCart(){
    storage.write("shoe",[]);
  }

}