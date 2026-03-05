import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/decor.dart';


class BeIconButton extends StatelessWidget {
  const BeIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
    this.height = 50.0,
  });

  final EdgeInsetsGeometry padding;
  final GestureTapCallback onTap;
  final double height;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: Decor().iconButtonDecoration(),
        margin: const EdgeInsets.all(5),
        child: Icon(
          icon,
          size: 30,
          color: AppColors.accent,
        ),
      ),
    );
  }
}
