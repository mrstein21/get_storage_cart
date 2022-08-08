import 'package:cart_shoe/mixins/formatter.dart';
import 'package:cart_shoe/model/shoe.dart';
import 'package:cart_shoe/riverpod.dart';
import 'package:cart_shoe/ui/list_shoe/view_model/list_shoe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RowShoe extends ConsumerWidget {
  late ListShoeViewModel viewModel;
  Shoe shoe;
  RowShoe({
    required this.shoe
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    viewModel=ref.read(listShoeViewModel);
    return Container(
      height: 200,
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

              Shoe? shoeInCart=viewModel.listShoeInCart.firstWhere((Shoe cart_item) =>
              cart_item.id==
                  shoe.id,orElse: ()=>Shoe());
              if(shoeInCart.id!=0){
                return _buildQty(shoeInCart);
              }else{
                return _buildAddToCart();
              }

            }),
          )
        ],
      ),
    );
  }

  Widget _buildQty(Shoe shoeInCart){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: ()=>viewModel.minusQtyCart(shoeInCart),
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
              Text(shoeInCart.qty.toString(),style: TextStyle(color: Colors.black,fontFamily: "Poppins",fontWeight: FontWeight.bold)),
              SizedBox(width: 7,),
              InkWell(
                onTap: ()=>viewModel.updateQtyCart(shoeInCart),
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
        ),
        InkWell(
          onTap: ()=>viewModel.removeItemCart(shoeInCart.id),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black,width: 1)
            ),
            child: Icon(Icons.delete,color: Colors.black,size: 18,),
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCart(){
    return SizedBox(
      height: 25,
      child: RaisedButton(
        color: Colors.black,
        onPressed: (){
            viewModel.addToCart(shoe);
          },
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        elevation: 1.0,
        child: Text("Add To Cart",style:TextStyle(fontFamily: "Poppins", color: Colors.white,fontSize: 12.0,)),
      ),
    );
  }


}
