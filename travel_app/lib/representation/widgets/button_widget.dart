import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, required this.textBtn, this.onTap, this.color, this.gradient}) : super(key: key);

  final String textBtn;
  final Function()? onTap;
  final Color? color;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: gradient == null ?
            Gradients.defaultGradientBackground :
            Gradients.defaultGradientButtonCancel,
        ),
        alignment: Alignment.center,
        child: Text(
          textBtn,
          style: color == null ?
            const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )
            : const TextStyle(
              color: ColorPalette.primaryColor,
              fontWeight: FontWeight.bold,
          )
        ),

      ),
    );
  }
}
