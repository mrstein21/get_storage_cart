import 'package:cart_shoe/model/shoe.dart';
import 'package:cart_shoe/riverpod.dart';
import 'package:cart_shoe/ui/widgets/row_shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListShoeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final _viewModel=ref.watch(listShoeViewModel);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          InkWell(
            onTap: (){
              if(_viewModel.listShoeInCart.length>0){
                _viewModel.showDialogConfirm(context);
              }
            },
            child: Icon(Icons.shopping_cart,color: Colors.white,),
          ),
          SizedBox(width: 5,),
          InkWell(
            onTap: (){
              _viewModel.showDialogLogout(context);
            },
            child: Icon(Icons.power_settings_new_outlined,color: Colors.white,),
          ),
          SizedBox(width: 12,)

        ],
        title: Text("Stein Sneaker",style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: _buildList(_viewModel.listShoe)
      ),
    );
  }

  Widget _buildList(List<Shoe> list){
   return AlignedGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return RowShoe(shoe: list[index],);
      },
    );
  }
}
