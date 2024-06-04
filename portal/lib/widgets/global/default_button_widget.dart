import 'package:flutter/material.dart';
import 'package:portal/shared/styles.dart';

enum ButtonType {
  primary,
  secondary
}

class DefaultButton extends ElevatedButton {
  DefaultButton({
    super.key,
    void Function()? onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
    bool isTransparent = false,
    bool paddingZero = false,
    ButtonType? type = ButtonType.primary 
  }): super(
    onPressed: onPressed ?? (){},
    style: ButtonStyle(
      elevation: isTransparent ? MaterialStateProperty.all(0) : null,
      backgroundColor: MaterialStateProperty.all<Color>(
        isTransparent ? 
          Colors.transparent
            :
          type == ButtonType.primary ? Styles.primary : Styles.accent
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Styles.borderB)
        )
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        paddingZero ?
          EdgeInsets.zero
            :
          const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16
          )
      )
    )
  );

  factory DefaultButton.text(String text,{ void Function()? onPressed, ButtonType? type = ButtonType.primary}){
    return DefaultButton(
      type: type,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Styles.backgroud,
          fontSize: 24,
        ),
      ),
    );
  }

  factory DefaultButton.icon({String?  label, required Widget icon, void Function()? onPressed, bool isIconOnStart = true, double gapSize = 4, ButtonType? type = ButtonType.primary, bool isTransparent = false }){
    SizedBox gap = SizedBox(width: gapSize);

    if (label == null){
      return DefaultButton(
        paddingZero: true,
        type: type,
        onPressed: onPressed,
        isTransparent: isTransparent,
        child: icon,
      );
    }

    return DefaultButton(
      type: type,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isIconOnStart) ...[icon, gap],
          Text(
            label,
            style: TextStyle(
              color: Styles.backgroud,
              fontSize: 24,
            ),
          ),
          if (!isIconOnStart) ...[gap, icon]
        ],
      ),
    );
  }
}