import 'package:app/app/appBar/appbar_page.dart';
import 'package:app/app/cart/cart_page.dart';
import 'package:app/app/congratulations/congratulations_page.dart';
import 'package:app/app/details/details_page.dart';
import 'package:app/app/login_page.dart';
import 'package:app/app/menu/menu_page.dart';
import 'package:app/app/payment/list_payment_page.dart';
import 'package:app/app/payment/new_payment_page.dart';
import 'package:app/app/payment/payment_page.dart';
import 'package:app/app/register/register_page.dart';
import 'package:app/app/tickets/ticket_page.dart';
import 'package:app/shared/routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aipub - Mobile',
      routes: {
      Routes.home: (context) => const AppBarPage(),
      Routes.details: (context) => const DetailsPage(),
      Routes.login: (context) => const LoginPage(),
      Routes.menu: (context) => const MenuPage(),
      Routes.payment: (context) => const PaymentPage(),
      Routes.congratulations: (context) => const CongratulationsPage(),
      Routes.tickets: (context) => const TicketPage(),
      Routes.cart: (context) => const CartPage(),
      Routes.register: (context) => const RegisterPage(),
      Routes.newPayment: (context) => const NewPaymentPage(),
      Routes.listPayment: (context) => const ListPaymentPage(),

    },
    initialRoute: Routes.login,
    debugShowCheckedModeBanner: false,
    );
  }
}
