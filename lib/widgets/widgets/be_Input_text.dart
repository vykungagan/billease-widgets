// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../theme/decor.dart';
import 'be_textView.dart';


///WeInputText is an default design for 'Input Text'.
class BeInputText extends StatelessWidget {
  const BeInputText({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.controller,
    this.infoTitle = '',
    this.onSubmitted,
    this.prefix = Icons.search,
    this.suffix = Icons.search,
    this.prefixString = '',
    this.showPrefix = false,
    this.showSuffix = false,
    this.showError = false,
    this.textInputType = TextInputType.text,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
    this.height = 50,
  });
  final bool showPrefix, showSuffix;
  final bool showError;
  final String hint, prefixString, infoTitle;
  final ValueChanged<String>? onChanged, onSubmitted;
  final IconData prefix, suffix;
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;
  final TextInputType textInputType;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (infoTitle.isNotEmpty) ...[
          BeTextview(title: infoTitle, error: infoTitle.contains('Should not')),
          const SizedBox(height: 2),
        ],
        Container(
          alignment: Alignment.center,
          padding: padding,
          height: height,
          decoration:
              showError ? Decor().onlyBorderError() : Decor().onlyBorder(),
          margin: const EdgeInsets.all(5),
          child: Center(
            child: TextField(
                decoration: Decor().inputDecor(hint,
                    showPrefix: showPrefix,
                    prefix: prefix,
                    prefixString: prefixString,
                    showSuffix: showSuffix,
                    suffix: suffix),
                style: TextDecor().inputTextStyle(),
                textAlignVertical: TextAlignVertical.center,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.search,
                autocorrect: false,
                autofocus: false,
                keyboardType: textInputType,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
                controller: controller),
          ),
        ),
      ],
    );
  }
}
