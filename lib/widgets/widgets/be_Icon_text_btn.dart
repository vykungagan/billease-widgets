import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/decor.dart';


class BeIconTextBtn extends StatelessWidget {
  const BeIconTextBtn({
    super.key,
    required this.asset,
    required this.title,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
    this.height = 50.0,
  });

  final EdgeInsetsGeometry padding;
  final GestureTapCallback onTap;
  final double height;
  final String asset, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center the content
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 2,
            color: AppColors.accent,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity, // Make it adapt to the grid cell's width
              height: 72,//60
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              margin: const EdgeInsets.all(5),
              child: Image.asset(
                asset,
                fit: BoxFit.contain, // Adjust as needed
                width: 45,//40
              ),
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            child: Text(title,
                style: TextDecor().homebuttonTextStyle(),
                maxLines: 1, // Prevent text overflow
                overflow: TextOverflow.ellipsis, // Add ellipsis for long text
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
