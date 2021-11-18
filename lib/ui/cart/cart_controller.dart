import 'package:cart_shoe/mixins/formatter.dart';
import 'package:cart_shoe/model/shoe.dart';
import 'package:cart_shoe/repository/auth_repository.dart';
import 'package:cart_shoe/repository/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  List<Shoe>cart_list=new List<Shoe>();
  Map<String,dynamic>userSession=new Map<String,dynamic>();

  void minusQty(Shoe data,index){
    cart_list=CartRepository().minusQty(data,index: index);
    update();
  }

  void updateQty(Shoe data,int index){
    cart_list=CartRepository().updateQty(data,index:index);
    update();
  }

  void deleteCart(Shoe data){
    cart_list=CartRepository().deleteCart(data);
    update();
  }

  void getData(){
    userSession=AuthRepository().getUserSession();
    cart_list=CartRepository().getShoeFromStorage();
    update();
  }

  void showPopupDialog(){
    //calculate grand tota;
    int grand_total=0;
    for(int i=0;i<cart_list.length;i++){
        grand_total=grand_total+(cart_list[i].price *cart_list[i].qty);
    }
    //show dialog
    Get.defaultDialog(
        title: "Really want to proceed ?",
        onConfirm: (){
          CartRepository().deleteAllCart();
          cart_list=[];
          update();
          Get.back();
          Get.snackbar("Message", "Transaction succeed ! ",colorText: Colors.white,backgroundColor: Colors.black,snackPosition: SnackPosition.BOTTOM);
        },
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.black,fontFamily: 'Poppins',fontSize: 17,fontWeight: FontWeight.bold),
        textConfirm: "Confirm",
        textCancel: "Cancel",
        cancelTextColor: Colors.black,
        confirmTextColor: Colors.white,
        buttonColor: Colors.black,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 300,
              height: 200,
              child: ListView.separated(
                separatorBuilder: (_,i)=>Divider(),
                itemCount: cart_list.length,
                itemBuilder: (_,index){
                  return ListTile(
                    leading: Container(
                      width: 60,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(cart_list[index].image)
                          )
                      ),
                    ),
                    title:Text(cart_list[index].name,style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 12),),
                    subtitle: Text("\$ "+Formatter.format.format(cart_list[index].price)+" x "+cart_list[index].qty.toString(),
                      style: TextStyle(fontFamily: "Poppins",color: Colors.black,fontSize: 10),),
                  );
                },
              ),
            ),
            SizedBox(height: 5,),
            Text(userSession["name"],style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold,fontSize: 12),),
            SizedBox(height: 5,),
            Text(userSession["email"],style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold,fontSize: 12),),
            SizedBox(height: 5,),
            Text("Total \$ "+Formatter.format.format(grand_total),style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold,fontSize: 12),)
          ],
        )
    );
  }

}