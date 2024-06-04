import 'package:app/shared/styles.dart';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    this.icon,
     this.sizeText, 
     this.enable,
  });
  final String text;
  final Icon? icon;
  final double? sizeText;
  final bool? enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 2, right: 2),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: enable == null || enable == true ? Styles.primary : Colors.grey[600],
          borderRadius: BorderRadius.all(Radius.circular(Styles.borderB))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ??
              Text(
                text,
                style: TextStyle(color: Styles.backgroud, 
                fontSize: sizeText?? 13,
                ),
              )
        ],
      ),
    );
  }
}

