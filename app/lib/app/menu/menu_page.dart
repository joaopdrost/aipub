import 'package:app/model/category_model.dart';
import 'package:app/model/product_model.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/category_store.dart';
import 'package:app/store/product_store.dart';
import 'package:app/widgets/back_button.dart';
import 'package:app/widgets/button_category_widget.dart';
import 'package:app/widgets/product_widget.dart';
import 'package:app/widgets/textos_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}
final TextEditingController _controller = TextEditingController();

validarCategoria(List<Category> category, Product product) {
  for (int i = 0; i < category.length; i++) {
    if (category[i].id == product.category) return category[i].name;
  }
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryStore>(context);
    final product = Provider.of<ProductStore>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Navigator.of(context).canPop()
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const BackButtonCustom(
                  color: Colors.transparent,
                ))
            : null,
        title: const TextCustom(
          text: 'Cardápio',
          sizeText: 32,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 3),
                width: double.infinity,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Styles.backgroud,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Styles.borderB))),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            border: InputBorder.none,
                            hintText: 'Buscar',
                            hintStyle:
                                TextStyle(color: Styles.text, fontSize: 20)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Styles.primary,
                          size: 35,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.getCategory().length,
                  primary: true,
                  itemBuilder: (context, i) => ButtonCategoryWidget(
                      text: category.getCategory()[i].name,
                      selected: category.categorySelected() ==
                          category.getCategory()[i].name),
                ),
              ),
              Expanded(
                flex: 13,
                child: ListView.builder(
                  itemCount: product.getproduct().length,
                  itemBuilder: (context, i) =>
                      category.categorySelected() == 'Todos'
                          ? ProductWidget(
                              product: product.getproduct()[i],
                              page: 'manu',
                            ).animate().scale()
                          : category.categorySelected() ==
                                  validarCategoria(category.getCategory(),
                                      product.getproduct()[i])
                              ? ProductWidget(
                                  product: product.getproduct()[i],
                                  page: 'manu',
                                ).animate().scale()
                              : const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
