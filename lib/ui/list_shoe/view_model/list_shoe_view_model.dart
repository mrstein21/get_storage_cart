import 'package:cart_shoe/routes.dart';
import 'package:cart_shoe/ui/list_shoe/widget/confirm_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../model/shoe.dart';

class ListShoeViewModel extends ChangeNotifier{

  ListShoeViewModel(){
    loadData();
  }

  List<Shoe> _listShoe= [
    Shoe(id: 1,name: "Addidas SL 80",price: 100,image: "assets/adidas_sl_80.jpg",qty: 0),
    Shoe(id: 2,name: "Classic Brown",price: 24,image: "assets/classic_brown.jpg",qty: 0),
    Shoe(id:3,name: "Black Calfskin Leather",price: 120,image: "assets/black_calfskin_leather.jpg",qty: 0),
    Shoe(id:4,name: "Frasoicus Classic Shoe",price: 150,image: "assets/frasoicus_classic.jpg",qty: 0),
    Shoe(id:5,name: "La Martina Classic",price: 80,image: "assets/la_martina.jpg",qty: 0),
    Shoe(id:6,name: "Nike Sneaker",price: 150,image: "assets/nike_sneaker.jpg",qty: 0),
    Shoe(id:7,name: "Misalwa Classic",price: 100,image: "assets/misalwa_classic.jpg",qty: 0),
  ];

  List<Shoe> get listShoe  => _listShoe;

  List<Shoe> _listShoeInCart=[];

  List<Shoe> get listShoeInCart => _listShoeInCart;

  late Box _box;


  void loadData()async{
    _box=await Hive.openBox("app_cart");
    if(_box.containsKey("cart")){
      final items = _box.get('cart');
      if(items is List){
        _listShoeInCart.addAll(items.map((e) => Shoe.fromJson(Map<String,dynamic>.from(e))).toList());
        notifyListeners();
      }
    }
  }

  void addToCart(Shoe shoe){
    shoe=shoe.copyWith(
      qty: 1
    );
    _listShoeInCart.add(shoe);
    _box.put("cart",_listShoeInCart.map((Shoe data) =>data.toJson()).toList());
    notifyListeners();
  }


  void updateQtyCart(Shoe shoe){
    shoe= shoe.copyWith(
      qty: shoe.qty+1
    );
    _listShoeInCart.removeWhere((Shoe data) => data.id==shoe.id);
    _listShoeInCart.add(shoe);
    _box.put("cart",_listShoeInCart.map((Shoe data) =>data.toJson()).toList());
    notifyListeners();
  }

  void removeItemCart(int id){
    _listShoeInCart.removeWhere((Shoe data) =>data.id==id);
    _box.put("cart",_listShoeInCart.map((Shoe data) =>data.toJson()).toList());
    notifyListeners();
  }

  void  minusQtyCart(Shoe shoe){
    if(shoe.qty==1){
      _listShoeInCart.removeWhere((Shoe data) => data.id==shoe.id);
    }else{
      _listShoeInCart.removeWhere((Shoe data) => data.id==shoe.id);
      shoe=shoe.copyWith(
        qty: shoe.qty-1
      );
      _listShoeInCart.add(shoe);
    }
    _box.put("cart",_listShoeInCart.map((Shoe data) =>data.toJson()).toList());
    notifyListeners();
  }

  void proceedCart(){
    _box.delete("cart");
    _listShoeInCart=[];
    notifyListeners();
    Fluttertoast.showToast(msg: "Berhasil Proses Keranjang");
  }

  void showDialogConfirm(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel",style: TextStyle(color: Colors.white))
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)
                  ),
                  onPressed: (){
                    proceedCart();
                    Navigator.of(context).pop();
                  },
                  child: Text("Confirm",style: TextStyle(color: Colors.black),)
              )
            ],
            title: Text("Konfirmasi Pembelian",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            content: ConfirmDialog(
              cartItem: _listShoeInCart,
            ),
          );
        }
    );
  }

  void showDialogLogout(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel",style: TextStyle(color: Colors.white))
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)
                  ),
                  onPressed: (){
                    _box.delete("cart");
                    _box.delete("auth");
                    Navigator.pushNamedAndRemoveUntil(context, splashRoute,
                            (route) => false);
                  },
                  child: Text("Ya",style: TextStyle(color: Colors.black),)
              )
            ],
            title: Text("Apakah anda ingin logout ? ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          );
        }
    );
  }

}