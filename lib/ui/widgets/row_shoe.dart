import 'package:cart_shoe/mixins/formatter.dart';
import 'package:cart_shoe/model/shoe.dart';
import 'package:cart_shoe/ui/list_shoe/list_shoe_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowShoe extends StatelessWidget {
  ListShoeController controller= Get.find<ListShoeController>();
  Shoe shoe;
  RowShoe({
    this.shoe
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.black38,
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(shoe.image)
                )
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text(shoe.name,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
          SizedBox(height: 3,),
          Text("\$ "+Formatter.format.format(shoe.price),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54,fontFamily: "Poppins"),),
          SizedBox(height: 5,),
          Center(
            child: Builder(builder: (context){
              Shoe shoe_in_cart=controller.shoe_in_cart.firstWhere((Shoe cart_item) =>
              cart_item.id==
                  shoe.id,orElse: ()=>null);
              if(shoe_in_cart!=null){
                return _buildQty(shoe_in_cart);
              }else{
                return _buildAddToCart();
              }

            }),
          )
        ],
      ),
    );
  }

  Widget _buildQty(Shoe shoe_in_cart){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: ()=>controller.minusQty(shoe_in_cart),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black,width: 1)
            ),
            child: Icon(Icons.remove,color: Colors.black,size: 18,),
          ),
        ),
        SizedBox(width: 7,),
        /// disi qty yang diambil dari object buku book_on_cart
        Text(shoe_in_cart.qty.toString(),style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontWeight: FontWeight.bold)),
        SizedBox(width: 7,),
        InkWell(
          onTap: ()=>controller.updateQty(shoe_in_cart),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black,width: 1)
            ),
            child: Icon(Icons.add,color: Colors.black,size: 18,),
          ),
        )
      ],
    );
  }

  Widget _buildAddToCart(){
    return SizedBox(
      height: 25,
      child: RaisedButton(
        color: Colors.black,
        onPressed: (){
          controller.addToCart(shoe);
        },
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        elevation: 1.0,
        child: Text("Add To Cart",style:TextStyle(fontFamily: "Poppins", color: Colors.white,fontSize: 12.0,)),
      ),
    );
  }


}
