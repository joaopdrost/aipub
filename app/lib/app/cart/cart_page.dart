import 'package:app/shared/routes.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/cart_store.dart';
import 'package:app/store/product_store.dart';
import 'package:app/widgets/back_button.dart';
import 'package:app/widgets/button_widget.dart';
import 'package:app/widgets/product_widget.dart';
import 'package:app/widgets/textos_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartRepository cart;

  double total = 0;
  _somar(cart) {
    total = 0;
    for (var i in cart.cart) {
      total += i.price * i.qtd;
    }
  }

  @override
  Widget build(BuildContext context) {
    cart = Provider.of<CartRepository>(context);
    ProductStore product = Provider.of<ProductStore>(context);
    _somar(cart);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const BackButtonCustom(
              color: Colors.transparent,
            )),
        title: const TextCustom(
          text: 'Carrinho',
          sizeText: 32,
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                cart.clearCart();
                total = 0;
              });
            },
            child: Text(
              'Limpar',
              style: TextStyle(color: Styles.primary),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextCustom(text: 'Meus itens'),
                  GestureDetector(
                      onTap: () {
                        cart.setId(1);
                        Navigator.of(context).pushNamed(Routes.home);
                      },
                      child: TextCustom(
                        text: 'Adicionar item',
                        color: Styles.primary,
                        sizeText: 16,
                      )),
                ],
              ),
              cart.cart.isNotEmpty == true
                  ? Expanded(
                      child: ListView.builder(
                        reverse: false,
                        itemCount: cart.cart.length,
                        itemBuilder: (context, i) => ProductWidget(
                          product: cart.cart[i],
                          page: 'cart',
                        ).animate().scale(),
                      ),
                    )
                  : const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 85,
                          ),
                          TextCustom(text: 'Nada no carrinho'),
                        ],
                      ),
                    ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const TextCustom(text: 'Recomendações'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 250,
                        child: ProductWidget(
                          product: product.getproduct()[2],
                          page: 'recomendacao',
                        ),
                      ),
                      SizedBox(
                          width: 250,
                          child: ProductWidget(
                              product: product.getproduct()[0],
                              page: 'recomendacao')),
                      SizedBox(
                          width: 250,
                          child: ProductWidget(
                              product: product.getproduct()[1], page: 'recomendacao')),
                      SizedBox(
                          width: 250,
                          child: ProductWidget(
                              product: product.getproduct()[3], page: 'recomendacao')),
                      SizedBox(
                          width: 120,
                          child: GestureDetector(
                            onTap: () {
                              cart.setId(1);
                              Navigator.of(context).pushNamed(Routes.home);
                            },
                            child: Center(
                              child: TextCustom(
                                text: 'Ver todos...',
                                color: Styles.primary,
                                bold: FontWeight.bold,
                                sizeText: 16,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          const TextCustom(text: 'Total: ', bold: FontWeight.bold,),
                          TextCustom(
                            text: 'R\$ ${total.toStringAsFixed(2)}',
                            sizeText: 24,
                            bold: FontWeight.w200,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        onTap: cart.cart.isEmpty == true
                            ? () {}
                            : () {
                                Navigator.of(context).pushNamed(Routes.payment,
                                    arguments: {'total': total, 'page': 'cart'});
                              },
                        child: SizedBox(
                          height: 45,
                          child: ButtonWidget(
                            text: 'Continuar',
                            sizeText: 18,
                            enable: cart.cart.isEmpty == true ? false : true,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
