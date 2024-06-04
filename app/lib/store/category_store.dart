
import 'package:app/model/category_model.dart';
import 'package:app/model/tokenization_model.dart';
import 'package:app/repository/category_repository.dart';
import 'package:app/repository/user_repository.dart';
import 'package:flutter/material.dart';

class CategoryStore extends ChangeNotifier {
  final CategoryRepository _repository = CategoryRepository();
  final UserRepository _repositoryUser = UserRepository();
  List<Category>? _category = [];
  String _categorySelected = 'Todos';

  Tokenization? token;

  category(String username, String password) async {
    token = await _repositoryUser.login(username, password);

    List<Category> category = await _repository.getCategory(token!.accessToken);
    notifyListeners();
    return _category = category;
  }

  getCategory() {
    return _category;
  }

  categorySelected() {
    return _categorySelected;
  }

  selectCategory(String nameCategory) {
    _categorySelected = nameCategory;
    notifyListeners();
  }
}











  // String _categorySelected = 'Todos';
  //   "Todos",
  //   "Drinks",
  //   "Petiscos",
  //   "Cerveja 600",
  //   "Cerveja LN",
  //   "Refris",
  //   "Cachaças",
  //   "Vodkas",
  //   "Vinhos",
  //   "Wisky",
  // ];