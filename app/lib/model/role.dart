import 'dart:convert';

import 'package:app/enums/role.dart';

class RoleModel {
  final int id;
  final Role role;

  RoleModel({required this.id, required this.role});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'role': role.toMap(),
    };
  }

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      id: map['id'] as int,
      role: Role.fromMap(map['role'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleModel.fromJson(String source) => RoleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
