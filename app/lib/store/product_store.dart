import 'package:app/model/product_model.dart';
import 'package:app/model/tokenization_model.dart';
import 'package:app/repository/product_repository.dart';
import 'package:app/repository/user_repository.dart';
import 'package:flutter/material.dart';

class ProductStore extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository();
  final UserRepository _repositoryUser = UserRepository();
  List<Product>? _product = [];
  bool isLoadProduct = false;
  Tokenization? token;

  product(String username, String password) async {
    isLoadProduct = true;
    token = await _repositoryUser.login(username, password);

    List<Product> product = await _repository.getProduct(token!.accessToken);
    isLoadProduct = false;
    notifyListeners();
    return _product = product;
  }

  getproduct() {
    return _product;
  }

  getQtdProduct(id) {
    final product = _product!.firstWhere((element) => element.id == id);
    return product.qtd;
  }
}
