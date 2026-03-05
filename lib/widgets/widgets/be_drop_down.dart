import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../../theme/decor.dart';
import 'be_textView.dart';

class BeDropDownMenu extends StatelessWidget {
  final List<String> dropdownItems;
  final String selectedDropdownItem, infoTitle;
  final ValueChanged<String?> onDropdownChanged;
  final double height, fontSize;
  final EdgeInsetsGeometry padding, margin;
  final Decoration? decoration;

  const BeDropDownMenu({
    super.key,
    this.height = 40.0,
    this.fontSize = 15,
    this.margin = const EdgeInsets.all(5),
    this.padding = const EdgeInsets.symmetric(horizontal: 7.0),
    required this.dropdownItems,
    required this.selectedDropdownItem,
    required this.onDropdownChanged,
    this.infoTitle = '',
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (infoTitle.isNotEmpty) ...[
          BeTextview(title: infoTitle, error: infoTitle.contains('Should not')),
          const SizedBox(height: 2),
        ],
        DropdownButtonHideUnderline(
            child: Container(
          height: height,
          decoration: decoration ?? Decor().onlyBorder(),
          margin: margin,
          padding: padding,
          child: DropdownButton<String>(
            value: selectedDropdownItem,
            onChanged: onDropdownChanged,
            items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value, // Ensure each value is unique
                child: Text(value,
                    style: TextStyle(
                        color: AppColors.secondary, fontSize: fontSize)),
              );
            }).toList(),
          ),
        )),
      ],
    );
  }
}
