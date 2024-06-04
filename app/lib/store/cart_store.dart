import 'dart:collection';

import 'package:app/model/product_model.dart';
import 'package:flutter/foundation.dart';

class CartRepository extends ChangeNotifier {
  final List<Product> _cart = [];
  int _idpage = 0;

  UnmodifiableListView<Product> get cart => UnmodifiableListView(_cart);

  addCart(Product product, int qtd) {
    bool contem = false;

    for (int i = 0; i < _cart.length; i++) {
      if (_cart[i].id == product.id) {
        contem = true;
        break;
      } else {
        contem = false;
      }
    }

    if (contem == true) {
      _cart.forEach((element) {
        element.id == product.id
            ? element.qtd += qtd
            : element.qtd == element.qtd;
      });
    } else {
      _cart.add(Product(
          id: product.id,
          category: product.category,
          name: product.name,
          description: product.description,
          qtd: qtd,
          price: product.price,
          recipe: product.recipe,
          cost_price: product.cost_price,
          urlImage: product.urlImage));
    }
    notifyListeners();
  }

  removeCart(Product product) {
    _cart.removeWhere((element) => element.id == product.id);
    notifyListeners();
  }

  addUnidCart(Product product) {
    _cart.forEach((element) {
      element.id == product.id ? element.qtd++ : element.qtd == element.qtd;
    });
    notifyListeners();
  }

  removeUnidCart(Product product) {
    _cart.forEach((element) {
      element.id == product.id ? element.qtd-- : element.qtd == element.qtd;
    });
    notifyListeners();
  }

  clearCart() {
    _cart.clear();
    notifyListeners();
  }

  qtd(Product product) {
    int qtd = 0;
    for (int i = 0; i < _cart.length; i++) {
      if (product.id == _cart[i].id) {
        qtd = _cart[i].qtd;
      }
    }
    notifyListeners();
    return qtd;
  }

  idpage() {
    return _idpage;
  }

  setId(int id) {
    _idpage = id;
    notifyListeners();
  }

  getQtdProduct(id) {
    try {
      final product = _cart.firstWhere((element) => element.id == id);
      return product.qtd;
    } catch (e) {
      return 0;
    }
  }
}
