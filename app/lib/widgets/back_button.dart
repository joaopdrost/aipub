import 'package:app/shared/styles.dart';
import 'package:flutter/material.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Styles.borderB)),
        color:color?? Styles.backgroud),
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      height: 40,
      width: 40,
      child: Center(
          child: Icon(
        Icons.arrow_back_ios_new,
        color:  Styles.primary,
        size: 26,
      )),
    );
  }
}
