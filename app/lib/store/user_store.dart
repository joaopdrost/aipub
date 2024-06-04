import 'package:app/enums/role.dart';
import 'package:app/model/tokenization_model.dart';
import 'package:app/model/user_detail_model.dart';
import 'package:app/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserStore extends ChangeNotifier {
  final UserRepository _repository = UserRepository();
  Tokenization? token;
  UserDetail? _userDetail;
  bool isLoading = false;
  String? error;

  get username => _userDetail?.firstname;
  get surname => _userDetail?.surname;

  login(
    String username,
    String password,
    Function onLogin
  ) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      token = await _repository.login(username, password);

      UserDetail userDetail =
          await _repository.getUserRoles(token!.accessToken);

      if (!userDetail.roles.any((el) => el == Role.user)) {
        throw Exception();
      }

      _userDetail = userDetail;
      onLogin();
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Ocorreu um erro😢",
          backgroundColor: const Color.fromARGB(167, 244, 67, 54),
          timeInSecForIosWeb: 2);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
