import 'package:app/shared/styles.dart';
import 'package:app/store/category_store.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonCategoryWidget extends StatelessWidget {
  const ButtonCategoryWidget({
    super.key,
    required this.text,
    this.icon,
    this.cor,
     this.sizeText, 
     this.selected,
  });
  final String text;
  final Icon? icon;
  final Color? cor;
  final double? sizeText;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<CategoryStore>(context);
    return GestureDetector(
      onTap: () => category.selectCategory(text) ,
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 50,
          minWidth: 80),
        padding: const EdgeInsets.only(left: 8, right: 8),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(45, 0, 0, 0)),
            color: selected == false ? Styles.backgroud : Styles.primary,
            borderRadius: BorderRadius.all(Radius.circular(Styles.borderXL))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ??
                Text(
                  text,
                  style: TextStyle(color: selected == false ?  Styles.primary : Styles.backgroud,
                  fontSize: sizeText?? 18,
                  ),
                )
          ],
        ),
      ),
    );
  }
}

