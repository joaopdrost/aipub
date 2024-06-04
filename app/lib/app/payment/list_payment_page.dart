import 'package:app/shared/routes.dart';
import 'package:app/store/payment_store.dart';
import 'package:app/widgets/back_button.dart';
import 'package:app/widgets/button_widget.dart';
import 'package:app/widgets/edit_payment_widget.dart';
import 'package:app/widgets/textos_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPaymentPage extends StatelessWidget {
  const ListPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentStore payment = Provider.of<PaymentStore>(context);

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
        
            Expanded(
              child: ListView.builder(
                  itemCount: payment.getPayment().length,
                  itemBuilder: (context, i) =>
                      EditPaymentWidget(payment: payment.getPayment()[i])),
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
                      
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, Routes.newPayment),
                          child: const ButtonWidget(
                            text: 'Cadastrar novo cartão',
                            sizeText: 24,
                           
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
