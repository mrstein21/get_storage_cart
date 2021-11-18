class Shoe{
  int id;
  String name;
  int price;
  String image;
  int qty;

  Shoe({
    this.id,
    this.name,
    this.price,
    this.image,
    this.qty
  });

  factory Shoe.fromJson(Map<String,dynamic>json)=>Shoe(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    qty: json["qty"],
    price: json["price"]
  );

  Map<String,dynamic>toJson()=>{
    "id":id,
    "name":name,
    "qty":qty,
    "price":price,
    "image":image,
  };

}