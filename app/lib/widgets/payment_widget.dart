import 'package:app/model/payment_model.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/payment_store.dart';
import 'package:app/widgets/textos_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({
    super.key,
    required this.payment,
  });
  final Payment payment;

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {

  @override
  Widget build(BuildContext context) {
    final PaymentStore paymentStore = Provider.of<PaymentStore>(context);
    return GestureDetector(
      onTap: () =>paymentStore.setSelectedPayment(widget.payment.name) ,
      child: Container(
        width: double.infinity,
        height: 70,
        margin: const EdgeInsets.only(top: 10, right: 5, left: 5),
        decoration: BoxDecoration(
            color: Styles.backgroud,
            borderRadius: BorderRadius.all(Radius.circular(Styles.borderB))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Styles.borderB),
                          bottomLeft: Radius.circular(Styles.borderB)),
                      child: Image.network(
                        widget.payment.img,
                        fit: BoxFit.scaleDown,
                      ))),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextCustom(
                        text: widget.payment.name,
                        sizeText: 20,
                        alignment: TextAlign.start,
                      ),
                      TextCustom(text: widget.payment.nunber?? '',sizeText: 14,alignment: TextAlign.start,)
                    ],
                  )),
            ),
            Container(
                child: Radio(
                  activeColor: Styles.primary,
                  value: widget.payment.name,
                  groupValue: paymentStore.getSelectedPayment(),
                  onChanged: (value) {
                    setState(() {
                      paymentStore.setSelectedPayment(value!) ;
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
