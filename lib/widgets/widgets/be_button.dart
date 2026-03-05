import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/decor.dart';

class BeButton extends StatelessWidget {
  const BeButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
      this.height = 50.0,
      this.fontSize = 18.0});

  final String title;
  final EdgeInsetsGeometry padding;
  final GestureTapCallback onTap;
  final double? height, fontSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        color: AppColors.secondary,
        shape: Decor().buttonDecor(),
        margin: EdgeInsets.symmetric(
            horizontal: size.width > 770
                ? 23.0
                : size.width > 670
                    ? 20.0
                    : size.width > 450
                        ? 3.0
                        : 2.0,
            vertical: 5.0),
        child: Container(
          height: height,
          alignment: Alignment.center,
          padding: padding,
          child: Center(
              child: Text(
            title,
            style: TextStyle(
              color: AppColors.accent,
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
            ),
          )),
        ),
      ),
    );
  }
}
