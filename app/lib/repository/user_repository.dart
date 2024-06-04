import 'package:app/model/tokenization_model.dart';
import 'package:app/model/user_detail_model.dart';
import 'package:app/shared/api.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Future<Tokenization> login(String username, String password) async {
    
    final response = await api
        .post<Map<String, dynamic>>("/token/", data: {"username": username, "password": password});

    return Tokenization.fromMap(response.data!);
  }

  Future<UserDetail>getUserRoles(accessToken) async {
    final response = await api.get("/user-details/current",
      options:
        Options(
          headers: {"Authorization": 'Bearer $accessToken'}
        )
    );


    return UserDetail.fromMap((response.data)[0]);
  }
}
