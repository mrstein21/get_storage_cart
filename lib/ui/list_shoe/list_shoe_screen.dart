import 'package:badges/badges.dart';
import 'package:cart_shoe/ui/list_shoe/list_shoe_controller.dart';
import 'package:cart_shoe/ui/widgets/row_shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ListShoeScreen extends StatelessWidget {
  ListShoeController controller=Get.find<ListShoeController>();

  @override
  Widget build(BuildContext context) {
    controller.getData();
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetBuilder<ListShoeController>(
              init: ListShoeController(),
              builder: (context){
                if(controller.shoe_in_cart.isNotEmpty){
                  return InkWell(
                    onTap: (){
                      Get.toNamed("/cart");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Badge(
                          child: Icon(Icons.shopping_cart,color: Colors.white,),
                          badgeColor: Colors.red,
                          badgeContent: Text(controller.shoe_in_cart.length.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Poppins"),)
                      ),
                    ),
                  );
                }else{
                  return Icon(Icons.shopping_cart,color: Colors.white,size: 20,);
                }
              }),
          SizedBox(width: 5,),
          InkWell(
            onTap: ()=>controller.logout(),
            child: Icon(Icons.power_settings_new_outlined,color: Colors.white,),
          ),
          SizedBox(width: 12,)

        ],
        title: Text("Stein",style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: GetBuilder<ListShoeController>(
          init: ListShoeController(),
          builder: (controller2){
            return _buildList();
          },
        )
      ),
    );
  }

  Widget _buildList(){
   return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
     staggeredTileBuilder: (index) {
       return StaggeredTile.count(1,  1.2);
     },
      itemCount: controller.list_shoe.length,
      itemBuilder: (context, index) {
        return RowShoe(shoe: controller.list_shoe[index],);
      },
    );
  }
}
