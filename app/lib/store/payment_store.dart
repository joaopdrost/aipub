import 'package:app/model/payment_model.dart';
import 'package:flutter/material.dart';

class PaymentStore extends ChangeNotifier {
  List<Payment> _payment = [
    Payment(
        name: 'Pix',
        img:
            'https://www.advocacianunes.com.br/wp-content/uploads/2022/04/logo-pix-icone-1024.png'),
    Payment(
        name: 'Cartão MP - Crédito',
        nunber: '*** *** *** *** 2469',
        img:
            'https://altarendablog.com.br/wp-content/uploads/2023/09/MERCADO-PAGO-CARTAOmdpi-1024x641.png'),
    Payment(
        name: 'Cartão Caixa - Débito',
        nunber: '*** *** *** *** 3541',
        img: 'https://www.caixa.gov.br/PublishingImages/visa-caixa-tem-v2.png'),
  ];

  String _selectedPayment = '';

  getSelectedPayment() {
    // notifyListeners();
    return _selectedPayment;
  }

  setSelectedPayment(payment) {
    _selectedPayment = payment;
    notifyListeners();
  }

  getPayment() {
    // notifyListeners();
    return _payment;
  }

  setNewPayment(Payment payment) {
    _payment.add(
        Payment(name: payment.name, img: payment.img, nunber: payment.nunber));
    notifyListeners();
  }
}
