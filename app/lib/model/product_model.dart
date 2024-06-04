
import 'dart:convert';

class Product {
  int id;
  String name;
  String description;
  int qtd;
  double price;
  double cost_price;
  String urlImage;
  int category;
  String recipe;
  

  Product({required this.id, 
          required this.name, 
          required this.description, 
          required this.qtd, 
          required this.price, 
          required this.cost_price, 
          required this.category, 
          required this.recipe, 
          required this.urlImage});


  //  Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'name': name,
  //     'description': description,
  //   };
  // }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'] as int,
        name: map['name'] as String,
        description: map['description'] as String,
        recipe: map['recipe'] as String,
        cost_price: map['cost_price'] as double,
        price: map['sale_price'] as double,
        qtd: map['stock_amount'] as int,
        category: map['category'] as int,
        urlImage: map["picture_url"] as String,
            );
  }

  // String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
