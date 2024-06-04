import 'package:app/model/product_model.dart';
import 'package:app/shared/routes.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/cart_store.dart';
import 'package:app/store/product_store.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product, required this.page});
  final Product product;
  final String page;

  @override
  Widget build(BuildContext context) {
    int _qtd = 0;
    late CartRepository cart;
    cart = Provider.of<CartRepository>(context);
    ProductStore productStore = Provider.of<ProductStore>(context);
    return GestureDetector(
      onTap: page != 'cart'
          ? () {
              Navigator.of(context)
                  .pushNamed(Routes.details, 
                  arguments: {'product': product});
            }
          : () {},
      child: Container(
        width: double.infinity,
        height: 96,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Styles.backgroud,
            borderRadius: BorderRadius.all(Radius.circular(Styles.borderB))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                height: 96,
                width: 86,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular( Styles.borderB) ,
                     bottomLeft:  Radius.circular( Styles.borderB)),
                  child: Image.network(product.urlImage,fit: BoxFit.fitHeight,))
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 16, overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      product.description,
                      maxLines: 2,
                      style:
                          const TextStyle(fontSize: 12, overflow: TextOverflow.fade),
                    ),
                    Text(
                      'R\$ ${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 16, overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: page == 'cart'
                  ? Row(
                      children: [
                        product.qtd == 1
                            ? IconButton(
                                onPressed: () => cart.removeCart(product),
                                icon: const Icon(Icons.delete_outline))
                            : IconButton(
                                onPressed: () => cart.removeUnidCart(product),
                                icon: const Icon(Icons.remove)),
                        Text('${product.qtd}'),
                        _qtd == cart.qtd
                            ? const SizedBox()
                            : IconButton(
                                onPressed:
                                product.qtd < productStore.getQtdProduct(product.id)
                                ? () => cart.addUnidCart(product) 
                                :() { Fluttertoast.showToast(
                                  msg: 'Só tem isso no estoque 😢',
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Styles.accent,
                                  textColor: Styles.backgroud,
                                  timeInSecForIosWeb: 2,
                                  fontSize: 18
                                  );    } ,
                                icon: const Icon(Icons.add)),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              cart.addCart(product, 1);
                              Fluttertoast.showToast(
                                  msg: '${product.name} adicionado no carrinho😁 ',
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Styles.accent,
                                  textColor: Styles.backgroud,
                                  timeInSecForIosWeb: 2,
                                  fontSize: 18
                                  );                      
                              },
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: Styles.primary,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(Routes.details,
                                  arguments: {'product': product});
                            },
                            icon: page == 'recomendacao' || page == 'cart'
                                ? const Text(' ')
                                : const Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
