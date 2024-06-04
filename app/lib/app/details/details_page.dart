import 'package:app/model/product_model.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/cart_store.dart';
import 'package:app/widgets/back_button.dart';
import 'package:app/widgets/button_widget.dart';
import 'package:app/widgets/textos_widget.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late CartRepository cart;
  int _qtd = 1;
  void _addCart(Product product, qtd, CartRepository cart) {
    cart.addCart(product, qtd); 
    Navigator.of(context).pop();
  }
  
  @override
  Widget build(BuildContext context) {
    cart = Provider.of<CartRepository>(context);
    final route =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    final Product product = route['product'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Center(
                      child: Container(
                        constraints: const BoxConstraints(maxHeight: 350),
                        child: Image.network(product.urlImage)),
                    ),
                    TextCustom(
                      text: product.name,
                      sizeText: 32,
                      bold: FontWeight.w500,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextCustom(text: product.description,
                      sizeText: 16,
                      alignment: TextAlign.justify,
                      bold: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Positioned(
              left: 5,
              top: 5,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: BackButtonCustom()))
          ]),
        ),
      ),

      bottomSheet: 
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Visibility(
                        replacement: const SizedBox(
                          width: 45,
                        ),
                        visible: _qtd > 1 ? true : false,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                _qtd--;
                              });
                            },
                            icon: const Icon(Icons.remove)),
                      ),
                      TextCustom(text:_qtd.toString(),sizeText: 16,),
                      Visibility(
                        replacement: const SizedBox(
                          width: 45,
                        ),
                        visible:  _qtd < (product.qtd - cart.getQtdProduct(product.id)) ? true : false,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                _qtd++;
                              });
                            },
                            icon: const Icon(Icons.add)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      _addCart(product, _qtd,cart);
                      Fluttertoast.showToast(
                                  msg: '${product.name} adicionado no carrinho😁 ',
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Styles.accent,
                                  textColor: Styles.backgroud,
                                  timeInSecForIosWeb: 2,
                                  fontSize: 18
                                  );                      
                    },
                    child: SizedBox(
                      height: 45,
                      child: ButtonWidget(
                        text:
                            'Adicionar R\$ ${(product.price * _qtd).toStringAsFixed(2)}',
                        sizeText: 20,
                      ),
                    ),
                  ),
                )
              ],
            ) ,
    );
  }
}
