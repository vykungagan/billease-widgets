import 'package:flutter/material.dart';

import '../../theme/colors.dart';


class BeTextview extends StatelessWidget {
  const BeTextview({super.key, required this.title, this.error = false});

  final String title;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Text(title,
            style: TextStyle(
                color: error ? AppColors.error : AppColors.secondary)));
  }
}
