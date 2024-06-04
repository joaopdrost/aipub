// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app/enums/role.dart';

class UserDetail {
  final int user;
  final String firstname;
  final String surname;
  final String email;
  final List<Role> roles;

  UserDetail({required this.user, required this.firstname, required this.surname, required this.email, required this.roles});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'firstname': firstname,
      'surname': surname,
      'email': email,
      'roles': roles.map((x) => x.toMap()).toList(),
    };
  }

  factory UserDetail.fromMap(Map<String, dynamic> map) {
    return UserDetail(
      user: map['user'] as int,
      firstname: map['firstname'] as String,
      surname: map['surname'] as String,
      email: map['email'] as String,
      roles: List<Role>.from((map['roles']).map<Role>((x) => Role.fromMap(x["role"])),),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetail.fromJson(String source) => UserDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
