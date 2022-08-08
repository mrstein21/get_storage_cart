import 'package:intl/intl.dart';

class Shoe{
  int? _id;
  String? _name;
  int? _price;
  String? _image;
  int? _qty;

  int get id => _id ?? 0;
  String get name => _name ?? "";
  String get image => _image ?? "";
  int get price => _price ?? 0;
  int get qty => _qty ?? 0;

  Shoe({
   int? id,
   String? name,
   int? price,
   String? image,
   int? qty
  }){
    _id=id;
    _name=name;
    _price=price;
    _image=image;
    _qty=qty;
  }

  Shoe copyWith({
    int? id,
    String? name,
    int? price,
    String? image,
    int? qty
  }){
    return Shoe(
      id: id ?? _id,
      name: name ?? _name,
      price:  price ?? _price,
      image: image ?? _image,
      qty:  qty ?? _qty
    );
  }


  factory Shoe.fromJson(Map<String,dynamic>json)=>Shoe(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    qty: json["qty"],
    price: json["price"]
  );

  Map<String,dynamic>toJson()=>{
    "id":_id,
    "name":_name,
    "qty":_qty,
    "price":_price,
    "image":_image,
  };

}