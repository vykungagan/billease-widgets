// ignore_for_file: file_names

import 'package:flutter/material.dart';

///text button
class BeTextButton extends StatelessWidget {
  const BeTextButton({
    super.key,
    required this.title,
    this.isSelected = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
    required this.onTap,
  });

  final String title;
  final bool isSelected;

  final EdgeInsetsGeometry padding;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.white30 : Colors.transparent,
        ),
        height: 50,
        alignment: Alignment.center,
        padding: padding,
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            //fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
