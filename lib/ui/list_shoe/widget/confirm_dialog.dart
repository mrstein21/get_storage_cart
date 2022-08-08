import 'package:cart_shoe/mixins/formatter.dart';
import 'package:cart_shoe/model/shoe.dart';
import 'package:flutter/cupertino.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key, required this.cartItem}) : super(key: key);
  final List<Shoe>cartItem;

  int get grandTotal{
    int grand=0;
    for(int i=0;i<cartItem.length;i++){
      grand=grand+(cartItem[i].qty*cartItem[i].price);
    }
    return grand;
  }

  @override
  Widget build(BuildContext context) {
   return  Padding(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                height: 200,
                child: ListView.builder(
                  itemCount: cartItem.length,
                  itemBuilder: (_,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItem[index].name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),maxLines: 1,),
                          SizedBox(height: 4,),
                          Text("\$ "+Formatter.format.format(cartItem[index].price)+" x "+cartItem[index].qty.toString(),
                            style: TextStyle(
                              fontSize: 12
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text("Grand Total:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,)),
              SizedBox(height: 4,),
              Text(Formatter.format.format(grandTotal),style: TextStyle(fontSize: 12),),
              SizedBox(height: 4,),
            ],
          ),
        ],
      ),
    );
  }
}
