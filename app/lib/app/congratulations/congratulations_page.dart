import 'package:app/shared/routes.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/cart_store.dart';
import 'package:app/widgets/button_widget.dart';
import 'package:app/widgets/textos_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartRepository cart = Provider.of<CartRepository>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 128,
              ),
              TextCustom(
                text: 'Parabéns!!',
                color: Styles.primary,
                sizeText: 48,
              ),
              const TextCustom(text: 'Sua compra foi efetuada com sucesso!'),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  cart.setId(2);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.home, (Route<dynamic> route) => false);
                },
                child: const SizedBox(
                  height: 50,
                  child: ButtonWidget(
                    text: 'Consumir agora',
                    sizeText: 24,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  cart.setId(0);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.home, (Route<dynamic> route) => false);
                },
                child: const SizedBox(
                  height: 45,
                  child: TextCustom(
                    text: 'Voltar',
                    color: Colors.grey,
                    sizeText: 24,
                    ),)
              )
            ],
          )
        ],
      ),
    );
  }
}
