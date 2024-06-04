import 'package:app/shared/routes.dart';
import 'package:app/shared/styles.dart';
import 'package:app/store/cart_store.dart';
import 'package:app/store/category_store.dart';
import 'package:app/widgets/textos_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key, required this.nameCategory, required this.urlImage});
  final String nameCategory;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    final CategoryStore category = Provider.of<CategoryStore>(context);
    final CartRepository idpage = Provider.of<CartRepository>(context);
    return GestureDetector(
      onTap: () {
        idpage.setId(1);
        category.selectCategory(nameCategory);
        Navigator.of(context).pushNamed(Routes.home);
      },
      child: Container(
        width: 150,
        height: 100,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Styles.backgroud,
            borderRadius: BorderRadius.all(Radius.circular(Styles.borderB))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 85,
                alignment: Alignment.topCenter,
                child: TextCustom(text: nameCategory, sizeText: 16,alignment: TextAlign.left,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: SizedBox(
                height: 70,
                width: 65,
                child: Image.network(
                  urlImage,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
