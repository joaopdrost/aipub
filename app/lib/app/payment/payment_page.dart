import 'package:app/model/product_model.dart';
import 'package:app/model/ticket_model.dart';
import 'package:app/repository/ticket_repository.dart';
import 'package:app/shared/routes.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/cart_store.dart';
import 'package:app/store/payment_store.dart';
import 'package:app/widgets/back_button.dart';
import 'package:app/widgets/button_widget.dart';
import 'package:app/widgets/payment_widget.dart';
import 'package:app/widgets/textos_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

dynamic _productTotickets(
    context, List<Product> cart, total, CartRepository cartclear) {
  for (int i = 0; i < cart.length; i++) {
    tickets.add(Tickets(
        id: Uuid().v1(),
        name: cart[i].name,
        urlImage: cart[i].urlImage,
        qtd: cart[i].qtd));
  }
  cartclear.clearCart();

  Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.congratulations, (Route<dynamic> route) => false,
      arguments: {'total': total});
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final CartRepository cart = Provider.of<CartRepository>(context);
    final PaymentStore payment = Provider.of<PaymentStore>(context);

    final route =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    final double total = route['total'];

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              payment.setSelectedPayment('');
            },
            child: const BackButtonCustom(
              color: Colors.transparent,
            )),
        title: const TextCustom(
          text: 'Pagamento',
          sizeText: 32,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextCustom(text: 'Métodos'),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.newPayment),
                  child: TextCustom(
                    text: 'Adicionar novo',
                    color: Styles.primary,
                    sizeText: 16,
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: payment.getPayment().length,
                  itemBuilder: (context, i) =>
                      PaymentWidget(payment: payment.getPayment()[i])),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const TextCustom(
                              text: 'Total: ',
                              sizeText: 24,
                              bold: FontWeight.bold,
                            ),
                            TextCustom(
                              text: 'R\$ ${total.toStringAsFixed(2)}',
                              sizeText: 24,
                              bold: FontWeight.w200,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            payment.getSelectedPayment() == ''
                                ? null
                                : _productTotickets(
                                    context, cart.cart, total, cart);
                            payment.setSelectedPayment('');
                          },
                          child: ButtonWidget(
                            text: 'Finalizar compra',
                            sizeText: 24,
                            enable: payment.getSelectedPayment() == ''
                                ? false
                                : true,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
