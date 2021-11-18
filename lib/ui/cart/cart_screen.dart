import 'package:cart_shoe/ui/cart/cart_controller.dart';
import 'package:cart_shoe/ui/widgets/row_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartController controller=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    controller.getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart",style: TextStyle(fontFamily: "Poppins"),),
      ),
      body: Container(
        child: GetBuilder<CartController>(
          init:CartController(),
          builder: (CartController controllerX){
            return controller.cart_list.isNotEmpty?Column(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _buildList(),
                )),
                _buildProceed()
              ],
            ):_buildEmpty();
          },
        ),
      ),
    );
  }

  Widget _buildProceed(){
    return InkWell(
      onTap: ()=>controller.showPopupDialog(),
      child: Container(
        width: double.infinity,

        color: Colors.black,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text("Proceed",style: TextStyle(color: Colors.white,fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 16),),
        ),
      ),
    );
  }

  Widget _buildList(){
    return ListView.builder(
        itemCount: controller.cart_list.length,
        itemBuilder: (ctx,index){
          return RowCart(shoe: controller.cart_list[index],index: index,);
        }
    );
  }


  Widget _buildEmpty(){
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart,color: Colors.black26,size: 50,),
            SizedBox(height: 7,),
            Text("Your Cart is empty",style: TextStyle(color: Colors.black26,fontFamily: 'Poppins',fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }

}
