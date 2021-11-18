import 'package:cart_shoe/mixins/formatter.dart';
import 'package:cart_shoe/model/shoe.dart';
import 'package:cart_shoe/ui/cart/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowCart extends StatelessWidget {
  CartController controller=Get.find<CartController>();
  Shoe shoe;
  int index;

  RowCart({
    this.index,
    this.shoe
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius:  new BorderRadius.circular(5.0),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image:AssetImage(shoe.image)
                  )
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(shoe.name,style:TextStyle(fontFamily: "Poppins",color:Colors.black,fontWeight: FontWeight.bold,fontSize: 15),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  SizedBox(
                    height:7,
                  ),
                  Text("\$ "+Formatter.format.format(shoe.price),style:TextStyle(fontFamily: "Poppins",fontSize: 13,color: Colors.black)) ,
                  SizedBox(
                    height:7,
                  ),
                  Text("Total - \$ "+Formatter.format.format(shoe.price*shoe.qty),style:TextStyle(fontFamily: "Poppins",fontSize: 13,color: Colors.black)) ,
                  SizedBox(
                    height: 7,
                  ),
                  _buildQty()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQty(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: ()=>controller.deleteCart(shoe),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.black,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.delete,color: Colors.black,size: 18,),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: ()=>controller.minusQty(shoe,index),
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
            Text(shoe.qty.toString(),style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontWeight: FontWeight.bold)),
            SizedBox(width: 7,),
            InkWell(
              onTap: ()=>controller.updateQty(shoe,index),
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
        ),
      ],
    );
  }

}
