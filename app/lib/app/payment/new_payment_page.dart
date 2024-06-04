import 'package:app/model/payment_model.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/payment_store.dart';
import 'package:app/widgets/back_button.dart';
import 'package:app/widgets/button_widget.dart';
import 'package:app/widgets/textos_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPaymentPage extends StatelessWidget {
  const NewPaymentPage({super.key, this.payment});
  final Payment? payment;

  @override
  Widget build(BuildContext context) {
    final PaymentStore paymentStore = Provider.of<PaymentStore>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const BackButtonCustom(
              color: Colors.transparent,
            )),
        title: const TextCustom(
          text: 'Novo cartão',
          sizeText: 32,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Styles.backgroud,
                child: TextFormField(
                
                
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(Styles.borderB))),
                    hintText: 'Número do cartão',

                    hintStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Styles.backgroud,
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Styles.borderB))),
                            hintText: 'Validade',
                            hintStyle: const TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Styles.backgroud,
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Styles.borderB))),
                            hintText: 'CVV',
                            hintStyle: const TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Styles.backgroud,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Styles.borderB))),
                      hintText: 'Nome do titular',
                      hintStyle: const TextStyle(fontSize: 18)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Styles.backgroud,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Styles.borderB))),
                      hintText: 'CPF/CNPJ do titular',
                      hintStyle: const TextStyle(fontSize: 18)),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: 'credito',
                  groupValue: 'credito',
                  onChanged: (value) {},
                ),
                const TextCustom(
                  text: 'Crédito',
                  sizeText: 18,
                ),
                Radio(
                  value: 'debito',
                  groupValue: 'debito',
                  onChanged: (value) {},
                ),
                const TextCustom(
                  text: 'Debito',
                  sizeText: 18,
                )
              ],
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
                          onTap: () {
                            paymentStore.setNewPayment(Payment(name: '', img: ''));
                          },
                          child: const ButtonWidget(
                            text: 'Salvar',
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
