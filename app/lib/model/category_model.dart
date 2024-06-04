// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  int id;
  String name;
  String? description;
  String? urlImg;

  Category({
    required this.id,
    required this.name,
    this.description,
    this.urlImg,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
        id: map['id'] as int,
        name: map['name'] as String,
        description: map['description'] as String,
        urlImg:
            'https://mccarthyspub.com.co/wp-content/uploads/2020/08/mccarthys-burger.png');
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);
}
