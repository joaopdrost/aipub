import 'package:app/app.dart';
import 'package:app/store/cart_store.dart';
import 'package:app/store/category_store.dart';
import 'package:app/store/payment_store.dart';
import 'package:app/store/product_store.dart';
import 'package:app/store/user_store.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CartRepository()),
      ChangeNotifierProvider(create: (context) => UserStore()),
      ChangeNotifierProvider(create: (context) => CategoryStore()),
      ChangeNotifierProvider(create: (context) => ProductStore()),
      ChangeNotifierProvider(create: (context) => PaymentStore()),
    ],
    child: const App(),
  ));
}
